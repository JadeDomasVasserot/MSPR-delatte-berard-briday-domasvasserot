<template>
  <nav-bar />
  <form @submit.prevent="getFormValues" class="ma-5">
    <v-text-field
      :rules="rule"
      v-model="description"
      label="Description"
    ></v-text-field>
    <v-text-field
      :rules="rule"
      v-model="titre"
      label="Titre"
    ></v-text-field>
    <v-autocomplete
      :rules="rule"
      :items="nom"
      label="Sélectionner un type de guide"
      v-model="typeGuideItem"
      @update:modelValue="typeGuide.id"
    >
    </v-autocomplete>
    <v-btn
      class="me-4"
      type="submit"
    >
      Ajouter
    </v-btn>
    <div v-if="error === true">
      <v-alert
        color="error"
        icon="$error"
        title="PROBLEME"
        text="Un champ n'est pas valide"
      ></v-alert>
    </div>
  </form>
</template>

<script>
import axios from 'axios';
import NavBar from "@/layouts/navBar/NavBar.vue";
import BibliothequePlante from "@/models/BibliothequePlante";
import TypeGuide from "@/models/TypeGuide";

export default {
  name: "AjouterUnGuideComponent",
  components: {NavBar},
  props: ['idPlante'],
  beforeMount() {
    this.getBibliothequePlante();
    this.getAllTypeGuide();
  },
  data() {
    return{
      typeGuide: [],
      typeGuideItem: null,
      typeGuideItemObjet: null,
      nom: [],
      description: null,
      plante: null,
      titre: null,
      rule: [
        value => {
          if (value) return true
          return 'Le champs doit être rempli'
        },
      ],
      error:null,
    }
  },
  methods:{
    getBibliothequePlante(){
      axios.get("https://arosaje-back.jadedomasvasserot.com/bibliotheque-plante/id/"+this.idPlante,
        {
          withCredentials: false,
          headers: {
            'Authorization': 'Bearer ' +this.$store.state.token,
            'Content-Type': 'application/json',
          }
        })
        .then( rep => {
          if (rep.data) {
              this.plante = new BibliothequePlante(rep.data.id, rep.data.nom, rep.data.description, rep.data.typePlante)
          }
        }).catch(() => {
        this.error = "Pas de plante référencée"
      })
    },
    getAllTypeGuide(){
      axios.get("https://arosaje-back.jadedomasvasserot.com/type-guide/all",
        {
          withCredentials: false,
          headers: {
            'Authorization': 'Bearer ' +this.$store.state.token,
            'Content-Type': 'application/json',
          }
        })
        .then( rep => {
          if (rep.data) {
            this.plantes = [];
            for (const repKey in rep.data) {
              this.typeGuide.push(new TypeGuide(rep.data[repKey].id, rep.data[repKey].nom))
              this.nom.push(rep.data[repKey].nom);
            }
          }
        }).catch(() => {
        this.error = "Pas de plante référencée"
      })
    },
    async getFormValues() {
      for (const argumentsKey in this.typeGuide) {
        if(this.typeGuide[argumentsKey].nom === this.typeGuideItem){
          this.typeGuideItemObjet = this.typeGuide[argumentsKey];
        }
      }
      await axios.post(
        'https://arosaje-back.jadedomasvasserot.com/guide-plante/add',
        {
          description: this.description,
          titre: this.titre,
          bibliothequePlante: this.plante,
          typeGuide: this.typeGuideItemObjet
        },
        {
          withCredentials: false,
          headers: {
            'Authorization': 'Bearer ' +this.$store.state.token,
                    'Content-Type': 'application/json',
          }
        }
      ) .then( response => {
        this.$router.push({
          path: '/bibliotheque-plante/id/'+ this.idPlante,
          query: this.$route.query,
          hash: this.$route.hash,
        })
      })
        .catch(() => {
          this.error = true;
        })
    },
  }
}

</script>

<style scoped>

</style>
