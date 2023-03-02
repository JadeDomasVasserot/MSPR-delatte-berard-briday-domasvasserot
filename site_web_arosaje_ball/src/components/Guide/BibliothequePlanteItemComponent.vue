<template>
  <nav-bar/>
  <v-banner lines="one" :stacked="false">
    <v-app-bar-title>Guide et conseil Plante</v-app-bar-title>
  </v-banner>
  <v-card v-if="plante !== null"
          class="ma-5"
          max-width="100%"
  >
    <v-row justify="center"  v-if=" 2 === role">
      <router-link :to="{ name: 'BibliothequePlanteModifier', params: { idPlante:  plante.id }}" class="text-decoration-none">
        <v-icon icon="mdi-pencil"
                class="ma-5 pa-5 border"
                size="x-large"
                color="green">
        </v-icon>
      </router-link>
      <router-link :to="{ name: 'BibliothequePlanteSupprimer', params: { idPlante:  plante.id }}" class="text-decoration-none">
        <v-icon icon="mdi-delete"
                class="ma-5 pa-5 border"
                size="x-large"
                color="green">
        </v-icon>
      </router-link>
    </v-row>
    <v-banner lines="one" :stacked="false">
      <v-card-title class="text-amber-darken-1 ma-3 font-weight-bold text-center" v-text="plante.nom"></v-card-title>
    </v-banner>
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
      {{ plante.typePlante.nom}}
      <v-tooltip
        activator="parent"
        location="top"
      >{{ plante.typePlante.description }}</v-tooltip>
    </v-card-title>

    <v-card-text>
      {{ plante.description}}
    </v-card-text>
    <v-container fluid v-if="guidePlantes !== null">
      <v-row dense>
        <v-col v-for="guide in guidePlantes"
          :keys="guide.id"
        >
          <v-card height="200px">
              <v-card-title v-text="guide.typeGuide.nom"></v-card-title >
            <v-card-subtitle>{{ guide.titre }}</v-card-subtitle>
            <v-divider></v-divider>
            <v-card-text>{{guide.description}}</v-card-text>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </v-card>
  <v-card v-if="role === 2 && plante !== null" class="pa-5">
    <div class="d-flex justify-center align-baseline" style="gap: 1rem">
      <v-file-input
        id="addPhoto"
        label="Ajouter une photo"
        variant="filled"
        prepend-icon="mdi-camera"
        color="success"
        @focusout="addPhoto(this)"
      ></v-file-input>
      <router-link :to="{name:'AjouterUnGuide', params: {
         idPlante:  idPlante
      }}">
      <v-btn
        color="success"
        prepend-icon="mdi-cloud-upload"
      >
      Ajouter un conseil
      </v-btn>
      </router-link>
    </div>
  </v-card>
</template>

<script>
import axios from 'axios';
import NavBar from "@/layouts/navBar/NavBar.vue";
import BibliothequePlante from "@/models/BibliothequePlante";
import PhotoBibliothequePlante from "@/models/PhotoBibliothequePlante";
import GuidePlante from "@/models/GuidePlante";

export default {
  name: "BibliothequePlanteItemComponent",
  props: ['idPlante'],
  components: {NavBar},

    beforeMount() {
    this.getPlanteId();
  },
  data() {
    return {
      guidePlantes: [],
      photos: [],
      plante: null,
      pathPhoto: "/src/assets/photo-plante-bibliotheque/",
      error: null,
      role: this.$store.state.role,
    }
  },
  methods: {
    getPlanteId() {
      axios.get("https://arosaje-mspr.mrartemus.cloud/bibliotheque-plante/id/" + this.idPlante,
        {
          withCredentials: false,
          headers: {
            'Authorization': 'Bearer ' +this.$store.state.token,
            'Content-Type': 'application/json',
          }
        })
        .then(rep => {
            if (rep.data) {
              this.plante = new BibliothequePlante(rep.data.id, rep.data.nom, rep.data.description, rep.data.typePlante);
              axios.get(`https://arosaje-mspr.mrartemus.cloud/photo-bibliotheque-plante/all/idPlante/${rep.data.id}`,
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
              axios.get(`https://arosaje-mspr.mrartemus.cloud/guide-plante/all/byPlante/${rep.data.id}`,
                {
                  withCredentials: false,
                  headers: {
                    'Authorization': 'Bearer ' +this.$store.state.token,
                    'Content-Type': 'application/json',
                  }
                }).then(
                guide => {
                  if (guide.status === 200) {
                    for (const guideKey in guide.data) {
                      this.guidePlantes.push(new GuidePlante(guide.data[guideKey].id, guide.data[guideKey].description, guide.data[guideKey].titre, guide.data[guideKey].typeGuide, guide.data[guideKey].bibliothequePlante));

                    }
                  }
                }
              ).catch(() => {

              })
            }
          }
        ).catch(() => {
        this.error = "Pas de plante référencée"
      })
    },
    getBase64Image(img) {
      var canvas = document.createElement("canvas");
      canvas.width = img.width;
      canvas.height = img.height;

      var ctx = canvas.getContext("2d");
      ctx.drawImage(img, 0, 0);

      var dataURL = canvas.toDataURL("image/png");

      return dataURL.replace(/^data:image\/(png|jpg);base64,/, "");
    },
    addPhoto() {
      const addPhoto = document.getElementById("addPhoto")
      let imgData = this.getBase64Image(addPhoto);
      localStorage.setItem("imgData", imgData);
    },
  }
}
</script>
