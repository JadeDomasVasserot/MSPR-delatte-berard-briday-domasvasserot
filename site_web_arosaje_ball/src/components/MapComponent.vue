<template>
  <nav-bar/>
  <GMapMap
    class="ma-5"
    :center="center"
    :zoom="13"
    style="width: 95vw; height: 40rem"
  >
    <GMapMarker
      :position="myPosition.position"
      :clickable="true"
      :draggable="true"
      :icon='{
          url: "https://img.icons8.com/ios-glyphs/1x/user.png",
          scaledSize: {width: 30, height: 30},
          labelOrigin: {x: 16, y: -10},

      }'
      @click="openMarker(0)" >
      <GMapInfoWindow
        :closeclick="true"
        @closeclick="openMarker(null)"
        :opened="openedMarkerID === 0"
      >
        <div>Ma position </div>
      </GMapInfoWindow>
    </GMapMarker>
    <GMapMarker
      v-for="(marker, index)  in markers"
      :key="marker"
      :position="marker"
      :clickable="true"
      :draggable="true"
      :icon='{
          url: "https://cdn.pixabay.com/photo/2022/02/05/18/42/plant-6995536_960_720.png",
          scaledSize: {width: 20, height: 30},
          labelOrigin: {x: 16, y: -10}
      }'
      @click="openMarker(garde[index].id)" >
      <GMapInfoWindow
        :closeclick="true"
        @closeclick="openMarker(null)"
        :opened="openedMarkerID === garde[index].id"
      >
        <v-card>
          <router-link class="btn-router-link" :to="{ name: 'PlantesAGarderItem', params: { idGarde:  garde[index].id }}">
            <v-card-title>
           {{ garde[index].plante.bibliothequePlante.nom }}
            </v-card-title>
          </router-link>
          <v-card-text class="bg-white text--primary">
            <h4>Date de la garde :</h4>
            <p>
              {{garde[index].dateDebut}} à {{garde[index].dateFin}}
            </p>
            <v-divider></v-divider>
            <p>Propriétaire : {{garde[index].plante.proprietaire.nom}}, {{garde[index].plante.proprietaire.prenom}}</p>
          </v-card-text>
        </v-card>
      </GMapInfoWindow>
    </GMapMarker>
  </GMapMap>
</template>

<script>

import NavBar from "@/layouts/navBar/NavBar.vue";
import axios from "axios";
import Personne from "@/models/Personne";
import GardePlante from "@/models/GardePlante";

export default {
  name: "MapComponent",
  components: {NavBar},

  beforeMount() {
    this.geolocate();
    this.getUser();
    this.getPlantes()
  },
  data() {
    return {
      openedMarkerID: null,
      pathPhoto: "/src/assets/photo-plante/",
      center: [],
      geocoder: null,
      plantes: [],
      myPosition:
        {
          label: 'Postiton',
          position: {
            lat: 45.7211904, lng: 4.7906816
          },
        }
      ,
      markers: [],

    }
  },
  methods: {
    geolocate() {
      navigator.geolocation.getCurrentPosition(position => {
        this.center = {
          lat: position.coords.latitude,
          lng: position.coords.longitude,
        };
      });
    },
    openMarker(id) {
      this.openedMarkerID = id
    },
    getPlantes() {
      axios.get("https://arosaje-mspr.mrartemus.cloud/garde-plante/all/byAGarder",
        {
          withCredentials: false,
          headers: {
            'Authorization': 'Bearer ' + this.$store.state.token,
            'Content-Type': 'application/json',
          }
        })
        .then(async rep => {
          if (rep.data) {
            this.plantes = [];
            if (!this.garde) this.garde = []
            for (const repKey in rep.data) {
              this.garde.push(new GardePlante(rep.data[repKey].id, rep.data[repKey].dateDebut, rep.data[repKey].dateFin, rep.data[repKey].gardien, rep.data[repKey].plante, rep.data[repKey].statut))
              const location = await this.geocodingQuery(rep.data[repKey].plante.proprietaire.adresse, rep.data[repKey].plante.proprietaire.ville);
              this.markers.push(location)
            }
          }
        }).catch(() => {
        this.error = "Pas de plante à garder"
      })
    },
    async geocodingQuery(address, city) {
      const geocoderQuery = encodeURIComponent(`${address} ${city}`.replace(/ /g, '+'));
      const res = await axios.get(`https://maps.googleapis.com/maps/api/geocode/json?address=${geocoderQuery}&key=AIzaSyCePBNE19fS_2ySOK2zq2EtaSNIe0pDbEs`);
      if (res.data.results.length === 0) return null;
      return {
        lat: res.data.results['0'].geometry.location.lat,
        lng: res.data.results['0'].geometry.location.lng
      }
    },
    getUser() {
      axios.get("https://arosaje-mspr.mrartemus.cloud/personne/id/" + this.$store.state.user,
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
          }
        ).catch(() => {
        this.error = "Error"
      })
    },
  }
}
</script>
<style scoped>
.btn-router-link{
  text-decoration: none;
  color: forestgreen;
}
</style>
