<template>
  <nav-bar />
  <v-row justify="center" class="ma-10">
    <v-date-picker v-model="picker" is-range></v-date-picker>
  </v-row>
  <v-row justify="center" class="mt-10">
  <v-btn @click="addGarde()" > Ajouter la garde </v-btn>
  </v-row>
</template>

<script>
import axios from 'axios';
import NavBar from "@/layouts/navBar/NavBar.vue";
import Plante from "@/models/Plante";
import PhotoPlante from "@/models/PhotoPlante";
import Personne from "@/models/Personne";
import StatutPlante from "@/models/StatutPlante";

export default {
  name: "MesPlantesItemGardeComponent",
  props: ['idPlante'],
  components: {NavBar},
  beforeMount() {
    this.getPlanteId();
    this.getUser();
    this.getStatutAGarde();
  },
  data () {
    return {
      picker: new Date(),
      photos: [],
      plante: null,
      pathPhoto: "/src/assets/photo-plante/",
      error: null,
      user:null,
      statut: null,
    }
  },
  methods: {
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
    getStatutAGarde(){
      axios.get("http://127.0.0.1:9000/statut-plante/id/2",
        {
          withCredentials: false,
          headers: {
            'Authorization': 'Bearer ' +this.$store.state.token,
            'Content-Type': 'application/json',
          }
        })
        .then( rep => {
          if (rep.data) {
            this.statut = new StatutPlante(rep.data.id, rep.data.nom)
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
              this.plante = new Plante(rep.data.id, rep.data.localisation, rep.data.bibliothequePlante, rep.data.proprietaire, rep.data.statut);
            }
          }
        ).catch(() => {
        this.error = "Erreur plante"
      })
    },
    addGarde() {
      axios.post("http://127.0.0.1:9000/garde-plante/add",
        {
          plante: this.plante,
          proprietaire: this.user,
          bibliothequePlante: this.plante.bibliothequePlante,
          dateDebut: this.picker.start,
          dateFin: this.picker.end,
          statut: this.statut
        },
        {
          withCredentials: false,
          headers: {
            'Authorization': 'Bearer ' +this.$store.state.token,
            'Content-Type': 'application/json',
          }
        })
        .then(rep => {
          this.$router.push({
            path: '/mes-gardes',
            query: this.$route.query,
            hash: this.$route.hash,
          })
          }
        ).catch(() => {
        this.error = "Erreur plante"
      })
    },
  }
}
</script>
