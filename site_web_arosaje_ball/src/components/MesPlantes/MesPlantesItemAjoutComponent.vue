<template>
  <nav-bar />
  <form @submit.prevent="getFormValues()">
    <v-select
      @update:modelValue="getPlanteId()"
      v-if="plantes.length > 0"
      v-model="planteSelected"
      :items="nom"
      :key="plantes"
      label="Sélectionner une plante"
    ></v-select>
    <v-text-field
      v-model="localisation"
      :counter="10"
      label="Localisation"
    ></v-text-field>

    <v-btn
      class="me-4"
      type="submit"
    >
      Ajouter
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
  name: "MesPlantesAjoutComponent",
  components: {NavBar},
  beforeMount() {
    this.getBibliothequePlante();
    this.getUser();
  },
  data() {
    return {
      localisation: "",
      planteSelected: "",
      plantes: [],
      nom: [],
      user :"",
    }
  },
  methods: {
    getBibliothequePlante(){
      axios.get("http://127.0.0.1:9000/bibliotheque-plante/all",
        {
          withCredentials: false,
          headers: {
            'Authorization': 'Bearer ' +this.$store.state.token,
            'Content-Type': 'application/json',
          }
        })
        .then( rep => {
          if (rep.data) {
            this.plantes = [];
            for (const repKey in rep.data) {
             this.plantes.push(new BibliothequePlante(rep.data[repKey].id, rep.data[repKey].nom, rep.data[repKey].description, rep.data[repKey].typePlante))
              this.nom.push(rep.data[repKey].nom)
            }
          }
        }).catch(() => {
        this.error = "Pas de plante référencée"
      })
    },
    async getFormValues(submitEvent) {
      await axios.post(
        'http://127.0.0.1:9000/plante/add',
        {
          localisation: this.localisation,
          proprietaire: this.user,
          bibliothequePlante: this.planteSelected
        },
        {
          withCredentials: false,
          headers: {
            'Content-Type': 'application/json',
          }
        }
      ) .then( response => {
        if(response.status === 200) {
        }
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
      axios.get("http://127.0.0.1:9000/bibliotheque-plante/id/" + this.idPlante,
        {
          withCredentials: false,
          headers: {
            'Authorization': 'Bearer ' +this.$store.state.token,
            'Content-Type': 'application/json',
          }
        })
        .then(rep => {
            if (rep.data) {
              this.planteSelected = new BibliothequePlante(rep.data.id, rep.data.nom, rep.data.description, rep.data.typePlante)
            }
          }
        ).catch(() => {
        this.error = "Pas de plante référencée"
      })
    },
  },

}
</script>
