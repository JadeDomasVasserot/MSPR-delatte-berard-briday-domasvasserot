<template v-slot:extension>
  <v-tabs class="ma-10">
    <v-tab><router-link to="/home" class="btn-router-link">Accueil</router-link></v-tab>
    <v-tab><router-link to="/map" class="btn-router-link">Carte des plantes</router-link></v-tab>
    <v-tab><router-link to="/mes-plantes" class="btn-router-link">Mes plantes</router-link></v-tab>
    <v-tab><router-link to="/mes-gardes" class="btn-router-link">Mes gardes</router-link></v-tab>
    <v-tab><router-link to="/bibliotheque-plante" class="btn-router-link">Bibliothèque de Plante</router-link></v-tab>
    <v-tab><router-link to="/contact" class="btn-router-link">Contactez-nous</router-link></v-tab>
    <v-tab><router-link to="/chat" class="btn-router-link">  <v-btn><v-icon icon="mdi-message-text"></v-icon></v-btn></router-link></v-tab>
    <v-tab>
      <v-row justify="center">
        <v-menu
          min-width="200px"
          rounded
        >
          <template v-slot:activator="{ props }">
          <v-btn v-bind="props"><v-icon icon="mdi-account"></v-icon></v-btn>
          </template>
          <v-card>
            <v-card-text>
              <div class="mx-auto text-center">
                <router-link to="/profile" class="btn-router-link">
                <v-btn
                  rounded
                  variant="text"
                >
                 Voir mon profil
                </v-btn>
                </router-link>
                <v-divider class="my-3"></v-divider>
                <v-btn
                  rounded
                  variant="text"
                >
                  Editer mon profil
                </v-btn>
                <v-divider class="my-3"></v-divider>
                <router-link to="/" class="btn-router-link">
                <v-btn
                  rounded
                  variant="text"
                >

                  Déconnexion
                </v-btn>
                </router-link>
              </div>
            </v-card-text>
          </v-card>
        </v-menu>
      </v-row>
    </v-tab>
  </v-tabs>
</template>

<script>
export default {
  name: "NavBar.vue"
}
</script>

<style scoped>
.btn-router-link{
  text-decoration: none;
  color: forestgreen;
}
</style>
