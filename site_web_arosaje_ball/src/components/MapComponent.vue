<template>
  <nav-bar />
  <GMapMap
    :center="center"
    :zoom="7"
    map-type-id="terrain"
    style="width: 500px; height: 300px"
  >
    <GMapCluster>
      <GMapMarker
        :key="index"
        v-for="(m, index) in markers"
        :position="m.position"
        :clickable="true"
        :draggable="true"
        @click="center=m.position"
      />
    </GMapCluster>
  </GMapMap>
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
