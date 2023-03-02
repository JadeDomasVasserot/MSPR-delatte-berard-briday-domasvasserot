<template>
    <v-footer class="d-flex flex-column">
      <div class="bg-green-accent-4 d-flex w-100 align-center px-4 pt-0">
        <strong>Télécharger l'application : </strong>
        <v-spacer></v-spacer>
        <img id="btn-play-store" src="@/assets/Google-Play-Logo.png" alt=""/>
        <v-spacer></v-spacer>
        <v-btn
          class="mx-4"
          icon="mdi-trello"
          variant="plain"
          size="small"
          href="https://trello.com/b/gsxJlWal/msprgroupe-erine-jade-hugo-duncan"
        >
        </v-btn>
        <v-btn
          class="mx-4"
          icon="mdi-github"
          variant="plain"
          size="small"
          href="https://github.com/JadeDomasVasserot/MSPR-delatte-berard-briday-domasvasserot"
        >
        </v-btn>
      </div>

      <div class="px-4 py-2 bg-grey-lighten-1 text-center w-100">
        {{ new Date().getFullYear() }} — <strong>Arosaje Ball </strong>
      </div>
    </v-footer>
  </template>

  <script >
    export default {
        name: "FooterBar",
        data: () => ({
          aspectRatio: 16 / 9,
          aspectRatios: [
            {
              title: '16/9',
              value: 16 / 9,
            },
            {
              title: '4/3',
              value: 4 / 3,
            },
            {
              title: '1/1',
              value: 1,
            },
          ],
    }),
    }
  </script>

  <style scoped>
  #btn-play-store {
    padding: 2vh;
  }
  </style>
