<template>
  <nav-bar/>
  <v-banner lines="one" :stacked="false">
    <v-app-bar-title>Plante à garder</v-app-bar-title>
  </v-banner>
  <div v-if="plante !== ''">
  <v-card
          class="ma-10"
          max-width="100%"
  >
    <v-banner lines="one" :stacked="false">
      <router-link class="text-decoration-none" :to="{name:'BibliothequePlanteItem', params: { idPlante:  plante.id}}">
        <v-card-title class="text-amber-darken-1 ma-3 font-weight-bold text-center"
                      v-text="plante.bibliothequePlante.nom"></v-card-title>
      </router-link>
    </v-banner>
    <v-carousel show-arrows="hover" v-if="photos.length > 0">
      <v-carousel-item
        v-for="(item) in photos"
        :key="item.id"
        :src="pathPhoto+item.photo"
      >
      </v-carousel-item>
    </v-carousel>
    <v-card-title>
      {{ plante.bibliothequePlante.typePlante.nom }}
      <v-tooltip
        activator="parent"
        location="top"
      >{{ plante.bibliothequePlante.typePlante.description }}
      </v-tooltip>
    </v-card-title>

    <v-card-text>
      {{ plante.bibliothequePlante.description }}
    </v-card-text>
  </v-card>
  <v-row>
    <v-col>
      <v-card class="ma-10" prepend-icon="mdi-account">
        <v-card-title> INFORMATION PROPRIETAIRE</v-card-title>
        <v-card-subtitle>{{ plante.proprietaire.nom }} {{ plante.proprietaire.prenom }}</v-card-subtitle>
        <v-card-text>{{ plante.proprietaire.ville }}, {{ plante.proprietaire.cp }}</v-card-text>
        <v-btn class="ma-5">CONTACTER</v-btn>
        <router-link  class="text-decoration-none" :to="{ name: 'PagePersonne', params: { idPersonne:  plante.proprietaire.id }}"> <v-btn class="ma-5">PROFIL</v-btn></router-link>
      </v-card>
    </v-col>
    <v-col>
      <v-card>
        <v-card-title> INFORMATION PLANTE</v-card-title>
        <v-card-subtitle>{{ plante.localisation }}</v-card-subtitle>
        <v-card-text>Date de la garde : </v-card-text>
        <v-btn class="ma-5">CONTACTER</v-btn>
      </v-card>
    </v-col>
  </v-row>
  </div>
</template>

<script>
import axios from 'axios';
import NavBar from "@/layouts/navBar/NavBar.vue";
import BibliothequePlante from "@/models/BibliothequePlante";
import PhotoBibliothequePlante from "@/models/PhotoBibliothequePlante";
import GuidePlante from "@/models/GuidePlante";
import Plante from "@/models/Plante";
import PhotoPlante from "@/models/PhotoPlante";

export default {
  name: "PlantesAgarderItemComponent",
  props: ['idPlante'],
  components: {NavBar},

  beforeMount() {
    this.getPlanteId();
  },
  data() {
    return {
      photos: [],
      plante: '',
      nom: '',
      pathPhoto: "/src/assets/photo-plante/",
      error: '',
    }
  },
  methods: {
    getPlanteId() {
      axios.get("http://127.0.0.1:9000/plante/id/" + this.idPlante,
        {
          withCredentials: false,
          headers: {
            'Authorization': 'Bearer ' + this.$store.state.token,
            'Content-Type': 'application/json',
          }
        })
        .then(rep => {
            if (rep.data) {
              this.plante = new Plante(rep.data.id, rep.data.localisation, rep.data.bibliothequePlante, rep.data.proprietaire, rep.data.statut);

              axios.get(`http://127.0.0.1:9000/photo-plante/all/idPlante/${rep.data.id}`,
                {
                  withCredentials: false,
                  headers: {
                    'Authorization': 'Bearer ' + this.$store.state.token,
                    'Content-Type': 'application/json',
                  }
                }).then(
                photo => {
                  if (photo.status === 200) {
                    for (const photoKey in photo.data) {
                      this.photos.push(new PhotoPlante(photo.data[photoKey].id, photo.data[photoKey].photo, photo.data[photoKey].plante));
                    }
                  }
                }
              ).catch(() => {

              })
            }
          }
        ).catch(() => {
        this.error = "Erreur plante"
      })
    },
  }
}
</script>
