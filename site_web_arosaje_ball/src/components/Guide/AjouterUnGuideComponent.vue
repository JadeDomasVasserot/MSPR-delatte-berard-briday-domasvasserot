<template>
  <nav-bar />
</template>

<script>
import axios from 'axios';
import NavBar from "@/layouts/navBar/NavBar.vue";

export default {
  name: "AjouterUnGuideComponent",
  components: {NavBar},
  props: ['idPlante']
}

</script>

<style scoped>

</style>
