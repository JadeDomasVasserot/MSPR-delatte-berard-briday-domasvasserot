<template>
  <nav-bar />
  <form @submit.prevent="getFormValues" v-if="plante" class="ma-10">
   <v-text-field disabled :model-value="plante.bibliothequePlante.nom"></v-text-field>
    <v-text-field
      v-model="localisation"
      :counter="10"
      label="Localisation"
    ></v-text-field>

    <v-btn
      class="me-4"
      type="submit"
    >
      Modifier
    </v-btn>

  </form>
</template>

<script>
import axios from 'axios';
import NavBar from "@/layouts/navBar/NavBar.vue";
import BibliothequePlante from "@/models/BibliothequePlante";
import PhotoBibliothequePlante from "@/models/PhotoBibliothequePlante";
import Plante from "@/models/Plante";
import Personne from "@/models/Personne";
import GuidePlante from "@/models/GuidePlante";

export default {
  name: "MesPlantesModifierComponent",
  components: {NavBar},
  props: ['idPlante'],
  beforeMount() {
    this.getUser();
    this.getPlanteId();
  },
  data() {
    return {
      localisation: null,
      plante: null,

    }
  },
  methods: {
    async getFormValues() {
      await axios.put(
        'http://127.0.0.1:9000/plante/update',
        {
          id: this.plante.id,
          localisation: this.localisation,
          proprietaire: this.user,
          bibliothequePlante: this.plante.bibliothequePlante
        },
        {
          withCredentials: false,
          headers: {
           'Authorization': 'Bearer ' +this.$store.state.token,
                    'Content-Type': 'application/json',
          }
        }
      ) .then( response => {
        this.$router.push({
          path: '/mes-plantes/'+ this.idPlante,
          query: this.$route.query,
          hash: this.$route.hash,
        })
      })
        .catch(() => {
          this.errorLogin = true;
        })
    },
    getUser(){
      axios.get("http://127.0.0.1:9000/personne/id/"+this.$store.state.user,
        {
          withCredentials: false,
          headers: {
            'Authorization': 'Bearer ' +this.$store.state.token,
                    'Content-Type': 'application/json',
          }
        })
        .then( rep => {
          if (rep.data) {
            this.user = new Personne(rep.data.id, rep.data.adresse,  rep.data.cp, rep.data.email, rep.data.mdp, rep.data.nom, rep.data.prenom, rep.data.ville, rep.data.role)
          }
        }).catch(() => {
        this.error = "Error"
      })
    },
    getPlanteId() {
      axios.get("http://127.0.0.1:9000/plante/id/" + this.idPlante,
        {
          withCredentials: false,
          headers: {
            'Authorization': 'Bearer ' +this.$store.state.token,
            'Content-Type': 'application/json',
          }
        })
        .then(rep => {
            if (rep.data) {
              this.plante = new Plante(rep.data.id, rep.data.localisation, rep.data.bibliothequePlante, rep.data.proprietaire)
              this.localisation = rep.data.localisation;
            }
          }
        ).catch(() => {
        this.error = "Pas de plante référencée"
      })
    },
  },

}
</script>
