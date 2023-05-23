<template>
  <nav-bar />

  <v-card v-if="plante">
    <v-card-title v-if="!plante.photo"> Êtes-vous sur de vouloir supprimer cette plante ? {{plante.nom}}</v-card-title>
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
    <v-card-actions>
      <v-btn @click="deletePlante()">Supprimer</v-btn>
    </v-card-actions>
  </v-card>
</template>

<script>
import axios from 'axios';
import NavBar from "@/layouts/navBar/NavBar.vue";
import Plante from "@/models/Plante";
import PhotoPlante from "@/models/PhotoPlante";

export default {
  name: "BibliothequePlanteComponent",
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
    }
  },
  methods: {
    getPlanteId() {
      axios.get("https://arosaje-back.jadedomasvasserot.com/plante/id/" + this.idPlante,
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
              axios.get(`https://arosaje-back.jadedomasvasserot.com/photo-plante/all/idPlante/${rep.data.id}`,
                {
                  withCredentials: false,
                  headers: {
                    'Authorization': 'Bearer ' +this.$store.state.token,
                    'Content-Type': 'application/json',
                  }
                }).then(
                photo => {
                  console.log(rep.data)
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
    deletePlante() {
      axios.delete("https://arosaje-back.jadedomasvasserot.com/plante/delete/" + this.idPlante,
        {
          withCredentials: false,
          headers: {
            'Authorization': 'Bearer ' +this.$store.state.token,
            'Content-Type': 'application/json',
          }
        })
        .then(rep => {
          this.$router.push({
            path: '/mes-plantes',
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
