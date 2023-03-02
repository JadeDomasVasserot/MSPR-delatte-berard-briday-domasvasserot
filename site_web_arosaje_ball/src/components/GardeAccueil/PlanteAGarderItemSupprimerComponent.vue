<template>
  <nav-bar />

  <v-card v-if="plante">
    <v-card-title v-if="!plante.photo"> Êtes-vous sur de vouloir supprimer cette garde ? {{plante.plante.bibliothequePlante.nom}}</v-card-title>
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
      Date de la garde
    </v-card-title>

    <v-card-text>
      {{ plante.dateDebut}} à {{plante.dateFin}}
    </v-card-text>
    <v-card-actions>
      <v-btn @click="deletePlante()">Supprimer</v-btn>
    </v-card-actions>
  </v-card>
</template>

<script>
import axios from 'axios';
import NavBar from "@/layouts/navBar/NavBar.vue";
import PhotoBibliothequePlante from "@/models/PhotoBibliothequePlante";
import GardePlante from "@/models/GardePlante";

export default {
  name: "PlanteAGarderItemSupprimerComponent",
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
      axios.get("http://127.0.0.1:9000/garde-plante/id/" + this.idPlante,
        {
          withCredentials: false,
          headers: {
            'Authorization': 'Bearer ' +this.$store.state.token,
            'Content-Type': 'application/json',
          }
        })
        .then(rep => {
            if (rep.data) {
              this.plante = new GardePlante(rep.data.id,rep.data.dateDebut, rep.data.dateFin, rep.data.gardien, rep.data.plante, rep.data.statut)
              axios.get(`http://127.0.0.1:9000/photo-plante/all/idPlante/${rep.data.plante.id}`,
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
                      this.photos.push(new PhotoBibliothequePlante(photo.data[photoKey].id, photo.data[photoKey].photo, photo.data[photoKey].bibliothequePlante));
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
      axios.delete("http://127.0.0.1:9000/garde-plante/delete/" + this.idPlante,
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
