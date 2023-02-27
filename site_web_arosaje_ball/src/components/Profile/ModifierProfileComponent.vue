<template>
  <nav-bar />
  <div id="map"></div>
</template>

<script>
import axios from 'axios';
import NavBar from "@/layouts/navBar/NavBar.vue";

export default {
  name: "BibliothequePlanteComponent",
  components: {NavBar},
}

</script>

<style scoped>
#map {
  height: 100%;
}
</style>
