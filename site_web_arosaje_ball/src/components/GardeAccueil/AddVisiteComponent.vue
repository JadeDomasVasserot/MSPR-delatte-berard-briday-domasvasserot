<template>
  <nav-bar/>
  <form @submit.prevent="getFormValues" class="ma-5" v-if="plante !== null">
      <v-card-title>DATE VISITE</v-card-title>
    <v-row justify="center" class="ma-5">
      <v-date-picker v-model="picker"></v-date-picker>
    </v-row>
    <v-card-title>COMMENTAIRE : </v-card-title>
    <v-text-field
      :rules="rule"
      v-model="titre"
      label="Titre"
    ></v-text-field>
    <v-text-field
      :rules="rule"
      v-model="description"
      label="Description"
    ></v-text-field>
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
import StatutPlante from "@/models/StatutPlante";
import GardePlante from "@/models/GardePlante";
import Personne from "@/models/Personne";
import Commentaire from "@/models/Commentaire";

export default {
  name: "AddVisiteComponent",
  components: {NavBar},
  props: ['idGarde'],
  beforeMount() {
    this.getPlanteId();
    this.getUser();
  },
  data() {
    return {
      plante: null,
      nom: [],
      description: null,
      commentaire: null,
      titre: null,
      picker: new Date(),
      rule: [
        value => {
          if (value) return true
          return 'Le champs doit être rempli'
        },
      ],
      user: null,
      error: null,
    }
  },
  methods: {
    async getFormValues() {
      await axios.post(
        'http://127.0.0.1:9000/commentaire/add',
        {
          titre: this.titre,
          description: this.description,
          auteur: this.user,
          gardePlante: this.plante,
        },
        {
          withCredentials: false,
          headers: {
            'Authorization': 'Bearer ' +this.$store.state.token,
                    'Content-Type': 'application/json',
          }
        }
      ).then( response => {
        this.commentaire = new Commentaire(response.data.id, response.data.titre, response.data.description, response.data.auteur, response.data.gardePlante)
         axios.post(
          'http://127.0.0.1:9000/visite-plante/add',
          {
            gardien: this.user,
            dateVisite: this.picker,
            plante: this.plante.plante,
            gardePlante: this.plante,
            commentaire: this.commentaire
          },
          {
            withCredentials: false,
            headers: {
              'Authorization': 'Bearer ' +this.$store.state.token,
                    'Content-Type': 'application/json',
            }
          }
        ).then(response => {

          this.$router.push({
            path: '/plantes-a-garder/' + this.idGarde,
            query: this.$route.query,
            hash: this.$route.hash,
          })
            .catch(() => {
              this.errorLogin = true;
            })
        })
          .catch(() => {
            this.errorLogin = true;
          })
      });
    },
    getPlanteId() {
      axios.get("http://127.0.0.1:9000/garde-plante/id/" + this.idGarde,
        {
          withCredentials: false,
          headers: {
            'Authorization': 'Bearer ' + this.$store.state.token,
            'Content-Type': 'application/json',
          }
        })
        .then(rep => {
            if (rep.data) {
              this.plante = new GardePlante(rep.data.id, rep.data.dateDebut, rep.data.dateFin, rep.data.gardien, rep.data.plante, rep.data.statut)
            }
          }
        ).catch(() => {
        this.error = "Pas de plante référencée"
      })
    },
    getUser() {
      axios.get("http://127.0.0.1:9000/personne/id/" + this.$store.state.user,
        {
          withCredentials: false,
          headers: {
            'Authorization': 'Bearer ' + this.$store.state.token,
            'Content-Type': 'application/json',
          }
        })
        .then(rep => {
          if (rep.data) {
            this.user = new Personne(rep.data.id, rep.data.adresse, rep.data.cp, rep.data.email, rep.data.mdp, rep.data.nom, rep.data.prenom, rep.data.ville, rep.data.role)
          }
        }).catch(() => {
        this.error = "Error"
      })
    },
  },

}
</script>
