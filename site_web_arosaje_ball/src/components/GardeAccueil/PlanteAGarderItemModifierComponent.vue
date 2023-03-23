<template>
  <nav-bar />
  <form @submit.prevent="getFormValues" class="ma-5" v-if="plante !== null">

    <v-row justify="center" class="ma-5">
      <v-date-picker v-model="picker" is-range :rules="dateRules"></v-date-picker>
    </v-row>
    <v-autocomplete
      :rules="rule"
      :items="nom"
      label="Sélectionner un statut"
      v-model="statutPlanteItem"
      @update:modelValue="statutPlante.id"
    >
    </v-autocomplete>
    <v-btn
      class="ma-4"
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
import StatutPlante from "@/models/StatutPlante";
import GardePlante from "@/models/GardePlante";

export default {
  name: "PlanteAGarderItamModifierComponent",
  components: {NavBar},
  props: ['idPlante'],
  beforeMount() {
    this.getPlanteId();
    this.getAllStatutPlante();
  },
  data() {
    return {
      plante: null,
      statutPlante: [],
      statutPlanteItem: null,
      statutPlanteItemObjet: null,
      nom: [],
      nomPlante: null,
      picker: new Date(),
      dateRules: [
        v => !!v || 'La date range est nécessaire',
        v => /^\d{4}-\d{2}-\d{2}$/.test(v) || 'La date doit être au format YYYY-MM-DD',
      ],
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
      for (const argumentsKey in this.statutPlante) {
        if(this.statutPlante[argumentsKey].nom === this.statutPlanteItem){
          this.statutPlanteItemObjet = this.statutPlante[argumentsKey];
        }
      }
      await axios.put(
        'http://127.0.0.1:9000/garde-plante/update',
        {
          id: this.idPlante,
          plante: this.plante.plante,
          dateDebut: this.picker.start,
          dateFin: this.picker.end,
          statut: this.statutPlanteItemObjet
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
    getAllStatutPlante(){
      axios.get("http://127.0.0.1:9000/statut-plante/all",
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
              this.statutPlante.push(new StatutPlante(rep.data[repKey].id, rep.data[repKey].nom))
              this.nom.push(rep.data[repKey].nom);
            }
          }
        }).catch(() => {
        this.error = "Pas de type"
      })
    },
    getPlanteId() {
      axios.get("http://127.0.0.1:9000/garde-plante/id/" + this.idPlante,
        {
          withCredentials: false,
          headers: {
            'Authorization': 'Bearer ' +this.$store.state.token,
            'Content-Type': 'application/json',
          }
        })
        .then(rep => {
            if (rep.data) {
              this.plante = new GardePlante(rep.data.id,rep.data.dateDebut, rep.data.dateFin, rep.data.gardien, rep.data.plante, rep.data.statut)
              this.statutPlanteItem = rep.data.statut.nom;
              this.picker = {start: this.plante.dateDebut, end: this.plante.dateFin}
            }
          }
        ).catch(() => {
        this.error = "Pas de plante référencée"
      })
    },
  },
}
</script>
