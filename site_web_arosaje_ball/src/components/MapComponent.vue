<template>
  <nav-bar />
 <div id="map">

 </div>
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
#map {
  height: 400px; /* The height is 400 pixels */
  width: 100%; /* The width is the width of the web page */
}
</style>
