<template>
  <nav-bar/>
  <v-card class="ma-10">
    <v-card-title>
      Mes plantes gardées
    </v-card-title>
    <v-divider></v-divider>
    <v-list lines="one" v-if="planteGarde.length > 0">
      <v-list-item
        v-for="item in planteGarde"
        :key="item.id"
      >
        <router-link :to="{ name: 'PlantesAGarderItem', params: { idGarde:  item.id }}"
                     class="text-decoration-none btn-router-link">
          <v-list-item-title>{{ item.plante.bibliothequePlante.nom }}</v-list-item-title>
          <v-list-item-subtitle>{{ item.dateDebut }} à {{ item.dateFin }}</v-list-item-subtitle>
        </router-link>
        <v-divider></v-divider>
      </v-list-item>

    </v-list>
  </v-card>
  <v-card class="ma-10">
    <v-card-title>
      Mes plantes en attente d'une garde
    </v-card-title>
    <v-divider></v-divider>
    <v-list lines="one" v-if="planteAGarde.length > 0">
      <v-list-item
        v-for="item in planteAGarde"
        :key="item.id"
      >
        <router-link :to="{ name: 'PlantesAGarderItem', params: { idGarde:  item.id }}"
                     class="text-decoration-none btn-router-link">
          <v-list-item-title>{{ item.plante.bibliothequePlante.nom }}</v-list-item-title>
        </router-link>
        <v-divider></v-divider>
      </v-list-item>

    </v-list>
  </v-card>
  <v-card class="ma-10">
    <v-card-title>
      Mes Gardes
    </v-card-title>
    <v-divider></v-divider>
    <v-list lines="one" v-if="gardeUser.length > 0">
      <v-list-item
        v-for="item in gardeUser"
        :key="item.id"
      >
        <router-link :to="{ name: 'PlantesAGarderItem', params: { idGarde:  item.id }}"
                     class="text-decoration-none btn-router-link">
          <v-list-item-title>{{ item.plante.bibliothequePlante.nom }}</v-list-item-title>
          <v-list-item-subtitle>{{ item.dateDebut }} à {{ item.dateFin }}</v-list-item-subtitle>
          <v-list-subheader>Adresse : {{ item.gardien.adresse }}, {{ item.gardien.ville }} {{ item.gardien.cp }}
          </v-list-subheader>
        </router-link>
      </v-list-item>

    </v-list>
  </v-card>
  <v-card-title>Calendrier de mes gardes</v-card-title>
  <v-calendar
    :value="null"
    color="green"
    is-dark
    is-expanded
    :min-date="new Date() - 31536000000 "
    :max-date="new Date() + 31536000000"
    :attributes='attributes'>
  </v-calendar>
</template>
<script>

import NavBar from "@/layouts/navBar/NavBar.vue"
import axios from "axios";
import Personne from "@/models/Personne";
import Role from "@/models/Role";
import Plante from "@/models/Plante";
import PhotoPlante from "@/models/PhotoPlante";
import GardePlante from "@/models/GardePlante";
import TypePlante from "@/models/TypePlante";

export default {
  components: {
    NavBar,
  },
  beforeMount() {
    this.getPlanteUserGarde()
    this.getPlanteUserAGarde()
    this.getGardeByUser()
  },
  data() {
    return {
      planteGarde: [],
      planteAGarde: [],
      gardeUser: [],
      pathPhoto: "/src/assets/photo-plante/",
      attributes: [
        {
          key: "Aujourd'hui",
          highlight: true,
          dates: new Date(),
        },
      ],

    }
  },
  methods: {
    getPlanteUserGarde() {
      axios.get("https://arosaje-mspr.mrartemus.cloud/garde-plante/all/byUser/" + this.$store.state.user + "/byStatus/" + 1,
        {
          withCredentials: false,
          headers: {
            'Authorization': 'Bearer ' + this.$store.state.token,
            'Content-Type': 'application/json',
          }
        })
        .then(rep => {
          if (rep.data) {
            for (const repKey in rep.data) {
              this.planteGarde.push(new GardePlante(rep.data[repKey].id, rep.data[repKey].dateDebut, rep.data[repKey].dateFin, rep.data[repKey].gardien, rep.data[repKey].plante, rep.data[repKey].statut))
            }
          }
        }).catch(() => {
        this.error = "Pas de plante à garder"
      })
    },
    getPlanteUserAGarde() {
      axios.get("https://arosaje-mspr.mrartemus.cloud/garde-plante/all/byUser/" + this.$store.state.user + "/byStatus/" + 2,
        {
          withCredentials: false,
          headers: {
            'Authorization': 'Bearer ' + this.$store.state.token,
            'Content-Type': 'application/json',
          }
        })
        .then(rep => {
          if (rep.data) {
            for (const repKey in rep.data) {
              this.planteAGarde.push(new GardePlante(rep.data[repKey].id, rep.data[repKey].dateDebut, rep.data[repKey].dateFin, rep.data[repKey].gardien, rep.data[repKey].plante, rep.data[repKey].statut))
            }
          }
        }).catch(() => {
        this.error = "Pas de plante à garder"
      })
    },
    getGardeByUser() {
      axios.get("https://arosaje-mspr.mrartemus.cloud/garde-plante/all/byGardien/" + this.$store.state.user,
        {
          withCredentials: false,
          headers: {
            'Authorization': 'Bearer ' + this.$store.state.token,
            'Content-Type': 'application/json',
          }
        })
        .then(rep => {
          if (rep.data) {
            for (const repKey in rep.data) {
              this.gardeUser.push(new GardePlante(rep.data[repKey].id, rep.data[repKey].dateDebut, rep.data[repKey].dateFin, rep.data[repKey].gardien, rep.data[repKey].plante, rep.data[repKey].statut))
            }
          }
        }).catch(() => {
        this.error = "Pas de plante à garder"
      })
    },
  },
  computed: {
    attributes() {
      return this.gardeUser.map(t =>
        ({
          key: `gardeUser.${t.id}`,
          highlight: {
            backgroundColor: {backgroundColor: 'green'},
            start: {fillMode: 'outline'},
            base: {fillMode: 'light'},
            end: {fillMode: 'outline'},
          },
          dates: {start: t.dateDebut, end: t.dateFin},
          popover:true,
          customData: t,
        }));
    },
  }
}
</script>
<style scoped>
.btn-router-link {
  text-decoration: none;
  color: forestgreen;
}
</style>
