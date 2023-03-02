<template>
  <nav-bar />
  <form @submit.prevent="getFormValues" v-if="plante">
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
import Plante from "@/models/Plante";
import Personne from "@/models/Personne";

export default {
  name: "BibliothequePlanteModifierComponent",
  components: {NavBar},
  props: ['idPlante'],
  beforeMount() {
    this.getUser();
    this.getPlanteId();
  },
  data() {
    return {
      localisation: "",
      plante: '',

    }
  },
  methods: {
    async getFormValues() {
      await axios.put(
        'https://arosaje-mspr.mrartemus.cloud/plante/update',
        {
          localisation: this.localisation,
          proprietaire: this.user,
          bibliothequePlante: this.plante.bibliothequePlante
        },
        {
          withCredentials: false,
          headers: {
            'Content-Type': 'application/json',
          }
        }
      ) .then( response => {
        this.$router.push({
          path: '/mes-plantes',
          query: this.$route.query,
          hash: this.$route.hash,
        })
      })
        .catch(() => {
          this.errorLogin = true;
        })
    },
    getUser(){
      axios.get("https://arosaje-mspr.mrartemus.cloud/personne/id/"+this.$store.state.user,
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
      axios.get("https://arosaje-mspr.mrartemus.cloud/plante/id/" + this.idPlante,
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
