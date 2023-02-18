<template>
  <nav-bar />
  <v-card  class="mx-auto mt-10"
    width="500px"
    title="Contactez-nous"
    subtitle="Jade DOMAS-VASSEROT, Erine BERARD, Hugo BRIDAY, Duncan DELATTE"
    text="Cette application a été faite pour l'entreprise Arosaje.
     Pour nous contacter, envoyez un email à jadedomasvasserot@gmail.com"
    variant="outlined"
  >
    <v-card-actions>
      <v-btn>Télécharger l'application</v-btn>
    </v-card-actions>
  </v-card>
</template>

<script >
import NavBar from "@/layouts/navBar/NavBar.vue"
export default {
  components: {NavBar}
}
</script>
