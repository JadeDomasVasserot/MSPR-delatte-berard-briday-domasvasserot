<template>
  <nav-bar />

  <v-container align="center" justify="center" fill-height>
    <v-row align="center" justify="center">
      <div class="text-center">
        <h1 class="mb-2">Page de profil</h1>
      </div>
    </v-row>
    <v-row class="bg-img" justify="space-around">
      <v-col cols="12" class="mt-8">
        <v-card width="400">
            <v-app-bar
              class="mt-8"
              flat
              color="rgba(0, 0, 0, 0)"
            >
              <v-spacer></v-spacer>

              <v-menu offset-y left>
                <template v-slot:activator="{ on, attrs }">
                  <v-btn
                    v-bind="attrs"
                    v-on="on"
                    color="white"
                    icon
                  >
                    <v-icon>mdi-dots-vertical</v-icon>
                  </v-btn>
                </template>
                <v-list>
                  <v-list-item>
                    <v-list-item-title>Edit</v-list-item-title>
                  </v-list-item>
                </v-list>
              </v-menu>

            </v-app-bar>
           <div v-if="user !== null">
            <v-card-title class="white--text mt-8" >
              <p class="ml-3">
             {{user.nom}}, {{ user.prenom}}
              </p>
            </v-card-title>
          <v-card-subtitle> {{ user.role.nom }}</v-card-subtitle>
          </div>
          <v-card-text>

            <v-list two-line v-if="user !== null">
              <v-list-item>
                <v-list-item-icon>
                  <v-icon color="indigo">
                    mdi-home-map-marker
                  </v-icon>
                </v-list-item-icon>

                <v-list-item-content>
                  <v-list-item-title>{{ user.address }}</v-list-item-title>
                  <v-list-item-subtitle>{{user.ville}}, {{user.cp}}</v-list-item-subtitle>
                </v-list-item-content>

              </v-list-item>

              <v-divider inset></v-divider>

              <v-list-item>
                <v-list-item-icon>
                  <v-icon color="indigo">
                    mdi-email
                  </v-icon>
                </v-list-item-icon>

                <v-list-item-content>
                  <v-list-item-title>{{ user.email }}</v-list-item-title>
                </v-list-item-content>

              </v-list-item>

              <v-divider inset></v-divider>
              <v-list-item>
                <v-list-item-icon>
                  <v-icon color="indigo">
                    mdi-edit
                  </v-icon>
                </v-list-item-icon>

                <v-list-item-content>
               <router-link :to="{ name: 'ModifieProfil'}"><v-btn class="ma-5">Modifier</v-btn></router-link>
               <v-btn class="ma-5">Supprimer mon compte</v-btn>
                  <router-link to="/"><v-btn class="ma-5">Déconnexion</v-btn></router-link>
                </v-list-item-content>

              </v-list-item>
            </v-list>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import axios from 'axios';
import NavBar from "@/layouts/navBar/NavBar.vue";
import BibliothequePlante from "@/models/BibliothequePlante";
import PhotoBibliothequePlante from "@/models/PhotoBibliothequePlante";
import Personne from "@/models/Personne";

export default {
  name: "ProfileComponent",
  components: {NavBar},
  beforeMount() {
    this.getUser()
  },
  data () {
    return {
      userId: this.$store.state.user,
      user: null
    }
  },
  methods: {
    getUser(){

      axios.get("http://127.0.0.1:9000/personne/id/"+this.userId,
        {
          withCredentials: false,
          headers: {
            'Authorization': 'Bearer ' +this.$store.state.token,
            'Content-Type': 'application/json',
          }
        })
        .then( rep => {
          if (rep.data) {
              this.user = new Personne(rep.data.id, rep.data.adresse,  rep.data.cp, rep.data.email, rep.data.mdp, rep.data.nom, rep.data.prenom, rep.data.ville, rep.data.role)
          }
        }).catch(() => {
        this.error = "Error"
      })
    },
  }
}
</script>
