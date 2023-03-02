  <template>
    <v-sheet width="300" class="mx-auto">
      <v-form @submit.prevent="getFormValues" method="POST">
        <v-responsive
          class="mx-auto"
          max-width="344"
        >
          <v-text-field
            v-model="email"
            hide-details="auto"
            label="Email"
            placeholder="johndoe@gmail.com"
            type="email"
            :rules="rules"
            class="mb-2"
          ></v-text-field>
        </v-responsive>
        <v-responsive
          class="mx-auto"
          max-width="344"
        >
          <v-text-field
            :rules="rules"
            class="mb-2"
            v-model="password"
            label="Mot de passe"
            type="password"

            hint="Enter your password to access this website"
          ></v-text-field>
        </v-responsive>
        <v-btn type="submit" block class="mt-2"> Se connecter</v-btn>
      </v-form>
      <div class="d-flex justify-space-around align-center flex-column flex-sm-row fill-height ma-10">
        <v-btn class="ma-2 pa-2">
          <router-link class="btn-router-link" to="/forgot-mdp">Mot de passe oublié ?</router-link>
        </v-btn>

        <v-btn class="ma-2 pa-2">
          <router-link class="btn-router-link" to="/inscription">Pas encore de compte ?</router-link>
        </v-btn>
      </div>
    </v-sheet>
    <div v-if="errorLogin === true">
      <v-alert
        color="error"
        icon="$error"
        title="PROBLEME"
        text="Le mot de passe ou le nom de compte n'est pas valide"
      ></v-alert>
    </div>

  </template>

  <script>
  import axios from 'axios';

  export default {
    data() {
      return {
        email: null,
        errorLogin: false,
        password: null,
        rules: [
          value => {
            if (value) return true
            return 'Le champs doit être rempli'
          },
        ],
      }
    },
    methods: {
      async getFormValues(submitEvent) {
        await axios.post(
          'https://arosaje-mspr.mrartemus.cloud/auth/authenticate',
          {
            email: this.email,
            password: this.password,
          },
          {
            withCredentials: false,
            headers: {
                    'Content-Type': 'application/json',
            }
          }
        ) .then( response => {
          if(response.status === 200) {
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
      },
    }
  </script>

  <style>
  .btn-router-link {
    text-decoration: none;
    color: forestgreen;
  }
  </style>
