<template>
  <nav-bar/>
  <v-banner  class="text-h3 ma-10 banner" lines="one" text="Guide de plante">
  </v-banner>
  <v-text-field
    :loading="loading"
    density="compact"
    variant="solo"
    label="Recherche par nom"
    append-inner-icon="mdi-magnify"
    single-line
    hide-details
    class="ma-10"
    v-model="searchName"
    @keyup.enter="search(searchName)"
    @click:appendInner="search(searchName)"
    @update:modelValue="search(searchName)"
  ></v-text-field>
  <div class="d-flex justify-space-between ma-10">
  <v-btn
  v-for="type in typePlantes"
  variant="tonal"
  size="large"
  color="green"
  class="ma-2"
  :key="type.id"
  @click="getAllByTypePlante(type.id)">
    {{type.nom}}
    <v-tooltip
      activator="parent"
      location="top"
    >{{ type.description }}</v-tooltip>
  </v-btn>
  </div>
  <v-card
    class="mx-auto ma-10"
    max-width="95%"
  >
    <v-container fluid v-if="plantes.length > 0">
      <v-row dense >
        <v-col
          v-for="plante in plantes"
          :key="plante.id"
          cols="4"
        >
          <v-card>
            <v-card-title v-if="!plante.photo" v-text="plante.nom"></v-card-title>
            <v-img
              v-if="plante.photo"
              :src="pathPhoto + plante.photo"
              class="align-end"
              gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
              height="300px"
              cover
              alt="no img"
            >

              <v-card-title class="text-white" v-text="plante.nom"></v-card-title>
            </v-img>
            <v-card-subtitle v-text="plante.typePlante.nom" class="ma-3"></v-card-subtitle>
            <v-card-actions>
              <v-btn color="green">
                <router-link class="btn-router-link" :to="{ name: 'BibliothequePlanteItem', params: { idPlante:  plante.id }}">En savoir plus</router-link>
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
    <v-container v-if="plantes.length === 0 && error !== ''">{{ error }} </v-container>
  </v-card>
</template>

<script>
import axios from 'axios';
import NavBar from "@/layouts/navBar/NavBar";
import BibliothequePlante from "@/models/BibliothequePlante";
import TypePlante from "@/models/TypePlante";
import PhotoBibliothequePlante from "@/models/PhotoBibliothequePlante";

export default {
  name: "BibliothequePlanteComponent",
  components: {NavBar},
  beforeMount() {
    this.getPlantes();
    this.getTypePlante();
  },
  data () {
    return {
      searchName: "",
      typePlantes: [],
      plantes: [],
      pathPhoto: "/src/assets/photo-plante-bibliotheque/",
      error: '',
    }
  },
  methods:{
    getPlantes(){
      axios.get("http://127.0.0.1:9000/bibliotheque-plante/all")
        .then( rep => {
          if (rep.data) {
            this.plantes = [];
            for (const repKey in rep.data) {
              axios.get(`http://127.0.0.1:9000/photo-bibliotheque-plante/one/idPlante/${rep.data[repKey].id}`).then(
                photo => {
                  if (photo.status === 200) {
                    this.plantes.push(new BibliothequePlante(rep.data[repKey].id, rep.data[repKey].nom, rep.data[repKey].description, rep.data[repKey].typePlante, photo.data.photo))
                  }
                }
              ).catch(() => {
                let photoPng = new PhotoBibliothequePlante(1, "logo_app_x48.png", rep.data[repKey].id)
                this.plantes.push(new BibliothequePlante(rep.data[repKey].id, rep.data[repKey].nom, rep.data[repKey].description, rep.data[repKey].typePlante, photoPng.photo))
              })
            }
          }
        }).catch(() => {
        this.error = "Pas de plante référencée"
      })
    },
    getTypePlante(){
      axios.get("http://127.0.0.1:9000/type-plante/all")
        .then( rep => {
          if (rep.data) {
            for (const repKey in rep.data) {
              this.typePlantes.push(new TypePlante(rep.data[repKey].id, rep.data[repKey].description, rep.data[repKey].nom))
            }
          }
        }).catch(() => {
        this.error = "Pas de type référencé"
      })
    },
    getAllByTypePlante(typePlanteParam){
      axios.get("http://127.0.0.1:9000/bibliotheque-plante/all/byType/"+typePlanteParam)
        .then( rep => {
          if (rep.data) {
            this.plantes = [];
            for (const repKey in rep.data) {
              axios.get(`http://127.0.0.1:9000/photo-bibliotheque-plante/one/idPlante/${rep.data[repKey].id}`).then(
                photo => {
                  if (photo.status === 200) {
                    this.plantes.push(new BibliothequePlante(rep.data[repKey].id, rep.data[repKey].nom, rep.data[repKey].description, rep.data[repKey].typePlante, photo.data.photo))
                  }
                }
              ).catch(() => {
                let photoPng = new PhotoBibliothequePlante(1, "logo_app_x48.png", rep.data[repKey].id)
                this.plantes.push(new BibliothequePlante(rep.data[repKey].id, rep.data[repKey].nom, rep.data[repKey].description, rep.data[repKey].typePlante, photoPng.photo));
              })
            }
          }
        }).catch(() => {
        this.error = "Pas de type référencé"
      })
    },
    getPlanteByNom(nomPlante){

      axios.get("http://127.0.0.1:9000/bibliotheque-plante/all/byNom/"+nomPlante)
        .then( rep => {
          if (rep.data) {
            this.plantes = [];
            for (const repKey in rep.data) {
              axios.get(`http://127.0.0.1:9000/photo-bibliotheque-plante/one/idPlante/${rep.data[repKey].id}`).then(
                photo => {
                  if (photo.status === 200) {
                    this.plantes.push(new BibliothequePlante(rep.data[repKey].id, rep.data[repKey].nom, rep.data[repKey].description, rep.data[repKey].typePlante, photo.data.photo))
                  }
                }
              ).catch(() => {
                let photoPng = new PhotoBibliothequePlante(1, "logo_app_x48.png", rep.data[repKey].id)
                this.plantes.push(new BibliothequePlante(rep.data[repKey].id, rep.data[repKey].nom, rep.data[repKey].description, rep.data[repKey].typePlante, photoPng.photo));
              })
            }
          }
        }).catch(() => {
        this.error = "Pas de type référencé"
      })
    },
    search(nomPlante){
      if(nomPlante === ''){
        this.getPlantes()
      }
      else {
        this.getPlanteByNom(nomPlante)
      }
    }
  },

}
</script>

<style scoped>
.banner{line-height: normal}
.btn-router-link{
  text-decoration: none;
  color: forestgreen;
}
</style>
