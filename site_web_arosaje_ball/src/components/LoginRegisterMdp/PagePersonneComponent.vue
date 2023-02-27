<template>
  <nav-bar />
  <v-container align="center" justify="center" fill-height>
    <v-row align="center" justify="center">
      <div class="text-center">
        <h1 class="mb-2">Page Profil</h1>
      </div>
    </v-row>
    <v-row class="bg-img" justify="space-around" v-if="plantes[0] !== ''">
      <v-col cols="12" class="mt-8">
        <v-card width="400">
            <v-card-title class="white--text mt-8" >
              {{proprietaire.nom}} {{proprietaire.prenom}}
            </v-card-title>

          <v-card-text>
            <div class="font-weight-bold ml-8 mb-2">
            </div>
            <v-list two-line>
              <v-list-item>
                <v-list-item-icon>
                  <v-icon color="green">
                    mdi-email
                  </v-icon>
                </v-list-item-icon>
                <v-list-item-content>
                  <v-list-item-title>{{ proprietaire.email }}</v-list-item-title>
                </v-list-item-content>
              </v-list-item>
              <v-divider></v-divider>
              <v-list-item>
                <v-list-item-icon>
                  <v-icon color="green">
                    mdi-map-marker
                  </v-icon>
                </v-list-item-icon>

                <v-list-item-content>
                  <v-list-item-title>{{proprietaire.ville}}</v-list-item-title>
                  <v-list-item-subtitle>{{proprietaire.cp}}</v-list-item-subtitle>
                </v-list-item-content>
              </v-list-item>
              <v-divider></v-divider>
              <v-list-item>
                <v-list-item-icon>
                  <v-icon color="green" >
                    mdi-account-star
                  </v-icon>
                </v-list-item-icon>

                <v-list-item-content>
                  <v-list-item-title>{{role.nom}}</v-list-item-title>
                </v-list-item-content>
              </v-list-item>
            </v-list>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
    <v-card
      class="mx-auto ma-10"
      max-width="95%"
    >
      <v-container fluid>
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
            </v-card>
          </v-col>
        </v-row>
      </v-container>
      <v-container v-if="plantes.length === 0 && error !== ''">{{ error }} </v-container>
    </v-card>
  </v-container>
</template>

<script>
import axios from "axios";
import Plante from "@/models/Plante";
import PhotoPlante from "@/models/PhotoPlante";
import NavBar from "@/layouts/navBar/NavBar";
import Personne from "@/models/Personne";
import Role from "@/models/Role";

export default {
  name: "PagePersonneComponent",
  props: ['idPersonne'],
  components: {NavBar},

  beforeMount() {
    this.getPlantes();
  },
  data() {
    return {
      photos: [],
      plantes: '',
      proprietaire: '',
      role: '',
      pathPhoto: "/src/assets/photo-plante/",
      error: '',
    }
  },
  methods: {
    getPlantes(){
      axios.get("http://127.0.0.1:9000/plante/all/byUser/"+this.idPersonne,
        {
          withCredentials: false,
          headers: {
            'Authorization': 'Bearer ' +this.$store.state.token,
            'Content-Type': 'application/json',
          }
        })
        .then( rep => {
          if (rep.data) {
            this.proprietaire = new Personne( rep.data[0].proprietaire.id,  rep.data[0].proprietaire.adresse,  rep.data[0].proprietaire.cp,  rep.data[0].proprietaire.email,  rep.data[0].proprietaire.mdp,   rep.data[0].proprietaire.nom,   rep.data[0].proprietaire.prenom,   rep.data[0].proprietaire.ville,   rep.data[0].proprietaire.role )
            this.role = new Role(rep.data[0].proprietaire.role.id, rep.data[0].proprietaire.role.nom)
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
          }
        }).catch(() => {
        this.error = "Pas de plante associée à cet utilisateur"
      })
    },
  }
}
</script>

<style scoped>

</style>
