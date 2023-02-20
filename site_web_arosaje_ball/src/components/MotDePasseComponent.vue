<template>
  <v-container>
    <v-row align="center" justify="center" dense>
      <v-col cols="12" sm="8" md="4" lg="4">
        <v-card elevation="0">
          <div class="text-center">
            <h1 class="mb-2">Mot de passe oublié</h1>
            <p>Nous allons vous envoyer un email de réinitialisation de mot de passe.</p>
          </div>
          <a href="#">
            <v-img src="@/assets/logo_app.png" alt="logo" contain height="200" class="ma-3"/>
          </a>
          <v-form>
            <v-text-field
              label="Entrer votre adresse email associée"
              name="email"
              prepend-inner-icon="mdi-email"
              type="email"
              class="rounded-0"
              outlined
            ></v-text-field>
            <v-btn class="rounded-0" color="black" x-large block dark>Réinitialiser le mot de passe</v-btn>
          </v-form>
        </v-card>
      </v-col>
    </v-row>
      <div class="d-flex justify-space-around align-center flex-column flex-sm-row fill-height ma-10">
        <v-btn class="ma-2 pa-2">
          <router-link class="btn-router-link" to="/">Se connecter</router-link>
        </v-btn>

        <v-btn class="ma-2 pa-2">
          <router-link class="btn-router-link" to="/inscription">Pas encore de compte ?</router-link>
        </v-btn>
      </div>
  </v-container>
</template>

<script>

export default {
  name: "MotDePasseComponent"
}
</script>
<style>
.btn-router-link {
  text-decoration: none;
  color: forestgreen;
}
</style>
