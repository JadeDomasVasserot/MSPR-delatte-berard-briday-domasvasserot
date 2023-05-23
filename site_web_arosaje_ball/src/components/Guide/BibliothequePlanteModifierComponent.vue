<template>
  <nav-bar />
  <form @submit.prevent="getFormValues" class="ma-5" v-if="plante !== null">
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
      Modifier
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
import Personne from "@/models/Personne";
import TypePlante from "@/models/TypePlante";
import BibliothequePlante from "@/models/BibliothequePlante";

export default {
  name: "BibliothequePlanteModifierComponent",
  components: {NavBar},
  props: ['idPlante'],
  beforeMount() {
    this.getUser();
    this.getPlanteId();
    this.getAllTypePlante();
  },
  data() {
    return {
      plante: null,
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
  methods: {
    async getFormValues() {
      for (const argumentsKey in this.typePlante) {
        if(this.typePlante[argumentsKey].nom === this.typePlanteItem){
          this.typePlanteItemObjet = this.typePlante[argumentsKey];
        }
      }
      await axios.put(
        'https://arosaje-back.jadedomasvasserot.com/bibliotheque-plante/update',
        {
          id: this.idPlante,
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
          path: '/bibliotheque-plante/id/'+ this.idPlante,
          query: this.$route.query,
          hash: this.$route.hash,
        })
      })
        .catch(() => {
          this.errorLogin = true;
        })
    },
    getUser(){
      axios.get("https://arosaje-back.jadedomasvasserot.com/personne/id/"+this.$store.state.user,
        {
          withCredentials: false,
          headers: {
            'Authorization': 'Bearer ' +this.$store.state.token,
            'Content-Type': 'application/json',
          }
        })
        .then( rep => {
          if (rep.data) {
            this.user = new Personne(rep.data.id, rep.data.adresse,  rep.data.cp, rep.data.email, rep.data.mdp, rep.data.nom, rep.data.prenom, rep.data.ville, rep.data.role)
          }
        }).catch(() => {
        this.error = "Error"
      })
    },
    getAllTypePlante(){
      axios.get("https://arosaje-back.jadedomasvasserot.com/type-plante/all",
        {
          withCredentials: false,
          headers: {
            'Authorization': 'Bearer ' +this.$store.state.token,
            'Content-Type': 'application/json',
          }
        })
        .then( rep => {
          if (rep.data) {
            for (const repKey in rep.data) {
              this.typePlante.push(new TypePlante(rep.data[repKey].id, rep.data[repKey].description, rep.data[repKey].nom))
              this.nom.push(rep.data[repKey].nom);
            }
          }
        }).catch(() => {
        this.error = "Pas de type"
      })
    },
    getPlanteId() {
      axios.get("https://arosaje-back.jadedomasvasserot.com/bibliotheque-plante/id/" + this.idPlante,
        {
          withCredentials: false,
          headers: {
            'Authorization': 'Bearer ' +this.$store.state.token,
            'Content-Type': 'application/json',
          }
        })
        .then(rep => {
            if (rep.data) {
              this.plante = new BibliothequePlante(rep.data.id, rep.data.nom, rep.data.description, rep.data.typePlante)
              this.nomPlante = rep.data.nom
              this.description = rep.data.description
              this.typePlanteItem = rep.data.typePlante.nom
            }
          }
        ).catch(() => {
        this.error = "Pas de plante référencée"
      })
    },
  },

}
</script>
