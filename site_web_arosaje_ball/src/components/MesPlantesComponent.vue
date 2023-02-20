<template>
  <nav-bar/>
  <v-banner  class="text-h3 ma-10 banner" lines="one" text="Mes Plantes">
  </v-banner>
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
import TypePlante from "@/models/TypePlante";
import PhotoPlante from "@/models/PhotoPlante";
export default {
  beforeMount() {
    this.getPlantes();
    this.getTypePlante();
  },
  components: {NavBar},
  data () {
    return {
      typePlantes: [],
      plantes: [],
      pathPhoto: "/src/assets/photo-plante/",
      error: '',
    }
  },
  methods:{
    getPlantes(){
      axios.get("http://127.0.0.1:9000/plante/all/byUser/"+this.$store.state.user,
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
              axios.get(`http://127.0.0.1:9000/photo-plante/one/idPlante/${rep.data[repKey].id}`,
                {
                  withCredentials: false,
                  headers: {
                    'Authorization': 'Bearer ' +this.$store.state.token,
                    'Content-Type': 'application/json',
                  }
                }).then(
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
        this.error = "Pas de plante associée à cet utilisateur"
      })
    },
    getTypePlante(){
      axios.get("http://127.0.0.1:9000/type-plante/all",
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
      axios.get("http://127.0.0.1:9000/plante/byUser/"+this.$store.state.user+"/byTypePlante/"+typePlanteParam,
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
              axios.get(`http://127.0.0.1:9000/photo-plante/one/idPlante/${rep.data[repKey].id}`,
                {
                  withCredentials: false,
                  headers: {
                    'Authorization': 'Bearer ' +this.$store.state.token,
                    'Content-Type': 'application/json',
                  }
                }).then(
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
          else if (rep.status === 204){
            this.error = "Pas de plante de ce type à garder"
          }
        }).catch(() => {
        this.error = "Pas de type référencé"
      })
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
