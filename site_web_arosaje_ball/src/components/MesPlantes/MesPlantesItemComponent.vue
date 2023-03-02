<template>
  <nav-bar/>
  <v-banner lines="one" :stacked="false" v-if="plante !== null">
    <v-card-title class="text-amber-darken-1 ma-3 font-weight-bold text-center" v-text="plante.bibliothequePlante.nom"></v-card-title>
  </v-banner>
  <v-card v-if="plante !== null"
          class="ma-10"
          max-width="100%"
  >
    <v-row justify="center" class="mb-10" v-if="plante.proprietaire.id === user">
      <router-link :to="{ name: 'ModifiePlante', params: { idPlante:  plante.id }}" class="text-decoration-none">
        <v-icon icon="mdi-pencil"
                class="ma-5 pa-5 border"
                size="x-large"
                color="green">
        </v-icon>
      </router-link>
      <router-link :to="{ name: 'SupprimePlante', params: { idPlante:  plante.id }}" class="text-decoration-none">
        <v-icon icon="mdi-delete"
                class="ma-5 pa-5 border"
                size="x-large"
                color="green">
        </v-icon>
      </router-link>
      <router-link :to="{ name: 'GarderPlante', params: { idPlante:  plante.id }}" class="text-decoration-none">
      <v-btn class="ma-5 border">Faire garder</v-btn>
      </router-link>
    </v-row>
    <v-carousel show-arrows="hover" v-if="photos.length > 0">
      <v-carousel-item
        v-for="(item) in photos"
        :key="item.id"
        :src="pathPhoto+item.photo"
      >
      </v-carousel-item>
    </v-carousel>
    <v-carousel show-arrows="hover" v-if="photos.length === 0">
      <v-carousel-item
        src="/src/assets/logo_app.png"
      >
      </v-carousel-item>
    </v-carousel>
    <v-card-title>
      {{ plante.bibliothequePlante.typePlante.nom}}
      <v-tooltip
        activator="parent"
        location="top"
      >{{ plante.bibliothequePlante.typePlante.description }}</v-tooltip>
    </v-card-title>

    <v-card-text>
      {{ plante.bibliothequePlante.description}}
    </v-card-text>
    <v-card-text>
      {{ plante.localisation}}
    </v-card-text>
  </v-card>
</template>

<script>
import axios from 'axios';
import NavBar from "@/layouts/navBar/NavBar.vue";
import Plante from "@/models/Plante";
import PhotoPlante from "@/models/PhotoPlante";

export default {
  name: "PlanteItemComponent",
  props: ['idPlante'],
  components: {NavBar},

  beforeMount() {
    this.getPlanteId();
  },
  data() {
    return {
      photos: [],
      plante: null,
      pathPhoto: "/src/assets/photo-plante/",
      error: null,
      user: this.$store.state.user,
      role: this.$store.state.role,

    }
  },
  methods: {
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

              axios.get(`http://127.0.0.1:9000/photo-plante/all/idPlante/${rep.data.id}`,
                {
                  withCredentials: false,
                  headers: {
                    'Authorization': 'Bearer ' +this.$store.state.token,
                    'Content-Type': 'application/json',
                  }
                }).then(
                photo => {
                  if (photo.status === 200) {
                    for (const photoKey in photo.data) {
                      this.photos.push(new PhotoPlante(photo.data[photoKey].id, photo.data[photoKey].photo, photo.data[photoKey].bibliothequePlante));
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
