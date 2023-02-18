<template>
  <nav-bar/>
  <v-banner  class="text-h3 ma-10 banner" lines="one" text="Plante à garder">
  </v-banner>
  <v-text-field
    :loading="loading"
    density="compact"
    variant="solo"
    label="Recherche par nom"
    append-inner-icon="mdi-magnify"
    single-line
    hide-details
    class="ma-10 "
    id="nameSearch"
    v-model="name"
    @keyup.enter="searchName(name)"
    @click:appendInner="searchName(name)"
    @update:modelValue="searchName(name)"
  ></v-text-field>
  <v-text-field
    :loading="loading"
    density="compact"
    variant="solo"
    label="Recherche par ville"
    append-inner-icon="mdi-magnify"
    single-line
    hide-details
    class="ma-10"
    id="villeSearch"
    v-model="ville"
    @keyup.enter="searchVille(ville)"
    @click:appendInner="searchVille(ville)"
    @update:modelValue="searchVille(ville)"
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

              <v-card-title class="text-white" v-text="plante.bibliothequePlante.nom"></v-card-title>
            </v-img>
            <v-card-subtitle class="ma-3">{{plante.bibliothequePlante.typePlante.nom}} - {{ plante.localisation }}</v-card-subtitle>
            <v-card-subtitle class="ma-3"> {{plante.proprietaire.ville}}, {{plante.proprietaire.cp}}</v-card-subtitle>
            <v-card-actions>
              <v-btn color="green">
                <router-link class="btn-router-link" :to="{ name: 'PlanteItem', params: { idPlante:  plante.id }}">En savoir plus</router-link>
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
    <v-container v-if="plantes.length === 0 && error !== ''">{{ error }} </v-container>
  </v-card>
</template>

<script >
import NavBar from "@/layouts/navBar/NavBar.vue"
import axios from "axios";
import Plante from "@/models/Plante";
import BibliothequePlante from "@/models/BibliothequePlante";
import TypePlante from "@/models/TypePlante";
import PhotoPlante from "@/models/PhotoPlante";
export default {
  beforeMount() {
    this.getPlantes();
  },
  components: {NavBar},
  data () {
    return {
      name: "",
      ville:"",
      typePlantes: [],
      plantes: [],
      pathPhoto: "/src/assets/photo-plante/",
      error: '',
    }
  },
  methods:{
    getPlantes(){

      axios.get("http://127.0.0.1:9000/plante/a-garder/all")
        .then( rep => {
          if (rep.data) {
            this.plantes = [];
            for (const repKey in rep.data) {
              axios.get(`http://127.0.0.1:9000/photo-plante/one/idPlante/${rep.data[repKey].id}`).then(
                photo => {
                  if (photo.data) {
                    this.plantes.push(new Plante(rep.data[repKey].id, rep.data[repKey].localisation, rep.data[repKey].bibliothequePlante, rep.data[repKey].proprietaire, rep.data[repKey].statut, photo.data.photo))
                  }
                }
              ).catch(()=>{
                let photoPng = new PhotoPlante(1, "logo_app_x48.png", rep.data[repKey].id)
                this.plantes.push(new Plante(rep.data[repKey].id, rep.data[repKey].localisation, rep.data[repKey].bibliothequePlante, rep.data[repKey].proprietaire, rep.data[repKey].statut, photoPng.photo))

              })
            }
            console.log(this.plantes)
          }
        }).catch(() => {
        this.error = "Pas de plante à garder"
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
      axios.get("http://127.0.0.1:9000/plante/all/byType/"+typePlanteParam)
        .then( rep => {
          if (rep.data) {
            this.plantes = [];
            for (const repKey in rep.data) {
              axios.get(`http://127.0.0.1:9000/photo-plante/one/idPlante/${rep.data[repKey].id}`).then(
                photo => {
                  if (photo.data) {
                    this.plantes.push(new Plante(rep.data[repKey].id, rep.data[repKey].localisation, rep.data[repKey].bibliothequePlante, rep.data[repKey].proprietaire, rep.data[repKey].statut, photo.data.photo))
                  }
                }
              ).catch(() => {
                let photoPng = new PhotoPlante(1, "logo_app_x48.png", rep.data[repKey].id)
                this.plantes.push(new Plante(rep.data[repKey].id, rep.data[repKey].localisation, rep.data[repKey].bibliothequePlante, rep.data[repKey].proprietaire, rep.data[repKey].statut, photoPng.photo))

              })
            }
          }
        }).catch(() => {
        this.error = "Pas de type référencé"
      })
    },
    getPlanteByNom(nomPlante){

      axios.get("http://127.0.0.1:9000/plante/all/byNom/"+nomPlante)
        .then( rep => {
          if (rep.data) {
            this.plantes = [];
            for (const repKey in rep.data) {
              axios.get(`http://127.0.0.1:9000/photo-plante/one/idPlante/${rep.data[repKey].id}`).then(
                photo => {
                  if (photo.data) {
                    this.plantes.push(new Plante(rep.data[repKey].id, rep.data[repKey].localisation, rep.data[repKey].bibliothequePlante, rep.data[repKey].proprietaire, rep.data[repKey].statut, photo.data.photo))
                  }
                }
              ).catch(() => {
                let photoPng = new PhotoPlante(1, "logo_app_x48.png", rep.data[repKey].id)
                this.plantes.push(new Plante(rep.data[repKey].id, rep.data[repKey].localisation, rep.data[repKey].bibliothequePlante, rep.data[repKey].proprietaire, rep.data[repKey].statut, photoPng.photo))

              })
            }
          }
        }).catch(() => {
        this.error = "Pas de type référencé"
      })
    },
    getPlanteByVille(ville){

      axios.get("http://127.0.0.1:9000/plante/all/byVille/"+ville)
        .then( rep => {
          if (rep.data) {
            this.plantes = [];
            for (const repKey in rep.data) {
              axios.get(`http://127.0.0.1:9000/photo-plante/one/idPlante/${rep.data[repKey].id}`).then(
                photo => {
                  if (photo.data) {
                    this.plantes.push(new Plante(rep.data[repKey].id, rep.data[repKey].localisation, rep.data[repKey].bibliothequePlante, rep.data[repKey].proprietaire, rep.data[repKey].statut, photo.data.photo))
                  }

                }
              ).catch(() => {
                let photoPng = new PhotoPlante(1, "logo_app_x48.png", rep.data[repKey].id)
                this.plantes.push(new Plante(rep.data[repKey].id, rep.data[repKey].localisation, rep.data[repKey].bibliothequePlante, rep.data[repKey].proprietaire, rep.data[repKey].statut, photoPng.photo))
              })
            }
          }
        }).catch(() => {
        this.error = "Pas de type référencé"
      })
    },
    searchName(name){
      if(name === ''){
        this.getPlantes()
        document.getElementById("villeSearch").removeAttribute("disabled")
      }
      else {
        this.getPlanteByNom(name)
        document.getElementById("villeSearch").setAttribute("disabled", "")
      }
    },
    searchVille(ville){
      if(ville === ''){
        this.getPlantes()
        document.getElementById("nameSearch").removeAttribute("disabled")
      }
      else {
        this.getPlanteByVille(ville)
        document.getElementById("nameSearch").setAttribute("disabled", "")

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
