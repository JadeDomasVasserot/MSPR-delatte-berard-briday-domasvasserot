// Composables
import { createRouter, createWebHistory } from 'vue-router'

const routes = [
  {
    path: '/',
    component: () => import('@/layouts/default/Default.vue'),
    children: [
      {
        path: '/',
        name: 'LoginComponent',
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ '@/views/Login.vue'),
      },
      {
        path: '/inscription',
        name: 'InscriptionComponent',
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ '@/views/Inscription.vue'),
      },
      {
        path: '/forgot-mdp',
        name: 'MotdePasseComponent',
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ '@/views/MotDePasse.vue'),
      },
      {
        path: '/home',
        name: 'Accueil',
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ '@/views/Accueil.vue'),
      },
      {
        path: '/profil',
        name: 'Profil',
        props: true,
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ '@/views/Profile.vue'),
      },
      {
        path: '/profil/modifier',
        name: 'ModifieProfil',
        props: true,
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ '@/views/ModifierProfile.vue'),
      },
      {
        path: '/contact',
        name: 'ContactezNous',
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ '@/views/ContacterNous.vue'),
      },
      {
        path: '/chat',
        name: 'Chat',
        props: true,
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ '@/views/Chat.vue'),
      },
      {
        path: '/bibliotheque-plante',
        name: 'BibliothequePlante',
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ '@/views/BibliothequePlante.vue'),
      },
      {
        path: '/bibliotheque-plante/:idPlante',
        name: 'BibliothequePlanteItem',
        props: true,
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ '@/views/BibliothequePlanteItem.vue'),
      },
      {
        path: '/mes-gardes/:idUser',
        name: 'Calendrier',
        props: true,
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ '@/views/MesGardes.vue'),
      },

      {
        path: '/plantes/:idPlante',
        name: "PlanteItem",
        props: true,
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ '@/views/PlantesItem.vue'),
      },
      {
        path: '/mes-plantes/add',
        name: 'AjoutePlante',
        props: true,
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ '@/views/MesPlantesItemAjout.vue'),
      },
      {
        path: '/mes-plantes/delete',
        name: 'SupprimePlante',
        props: true,
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ '@/views/MesPlantesItemDelete.vue'),
      },
      {
        path: '/mes-plantes/garde',
        name: 'GarderPlante',

        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ '@/views/MesPlantesItemGarde.vue'),
      },
      {
        path: '/mes-plantes/edit',
        name: 'ModifiePlante',
        props: true,
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ '@/views/MesPlantesItemModifier.vue'),
      },
    ],

  },

]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
})

export default router
