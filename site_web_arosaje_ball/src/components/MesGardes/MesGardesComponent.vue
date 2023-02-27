  <template>
    <nav-bar />
    <v-card class="ma-10">
      <v-card-title>
        Mes plantes en attente de garde
      </v-card-title>
      <v-list lines="one">
        <v-list-item
          v-for="item in items"
          :key="item.title"
          :title="item.title"
          subtitle="..."
        ></v-list-item>
      </v-list>
    </v-card>
    <v-card class="ma-10">
      <v-card-title>
        Mes plantes gardées
      </v-card-title>
      <v-list lines="one">
        <v-list-item
          v-for="item in planteGarde"
          :key="item.id"
          :title="item.plante.bibliothequePlante.nom">

        <v-list-item-subtitle>
          {{item.gardien.nom}}, {{item.gardien.prenom}}
        </v-list-item-subtitle>
        <v-list-item-subtitle>
         Garde de : {{item.dateDebut}}, {{item.dateFin}}
        </v-list-item-subtitle>
        </v-list-item>
      </v-list>
    </v-card>
    <v-card class="ma-10">
      <v-card-title>
        Mes gardes
      </v-card-title>
      <v-list lines="one">
        <v-list-item
          v-for="item in items"
          :key="item.title"
          :title="item.title"
          subtitle="..."
        ></v-list-item>
      </v-list>
    </v-card>
  </template>
<script>

import NavBar from "@/layouts/navBar/NavBar.vue"
import axios from "axios";
import Personne from "@/models/Personne";
import Role from "@/models/Role";
import Plante from "@/models/Plante";
import PhotoPlante from "@/models/PhotoPlante";
import GardePlante from "@/models/GardePlante";
export default {
  components: {
    NavBar,
  },
  beforeMount() {
    this.getPlanteUserGarde()
  },
  data: () => ({
  planteGarde: ''
  }),
  methods: {
    getPlanteUserGarde() {
      axios.get("http://127.0.0.1:9000/garde-plante/all/byUser/"+ this.$store.state.user+"/byStatus/"+ 1,
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
              this.planteGarde = new GardePlante(rep.data[repKey].id,rep.data[repKey].dateDebut, rep.data[repKey].dateFin, rep.data[repKey].gardien, rep.data[repKey].plante, rep.data[repKey].statut)

            }
          }
        }).catch(() => {
        this.error = "Pas de plante à garder"
      })
    }
  }

}
</script>
  <style scoped>
  </style>
