<template v-slot:extension>
  <v-tabs class="ma-10">
    <v-tab><router-link to="/home" class="btn-router-link">Accueil</router-link></v-tab>
    <v-tab><router-link to="/mes-plantes/:idUser'" class="btn-router-link">Mes plantes</router-link></v-tab>
    <v-tab><router-link :to="{ name: 'Calendrier', params: { idUser:  1 }}" class="btn-router-link">Mes gardes</router-link></v-tab>
    <v-tab><router-link to="/bibliotheque-plante" class="btn-router-link">Bibliothèque de Plante</router-link></v-tab>
    <v-tab><router-link to="/contact" class="btn-router-link">Contactez-nous</router-link></v-tab>
    <v-tab><router-link to="/chat" class="btn-router-link"><v-icon icon="mdi-message-text"></v-icon></router-link></v-tab>
    <v-tab><router-link to="/profil" class="btn-router-link"><v-icon icon="mdi-account"></v-icon></router-link></v-tab>
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
