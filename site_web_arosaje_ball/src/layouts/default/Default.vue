<template>
  <v-app>
    <default-bar class="ma-2"/>

    <default-view class="ma-5"/>

    <default-footer />
  </v-app>
</template>

<script  setup>
  import DefaultBar from './AppBar.vue'
  import DefaultView from './View.vue'
  import DefaultFooter from './FooterBar.vue'
</script>
