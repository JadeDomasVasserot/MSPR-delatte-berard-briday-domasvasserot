/**
 * plugins/index.ts
 *
 * Automatically included in `./src/main.ts`
 */

// Plugins
import { loadFonts } from './webfontloader'
import vuetify from './vuetify'
import 'vuetify/dist/vuetify.min.css'
import VueGoogleMaps from '@fawmi/vue-google-maps'


import router from '../router'

// Types
import type { App } from 'vue'
import store from "@/store";

export function registerPlugins (app: App) {
  loadFonts()
  app
    .use(VueGoogleMaps, {
      load: {
        key: 'AIzaSyCePBNE19fS_2ySOK2zq2EtaSNIe0pDbEs',
      },
    })
    .use(vuetify)
    .use(router)
    .use(store)


}
