<template>
  <v-container class="fill-height" fluid>
    <v-row align="center" justify="center" dense>
      <v-col cols="12" sm="8" md="4" lg="4">
        <v-card elevation="0">
          <div class="text-center">
            <h1 class="mb-2">Register</h1>
          </div>
          <v-card-text>
            <v-form @submit.prevent="getFormValues" method="POST">
              <v-text-field v-model="firstname" label="Prénom" name="firstname" prepend-inner-icon="mdi-account" type="text" class="rounded-0" outlined></v-text-field>
              <v-text-field v-model="lastname" label="Nom" name="name" prepend-inner-icon="mdi-account" type="text" class="rounded-0" outlined></v-text-field>
              <v-text-field v-model="email" label="Email" name="email" prepend-inner-icon="mdi-email" type="email" class="rounded-0" outlined></v-text-field>
              <v-text-field v-model="adress" label="Adresse" name="adress" prepend-inner-icon="mdi-home" type="text" class="rounded-0" outlined></v-text-field>
              <v-text-field v-model="ville" label="Ville" name="ville"  type="text" class="rounded-0" outlined></v-text-field>
              <v-text-field v-model="cp" label="Code Postal" name="cp" type="text" class="rounded-0" outlined></v-text-field>
              <v-text-field v-model="mdp" label="Entrer votre mot de passe" name="password" prepend-inner-icon="mdi-lock" type="password" class="rounded-0" outlined></v-text-field>
              Un caractère spécial, un chiffre, une majuscule et minimum 12 caractères
              <v-text-field v-model="confMdp" label="Confirmer votre mot de passe à nouveau" name="password" prepend-inner-icon="mdi-lock-outline" type="password" class="rounded-0" outlined></v-text-field>
              <v-btn class="rounded-0" color="black" x-large block dark type="submit">S'inscrire</v-btn>
              <v-card-actions class="text--secondary">
                <v-spacer></v-spacer>
                Déjà un compte ? <router-link to="/" class="pl-2" style="color: #228b22">Se connecter</router-link>
              </v-card-actions>
            </v-form>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import axios from 'axios';

export default {
  name: "InscriptionComponent",
  data() {
    return {
      email: null,
      firstname: null,
      lastname: null,
      adress: null,
      ville: null,
      cp: null,
      errorLogin: false,
      mdp: null,
      confMdp: null,
      rules: [
        value => {
          if (value) return true
          return 'Le champs doit être rempli'
        },
      ],
    }
  },
  methods: {
    validatePassword(value) {
      // La CNIL recommande d'utiliser un mot de passe fort qui a au moins 12 caractères,
      // une combinaison de lettres majuscules et minuscules, de chiffres et de caractères spéciaux.
      const regex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*]).{12,}$/;
      return regex.test(value);
    },
    async getFormValues() {
      if (!this.firstname ||!this.lastname || !this.adress || !this.ville || !this.cp || !this.email || !this.mdp || !this.confMdp) {
        alert('Veuillez remplir tous les champs.');
        return;
      }
      if (!this.validatePassword(this.mdp)) {
        alert('Le mot de passe ne répond pas aux exigences de la CNIL.');
        return;
      }
      if (this.mdp !== this.confMdp) {
        alert('Les mots de passe ne correspondent pas.');
        return;
      }
        await axios.post(
          'https://arosaje-back.jadedomasvasserot.com/auth/register',
          {
            firstname: this.firstname,
            lastname: this.lastname,
            email: this.email,
            password: this.mdp,
            cp: this.cp,
            ville: this.ville,
            adresse: this.adress
          },
          {
            withCredentials: false,
            headers: {
              'Content-Type': 'application/json',
            }
          }
        ).then(response => {
          if (response.status === 200) {
            this.$store.commit('setUser', response.data.idUser)
            this.$store.commit('setToken', response.data.token)
            this.$store.commit('setRole', response.data.role)
            this.$router.push({
              path: '/home',
              query: this.$route.query,
              hash: this.$route.hash,
            })
          }
        })
          .catch(() => {
            this.errorLogin = true;
          })
      }
    }
}
</script>
