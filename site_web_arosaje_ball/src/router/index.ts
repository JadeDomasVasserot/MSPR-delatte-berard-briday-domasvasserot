// Composables
import { createRouter, createWebHistory } from 'vue-router'
import store from '../store/index';

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
        component: () => import(/* webpackChunkName: "home" */ '../views/Login.vue'),

      },
      {
        path: '/inscription',
        name: 'InscriptionComponent',
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ '../views/Inscription.vue'),
      },
      {
        path: '/forgot-mdp',
        name: 'MotdePasseComponent',
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ '../views/MotDePasse.vue'),
      },
      {
        path: '/home',
        name: 'Accueil',
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ '../views/Accueil.vue'),
      },
      {
        path: '/map',
        name: 'Map',
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ '../views/Map.vue'),
      },
      {
        path: '/profile',
        name: 'Profile',
        props: true,
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ '../views/Profile.vue'),
      },
      {
        path: '/profil/modifier',
        name: 'ModifieProfil',
        props: true,
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ '../views/ModifierProfile.vue'),
      },
      {
        path: '/contact',
        name: 'ContactezNous',
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ '../views/ContacterNous.vue'),
      },
      {
        path: '/chat',
        name: 'Chat',
        props: true,
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ '../views/Chat.vue'),
      },
      {
        path: '/bibliotheque-plante',
        name: 'BibliothequePlante',
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ '../views/BibliothequePlante.vue'),
      },
      {
        path: '/bibliotheque-plante/id/:idPlante',
        name: 'BibliothequePlanteItem',
        props: true,
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ '../views/BibliothequePlanteItem.vue'),
      },
      {
        path: '/mes-gardes',
        name: 'Calendrier',
        props: true,
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ '../views/MesGardes.vue'),
      },
      {
        path: '/mes-plantes',
        name: 'MesPlantes',
        props: true,
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ '../views/MesPlantes.vue'),
      },
      {
        path: '/mes-plantes/:idPlante',
        name: "PlanteItem",
        props: true,
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ '../views/MesPlantesItem.vue'),
      },
      {
        path: '/mes-plantes/add',
        name: 'AjoutePlante',
        props: true,
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ '../views/MesPlantesItemAjout.vue'),
      },
      {
        path: '/mes-plantes/delete/:idPlante',
        name: 'SupprimePlante',
        props: true,
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ '../views/MesPlantesItemDelete.vue'),
      },
      {
        path: '/mes-plantes/garde/:idPlante',
        name: 'GarderPlante',
        props: true,

        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ '../views/MesPlantesItemGarde.vue'),
      },
      {
        path: '/mes-plantes/edit/:idPlante',
        name: 'ModifiePlante',
        props: true,
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ '../views/MesPlantesItemModifier.vue'),
      },
      {
        path: '/add-guide/:idPlante',
        name: 'AjouterUnGuide',
        props: true,
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ '../views/AjouterUnGuide.vue'),
      },
      {
        path: '/plantes-a-garder/:idGarde',
        name: "PlantesAGarderItem",
        props: true,
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ '../views/PlantesAGarderItem.vue'),
      },
      {
        path: '/page-personne/:idPersonne',
        name: "PagePersonne",
        props: true,
        // route level code-splitting
        // this generates a separate chunk (about.[hash].js) for this route
        // which is lazy-loaded when the route is visited.
        component: () => import(/* webpackChunkName: "home" */ '../views/PagePersonne.vue'),
      },
    ],
  },

]
const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
})
/*
router.beforeEach(async (to, from) => {
  const authenticated = store.getters.getUser
  const token = store.getters.getToken
  // redirect the user to login page if he is not authenticated
  if (authenticated === "" && token === ""
    && to.name !== 'MotdePasseComponent'
    && to.name !== 'InscriptionComponent'
    && to.name !== 'LoginComponent') {
    return { name: 'LoginComponent' }
  }
})
*/
export default router
