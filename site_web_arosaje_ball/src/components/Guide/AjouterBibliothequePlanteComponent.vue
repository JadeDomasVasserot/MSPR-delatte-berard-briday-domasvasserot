<template>
  <nav-bar />
  <form @submit.prevent="getFormValues" class="ma-5">
    <v-text-field
      :rules="rule"
      v-model="nomPlante"
      label="Nom de la plante"
    ></v-text-field>
    <v-text-field
      :rules="rule"
      v-model="description"
      label="Description"
    ></v-text-field>
    <v-autocomplete
      :rules="rule"
      :items="nom"
      label="Sélectionner un type de plante"
      v-model="typePlanteItem"
      @update:modelValue="typePlante.id"
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
import TypePlante from "@/models/TypePlante";

export default {
  name: "ModifierBibliothequePlanteComponent",
  components: {NavBar},
  beforeMount() {
    this.getAllTypePlante();
  },
  data() {
    return{
      typePlante: [],
      typePlanteItem: null,
      typePlanteItemObjet: null,
      nom: [],
      nomPlante: null,
      description: null,
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
    getAllTypePlante(){
      axios.get("https://arosaje-mspr.mrartemus.cloud/type-plante/all",
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
              this.typePlante.push(new TypePlante(rep.data[repKey].id, rep.data[repKey].description, rep.data[repKey].nom))
              this.nom.push(rep.data[repKey].nom);
            }
          }
        }).catch(() => {
        this.error = "Pas de type"
      })
    },
    async getFormValues() {
      for (const argumentsKey in this.typePlante) {
        if(this.typePlante[argumentsKey].nom === this.typePlanteItem){
          this.typePlanteItemObjet = this.typePlante[argumentsKey];
        }
      }
      await axios.post(
        'https://arosaje-mspr.mrartemus.cloud/bibliotheque-plante/add',
        {
          nom: this.nomPlante,
          description: this.description,
          typePlante: this.typePlanteItemObjet
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
          path: '/bibliotheque-plante',
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
