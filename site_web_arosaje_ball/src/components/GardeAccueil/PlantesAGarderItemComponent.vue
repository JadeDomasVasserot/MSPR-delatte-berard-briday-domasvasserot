<template>
  <nav-bar/>
  <v-banner lines="one" :stacked="false">
    <v-app-bar-title>Plante à garder</v-app-bar-title>
  </v-banner>
  <div v-if="plante !== null" >
  <v-card
          class="ma-10"
          max-width="100%"
  >
    <v-row justify="center"  v-if=" garde !== null && plante.proprietaire.id === user">
      <router-link :to="{ name: 'PlanteAGarderItemModifier', params: { idPlante:  garde.id }}" class="text-decoration-none">
        <v-icon icon="mdi-pencil"
                class="ma-5 pa-5 border"
                size="x-large"
                color="green">
        </v-icon>
      </router-link>
      <router-link :to="{ name: 'PlanteAGarderItemSupprimer', params: { idPlante:  garde.id }}" class="text-decoration-none">
        <v-icon icon="mdi-delete"
                class="ma-5 pa-5 border"
                size="x-large"
                color="green">
        </v-icon>
      </router-link>
    </v-row>
    <v-banner lines="one" :stacked="false">
      <router-link class="text-decoration-none" :to="{name:'BibliothequePlanteItem', params: { idPlante:  plante.id}}">
        <v-card-title class="text-amber-darken-1 ma-3 font-weight-bold text-center"
                      v-text="plante.bibliothequePlante.nom">

        </v-card-title>
      </router-link>
    </v-banner>
    <v-carousel show-arrows="hover" v-if="photos.length > 0"  hide-delimiter-background>

      <v-row justify="center" class="mb-10" v-if="plante.proprietaire.id === user">
        <router-link :to="{ name: 'ModifierGarde', params: { idGarde:  garde.id }}" class="text-decoration-none">
          <v-btn class="ma-5 border">Modifier la garde</v-btn>
        </router-link>
      </v-row>
      <v-carousel-item
        v-for="(item) in photos"
        :key="item.id"
        :src="pathPhoto+item.photo"
      >
      </v-carousel-item>
    </v-carousel>
    <v-carousel show-arrows="hover" v-if="photos.length === 0"  hide-delimiter-background>
      <v-carousel-item
        src="/src/assets/logo_app.png"
      >
      </v-carousel-item>
    </v-carousel>
    <v-card-title>
      {{ plante.bibliothequePlante.typePlante.nom }}
      <v-tooltip
        activator="parent"
        location="top"
      >{{ plante.bibliothequePlante.typePlante.description }}
      </v-tooltip>
    </v-card-title>

    <v-card-text>
      {{ plante.bibliothequePlante.description }}
    </v-card-text>
  </v-card>
  <v-row>
    <v-col>
      <v-card class="ma-10" prepend-icon="mdi-account">
        <v-card-title> INFORMATION PROPRIETAIRE</v-card-title>
        <v-card-subtitle>{{ plante.proprietaire.nom }} {{ plante.proprietaire.prenom }}</v-card-subtitle>
        <v-card-text>{{ plante.proprietaire.ville }}, {{ plante.proprietaire.cp }}</v-card-text>
        <v-btn class="ma-5">CONTACTER</v-btn>
        <router-link  class="text-decoration-none" :to="{ name: 'PagePersonne', params: { idPersonne:  plante.proprietaire.id }}"> <v-btn class="ma-5">PROFIL</v-btn></router-link>
      </v-card>
    </v-col>
    <v-col>
      <v-card class="ma-10" prepend-icon="mdi-flower-tulip">
        <v-card-title> INFORMATION PLANTE</v-card-title>
        <v-card-subtitle>{{ plante.localisation }}</v-card-subtitle>
        <v-card-text>Date de la garde : {{garde.dateDebut}} à {{garde.dateFin}}</v-card-text>
        <v-card-text>
          Statut : {{garde.statut.nom}}
        </v-card-text>
        <v-card-text v-if="garde.gardien != null">
          Gardien : {{garde.gardien.nom}}, {{garde.gardien.prenom}}
        </v-card-text>
        <v-btn v-if="plante.proprietaire.id !== user && garde.statut.id !== 1" @click="dialog = true" class="ma-5">GARDER</v-btn>
      </v-card>
    </v-col>
  </v-row>
  </div>
  <v-dialog
    v-model="dialog"
    width="auto"
  >
    <v-card>
      <v-card-title> Garde d'une {{plante.bibliothequePlante.nom}} / {{plante.bibliothequePlante.typePlante.nom}}</v-card-title>
      <v-card-subtitle>
        La garde est du {{garde.dateDebut}} au {{garde.dateFin}}
      </v-card-subtitle>
      <v-card-text> Vous vous engagez à garder cette plante en appuyant sur le bouton</v-card-text>
      <v-card-text>Pour plus d'informations pour comment garder cette {{plante.bibliothequePlante.nom}} --> <router-link :to="{ name: 'BibliothequePlanteItem', params: { idPlante:  plante.bibliothequePlante.id }}">ICI</router-link></v-card-text>
      <v-card-actions>
        <v-btn color="green" block @click="addGarde()">Garder</v-btn>
      </v-card-actions>
      <v-card-actions>
        <v-btn color="green" block @click="dialog = false">Fermer</v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
  <v-container  v-if="visite.length > 0 && garde !== null ">
      <v-card width="100%">
        <v-card-text>
          <div class="font-weight-bold ms-1 mb-2 ">
            Historique des visites
          </div>

          <v-timeline density="compact" align="center" >
            <v-timeline-item
              v-for="v in visite"
              :key="v.id"
              size="small"
            >
              <v-card >
                <v-img
                  :src="pathPhotoVisite+v.photo"
                  height="200px"
                  cover
                ></v-img>
                <v-card-title>
                  Date de la visite : {{ v.dateVisite }}
                </v-card-title>
                <v-card-text class="bg-white text--primary">
                  <h4>Commentaire :</h4>
                  <p>
                    {{v.commentaire.description}}
                  </p>
                  <v-divider></v-divider>
                 <p>Auteur : {{v.commentaire.auteur.prenom}}, {{v.commentaire.auteur.nom}}</p>
                </v-card-text>
              </v-card>
            </v-timeline-item>
          </v-timeline>
        </v-card-text>
      </v-card>
  </v-container>
  <v-card v-if="commentaire.length > 0"
          max-width="100%"
          class="ma-10"
  >
    <v-card-title>
      COMMENTAIRE
    </v-card-title>
    <v-card v-for="com in commentaire"
            :key="com.id">
      <v-card-subtitle>{{com.titre}}</v-card-subtitle>
      <v-card-text>{{com.description}}</v-card-text>
    </v-card>
  </v-card>
  <v-card v-if="role === 2"
          max-width="100%"
          class="ma-10"
  >
    <v-card-title>
      NEW COMMENTAIRE BOTANISTE
    </v-card-title>
    <v-form @submit.prevent="getFormValues">
      <v-text-field
        :rules="rule"
        v-model="titre"
        label="Titre"
      ></v-text-field>
      <v-textarea
        label="Commentaire"
        v-model="description"
        :rules="rule"></v-textarea>
      <v-btn
        class="ma-4"
        type="submit"
      >Commenter</v-btn>
    </v-form>
  </v-card>
  <div  v-if="isGardien === true">
    <router-link :to="{ name: 'VisiteAdd', params: { idGarde:  garde.id }}" class="text-decoration-none">
    <v-btn
      class="ma-10">Ajouter une visite
    </v-btn>
    </router-link>
  </div>

