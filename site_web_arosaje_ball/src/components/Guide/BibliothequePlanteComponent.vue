<template>
  <nav-bar/>
  <v-banner  class="text-h3 ma-10 banner" lines="one" text="Guide de plante">
  </v-banner>
  <v-text-field
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
  <div class="d-flex justify-space-between ma-10" v-if="role !== null && role === 2">
    <router-link  class="text-decoration-none" :to="{ name: 'BibliothequePlanteAdd'}">
      <v-btn
        variant="elevated"
        size="large"
        color="green"
        class="ma-2">
        Ajouter une plante
      </v-btn>
    </router-link>
  </div>
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
    <v-container fluid v-if="plantes !== null">
      <v-row dense >
        <v-col
          v-for="plante in plantes"
          :key="plante.id"
          cols="4"
        >
          <v-card>
            <v-card-title v-if="!plante.photo">{{plante.nom}}</v-card-title>
            <v-img
              v-if="plante.photo"
              :src="pathPhoto + plante.photo"
              class="align-end"
              gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
              height="300px"
              cover
              alt="no img"
            >

              <v-card-title class="text-white">{{plante.nom}}</v-card-title>
            </v-img>
            <v-card-subtitle class="ma-3">{{plante.typePlante.nom}}</v-card-subtitle>
            <v-card-actions>
              <v-btn color="green">
                <router-link class="btn-router-link" :to="{ name: 'BibliothequePlanteItem', params: { idPlante:  plante.id }}">En savoir plus</router-link>
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
    <v-container v-if="plantes.length === 0 && error !== null">{{ error }} </v-container>
  </v-card>
</template>

<script>
import axios from 'axios';
import NavBar from "@/layouts/navBar/NavBar.vue";
import BibliothequePlante from "@/models/BibliothequePlante";
import TypePlante from "@/models/TypePlante";
import PhotoBibliothequePlante from "@/models/PhotoBibliothequePlante";
import Personne from "@/models/Personne";

export default {
  name: "BibliothequePlanteComponent",
  components: {NavBar},
  beforeMount() {
    this.getPlantes();
    this.getTypePlante();
  },
  data () {
    return {
      searchName: null,
      typePlantes: [],
      role:this.$store.state.role,
      plantes: [],
      pathPhoto: "/src/assets/photo-plante-bibliotheque/",
      error: null,
    }
  },
  methods:{
    getPlantes(){
      axios.get("https://arosaje-mspr.mrartemus.cloud/bibliotheque-plante/all",
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
              axios.get(`https://arosaje-mspr.mrartemus.cloud/photo-bibliotheque-plante/one/idPlante/${rep.data[repKey].id}`,
                {
                  withCredentials: false,
                  headers: {
                    'Authorization': 'Bearer ' +this.$store.state.token,
                    'Content-Type': 'application/json',
                  }
                }).then(
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
      axios.get("https://arosaje-mspr.mrartemus.cloud/type-plante/all",
        {
          withCredentials: false,
          headers: {
            'Authorization': 'Bearer ' +this.$store.state.token,
            'Content-Type': 'application/json',
          }
        })
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
      axios.get("https://arosaje-mspr.mrartemus.cloud/bibliotheque-plante/all/byType/"+typePlanteParam,
        {
          withCredentials: false,
          headers: {
            'Authorization': 'Bearer ' +this.$store.state.token,
            'Content-Type': 'application/json',
          }
        })
        .then( rep => {
          if (rep.data && rep.status === 200) {
            this.plantes = [];
            for (const repKey in rep.data) {
              axios.get(`https://arosaje-mspr.mrartemus.cloud/photo-bibliotheque-plante/one/idPlante/${rep.data[repKey].id}`,
                {
                  withCredentials: false,
                  headers: {
                    'Authorization': 'Bearer ' +this.$store.state.token,
                    'Content-Type': 'application/json',
                  }
                }).then(
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
          else if (rep.status === 204){
            this.error = "Pas de plante de ce type"
          }
        }).catch(() => {
        this.error = "Pas de type référencé"
      })
    },
    getPlanteByNom(nomPlante){

      axios.get("https://arosaje-mspr.mrartemus.cloud/bibliotheque-plante/all/byNom/"+nomPlante,
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
              axios.get(`https://arosaje-mspr.mrartemus.cloud/photo-bibliotheque-plante/one/idPlante/${rep.data[repKey].id}`,
                {
                  withCredentials: false,
                  headers: {
                    'Authorization': 'Bearer ' +this.$store.state.token,
                    'Content-Type': 'application/json',
                  }
                }).then(
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
    },
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
