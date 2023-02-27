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
      <v-card class="ma-10" prepend-icon="mdi-flower-tulip">
        <v-card-title> INFORMATION PLANTE</v-card-title>
        <v-card-subtitle>{{ plante.localisation }}</v-card-subtitle>
        <v-card-text>Date de la garde : {{garde.dateDebut}} à {{garde.dateFin}}</v-card-text>
        <v-btn @click="dialog = true" class="ma-5">GARDER</v-btn>
      </v-card>
    </v-col>
  </v-row>
  </div>
  <v-dialog
    v-model="dialog"
    width="auto"
  >
    <v-card>
      <v-card-title> Garde d'une {{plante.bibliothequePlante.nom}} / {{plante.bibliothequePlante.typePlante.nom}}</v-card-title>
      <v-card-subtitle>
        La garde est du {{garde.dateDebut}} au {{garde.dateFin}}
      </v-card-subtitle>
      <v-card-text> Vous vous engagez à garder cette plante en appuyant sur le bouton</v-card-text>
      <v-card-text>Pour plus d'informations pour comment garder cette {{plante.bibliothequePlante.nom}} --> <router-link :to="{ name: 'BibliothequePlanteItem', params: { idPlante:  plante.bibliothequePlante.id }}">ICI</router-link></v-card-text>
      <v-card-actions>
        <v-btn color="green" block @click="addGarde()">Garder</v-btn>
      </v-card-actions>
      <v-card-actions>
        <v-btn color="green" block @click="dialog = false">Fermer</v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
import axios from 'axios';
import NavBar from "@/layouts/navBar/NavBar.vue"
import Plante from "@/models/Plante";
import PhotoPlante from "@/models/PhotoPlante";
import GardePlante from "@/models/GardePlante";

export default {
  name: "PlantesAgarderItemComponent",
  props: ['idGarde'],
  components: {NavBar},

  beforeMount() {
    this.getPlanteId();
  },
  data() {
    return {
      dialog: false,
      photos: [],
      plante: '',
      garde: '',
      nom: '',
      pathPhoto: "/src/assets/photo-plante/",
      error: '',
    }
  },
  methods: {
    getPlanteId() {
      axios.get("http://127.0.0.1:9000/garde-plante/id/" + this.idGarde,
        {
          withCredentials: false,
          headers: {
            'Authorization': 'Bearer ' + this.$store.state.token,
            'Content-Type': 'application/json',
          }
        })
        .then(rep => {
            if (rep.data) {
              this.plante = new Plante(rep.data.plante.id, rep.data.plante.localisation, rep.data.plante.bibliothequePlante, rep.data.plante.proprietaire, rep.data.plante.statut);
              this.garde = new GardePlante(rep.data.id,rep.data.dateDebut, rep.data.dateFin, rep.data.gardien, rep.data.plante, rep.data.status)
              axios.get(`http://127.0.0.1:9000/photo-plante/all/idPlante/${rep.data.plante.id}`,
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
    addGarde() {
      axios.put("http://127.0.0.1:9000/garde-plante/"+this.garde.id+"/update/gardien/"+this.$store.state.user+"/status",
        {
          withCredentials: false,
          headers: {
            'Authorization': 'Bearer ' + this.$store.state.token,
            'Content-Type': 'application/json',
          }
        })
        .then(rep => {
          this.dialog = false
          }
        ).catch(() => {
        this.error = "Erreur plante"
      })
    }
  }
}
</script>
