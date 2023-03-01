<template>
  <nav-bar />
  <GMapMap
    class="ma-5"
    :center="{lat: 51.093048, lng: 6.842120}"
    :zoom="20"
    style="width: 95vw; height: 40rem"
  />
</template>

<script>

import axios from 'axios';
import NavBar from "@/layouts/navBar/NavBar.vue";

export default {
  name: "MapComponent",
  components: {NavBar},
  beforeMount() {

  },
  data () {
    return {
      center: {lat: 51.093048, lng: 6.842120},
      markers: [
        {
          position: {
            lat: 51.093048, lng: 6.842120
          },
        }
        , // Along list of clusters
      ]
    }
  },
  methods:{
  }
}
</script>
<style scoped>

</style>