</template>

<script>
import axios from 'axios';
import NavBar from "@/layouts/navBar/NavBar.vue"
import Plante from "@/models/Plante";
import PhotoPlante from "@/models/PhotoPlante";
import GardePlante from "@/models/GardePlante";
import VisitePlante from "@/models/VisitePlante";
import Commentaire from "@/models/Commentaire";
import Personne from "@/models/Personne";

export default {
  name: "PlantesAGarderItemComponent",
  props: ['idGarde'],
  components: {NavBar},

  beforeMount() {
    this.getUser();
    this.getCommentaires();
    this.getPlanteId();
    this.getVisiteByGarde();
  },
  data() {
    return {
      dialog: false,
      photos: [],
      plante: null,
      garde: null,
      isGardien: false,
      titre: null,
      role: this.$store.state.role,
      description: null,
      nom: null,
      pathPhoto: "/src/assets/photo-plante/",
      pathPhotoVisite: "/src/assets/photo_visite/",
      error: null,
      user: this.$store.state.user,
      visite: [],
      commentaire: [],
      rule: [
        value => {
          if (value) return true
          return 'Le champs doit être rempli'
        },
      ],
    }
  },
  methods: {
    getUser(){
      axios.get("http://127.0.0.1:9000/personne/id/"+this.$store.state.user,
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
    getCommentaires(){
      axios.get("http://127.0.0.1:9000/commentaire/all/byBotaniste/"+ this.idGarde,
        {
          withCredentials: false,
          headers: {
            'Authorization': 'Bearer ' +this.$store.state.token,
            'Content-Type': 'application/json',
          }
        })
        .then( rep => {
          if (rep.data) {
            for (const dataKey in rep.data) {
              this.commentaire.push(new Commentaire(rep.data[dataKey].id, rep.data[dataKey].description,  rep.data[dataKey].titre, rep.data[dataKey].auteur, rep.data[dataKey].gardePlante));
            }
          }
        }).catch(() => {
        this.error = "Error"
      })
    },
    async getFormValues(id, newComp) {
      await axios.post(
        'http://127.0.0.1:9000/commentaire/add',
        {
          titre: this.titre,
          description: this.description,
          auteur: this.user,
          gardePlante: this.garde,
        },
        {
          withCredentials: false,
          headers: {
            'Authorization': 'Bearer ' +this.$store.state.token,
            'Content-Type': 'application/json',
          }
        }
      ) .then( response => {
        window.reload(id, newComp)
      })
        .catch(() => {
          this.errorLogin = true;
        })
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
              this.plante = new Plante(rep.data.plante.id, rep.data.plante.localisation, rep.data.plante.bibliothequePlante, rep.data.plante.proprietaire);
              this.garde = new GardePlante(rep.data.id,rep.data.dateDebut, rep.data.dateFin, rep.data.gardien, rep.data.plante, rep.data.statut)
              if(this.user === rep.data.gardien.id){
                this.isGardien = true;
              }
              axios.get(`http://127.0.0.1:9000/photo-plante/all/idPlante/${rep.data.plante.id}`,
                {
                  withCredentials: false,
                  headers: {
                    'Authorization': 'Bearer ' + this.$store.state.token,
                    'Content-Type': 'application/json',
                  }
                }).then(
                photo => {
                  if (photo.status === 200) {
                    for (const photoKey in photo.data) {
                      this.photos.push(new PhotoPlante(photo.data[photoKey].id, photo.data[photoKey].photo, photo.data[photoKey].plante));
                    }
                  }
                }
              ).catch(() => {

              })
            }
          }
        ).catch(() => {
        this.error = "Erreur plante"
      })
    },
    addGarde(id, newComp) {
      axios.put("http://127.0.0.1:9000/garde-plante/"+this.garde.id+"/update/gardien/"+this.$store.state.user+"/status",
        {
          withCredentials: false,
          headers: {
            'Authorization': 'Bearer ' + this.$store.state.token,
            'Content-Type': 'application/json',
          }
        })
        .then(rep => {
          window.reload(id, newComp);
          }
        ).catch(() => {
        this.error = "Erreur plante"
      })
    },
    getVisiteByGarde() {
      axios.get("http://127.0.0.1:9000/visite-plante/all/byGarde/" +this.idGarde,
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
              this.visite.push(new VisitePlante(rep.data[repKey].id, rep.data[repKey].dateVisite, rep.data[repKey].photo, rep.data[repKey].gardePlante, rep.data[repKey].gardien, rep.data[repKey].plante, rep.data[repKey].commentaire))
            }
          }
        }).catch(() => {
        this.error = "Pas de plante à garder"
      })
    },
  }
}
</script>
