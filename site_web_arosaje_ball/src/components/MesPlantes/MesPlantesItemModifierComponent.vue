<template>
  <nav-bar />
  <form @submit.prevent="getFormValues">
    <v-autocomplete
      label="Sélectionne une plante"
      :items="nom"
      v-model="planteSelected"
      @update:modelValue="getPlanteNom()"
    ></v-autocomplete>
    <v-text-field
      v-model="localisation"
      :counter="10"
      label="Localisation"
    ></v-text-field>

    <v-btn
      class="me-4"
      type="submit"
    >
      Ajouter
    </v-btn>

  </form>
</template>

<script>
import axios from 'axios';
import NavBar from "@/layouts/navBar/NavBar.vue";

export default {
  name: "MesPlantesItemModifierComponent",
  props: ['idPlante'],
  components: {NavBar},}
</script>
