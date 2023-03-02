<template>
  <nav-bar/>
  <v-banner  class="text-h3 ma-10 banner" lines="one" text="Plante à garder">
  </v-banner>
  <v-text-field
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
    <v-container fluid v-if="garde.length > 0">
      <v-row dense >
        <v-col
          v-for="plante in garde"
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

              <v-card-title class="text-white" v-text="plante.plante.bibliothequePlante.nom"></v-card-title>
            </v-img>
            <v-card-subtitle class="ma-3">{{plante.plante.bibliothequePlante.typePlante.nom}} - {{ plante.plante.localisation }}</v-card-subtitle>
            <v-card-subtitle class="ma-3"> {{plante.plante.proprietaire.ville}}, {{plante.plante.proprietaire.cp}}</v-card-subtitle>
            <v-card-subtitle class="ma-3"> {{plante.dateDebut}} au {{plante.dateFin}}</v-card-subtitle>

            <v-card-actions>
              <v-btn color="green">
                <router-link class="btn-router-link" :to="{ name: 'PlantesAGarderItem', params: { idGarde:  plante.id }}">En savoir plus</router-link>
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
    <v-container v-if="garde.length === 0 && error !== ''">{{ error }} </v-container>
  </v-card>
</template>

<script >
import NavBar from "@/layouts/navBar/NavBar.vue"
import axios from "axios";
import TypePlante from "@/models/TypePlante";
import PhotoPlante from "@/models/PhotoPlante";
import GardePlante from "@/models/GardePlante";
export default {
  beforeMount() {
    this.getPlantes();
    this.getTypePlante();
  },
  components: { NavBar},
  data () {
    return {
      name: "",
      ville:"",
      typePlantes: [],
      garde: [],
      pathPhoto: "/src/assets/photo-plante/",
      error: '',
    }
  },
  methods:{
    getPlantes(){
      axios.get("https://arosaje-mspr.mrartemus.cloud/garde-plante/all/byAGarder",
        {
          withCredentials: false,
          headers: {
            'Authorization': 'Bearer ' +this.$store.state.token,
            'Content-Type': 'application/json',
          }
        })
        .then( rep => {
          if (rep.data) {
            this.garde = [];
            for (const repKey in rep.data) {
              axios.get(`https://arosaje-mspr.mrartemus.cloud/photo-plante/one/idPlante/${rep.data[repKey].plante.id}`,
                {
                  withCredentials: false,
                  headers: {
                    'Authorization': 'Bearer ' +this.$store.state.token,
                    'Content-Type': 'application/json',
                  }
                }).then(
                photo => {
                  if (photo.data) {
                    this.garde.push(new GardePlante(rep.data[repKey].id,rep.data[repKey].dateDebut, rep.data[repKey].dateFin, rep.data[repKey].gardien, rep.data[repKey].plante, rep.data[repKey].statut, photo.data.photo))
                  }
                }
              ).catch(()=>{
                let photoPng = new PhotoPlante(1, "logo_app_x48.png", rep.data[repKey].id)
                this.garde.push(new GardePlante(rep.data[repKey].id,rep.data[repKey].dateDebut, rep.data[repKey].dateFin, rep.data[repKey].gardien, rep.data[repKey].plante, rep.data[repKey].statut, photoPng.photo))

              })
            }
          }
        }).catch(() => {
        this.error = "Pas de plante à garder"
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
      axios.get("https://arosaje-mspr.mrartemus.cloud/garde-plante/a-garder/byTypePlante/"+typePlanteParam,
        {
          withCredentials: false,
          headers: {
            'Authorization': 'Bearer ' +this.$store.state.token,
            'Content-Type': 'application/json',
          }
        })
        .then( rep => {
          if (rep.data && rep.status === 200) {
            this.garde = [];
            for (const repKey in rep.data) {
              axios.get(`https://arosaje-mspr.mrartemus.cloud/photo-plante/one/idPlante/${rep.data[repKey].id}`,
                {
                  withCredentials: false,
                  headers: {
                    'Authorization': 'Bearer ' +this.$store.state.token,
                    'Content-Type': 'application/json',
                  }
                }).then(
                photo => {
                  if (photo.data) {
                    this.garde.push(new GardePlante(rep.data[repKey].id,rep.data[repKey].dateDebut, rep.data[repKey].dateFin, rep.data[repKey].gardien, rep.data[repKey].plante, rep.data[repKey].statut, photo.data.photo))
                  }
                }
              ).catch(() => {
                let photoPng = new PhotoPlante(1, "logo_app_x48.png", rep.data[repKey].id)
                this.garde.push(new GardePlante(rep.data[repKey].id,rep.data[repKey].dateDebut, rep.data[repKey].dateFin, rep.data[repKey].gardien, rep.data[repKey].plante, rep.data[repKey].statut, photoPng.photo))

              })
            }
          }
          else if (rep.status === 204){
            this.error = "Pas de plante de ce type à garder"
          }
        }).catch(() => {
        this.error = "Pas de type référencé"
      })
    },
    getPlanteByNom(nomPlante){
      this.garde = [];
      axios.get("https://arosaje-mspr.mrartemus.cloud/garde-plante/a-garder/byNom/"+nomPlante,
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
              axios.get(`https://arosaje-mspr.mrartemus.cloud/photo-plante/one/idPlante/${rep.data[repKey].id}`,
                {
                  withCredentials: false,
                  headers: {
                    'Authorization': 'Bearer ' +this.$store.state.token,
                    'Content-Type': 'application/json',
                  }
                }).then(
                photo => {
                  if (photo.data) {
                    this.garde.push(new GardePlante(rep.data[repKey].id,rep.data[repKey].dateDebut, rep.data[repKey].dateFin, rep.data[repKey].gardien, rep.data[repKey].plante, rep.data[repKey].statut, photo.data.photo))
                  }
                }
              ).catch(() => {
                let photoPng = new PhotoPlante(1, "logo_app_x48.png", rep.data[repKey].id)
                this.garde.push(new GardePlante(rep.data[repKey].id,rep.data[repKey].dateDebut, rep.data[repKey].dateFin, rep.data[repKey].gardien, rep.data[repKey].plante, rep.data[repKey].statut, photoPng.photo))

              })
            }
          }
        }).catch(() => {
        this.error = "Pas de type référencé"
      })
    },
    getPlanteByVille(ville){
      this.garde = [];
      axios.get("https://arosaje-mspr.mrartemus.cloud/garde-plante/a-garder/byVille/"+ville,
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
              axios.get(`https://arosaje-mspr.mrartemus.cloud/photo-plante/one/idPlante/${rep.data[repKey].id}`,
                {
                  withCredentials: false,
                  headers: {
                    'Authorization': 'Bearer ' +this.$store.state.token,
                    'Content-Type': 'application/json',
                  }
                }).then(
                photo => {
                  if (photo.data) {
                    this.garde.push(new GardePlante(rep.data[repKey].id,rep.data[repKey].dateDebut, rep.data[repKey].dateFin, rep.data[repKey].gardien, rep.data[repKey].plante, rep.data[repKey].statut, photo.data.photo))
                  }
                }
              ).catch(() => {
                let photoPng = new PhotoPlante(1, "logo_app_x48.png", rep.data[repKey].id)
                this.garde.push(new GardePlante(rep.data[repKey].id,rep.data[repKey].dateDebut, rep.data[repKey].dateFin, rep.data[repKey].gardien, rep.data[repKey].plante, rep.data[repKey].statut, photoPng.photo))

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
