import { createApp } from 'vue'
import { createStore } from 'vuex'

// Create a new store instance.
const store = createStore({
  state () {
    return {
      user: '',
      token: '',
      role: '',
    }
  },
  mutations: {
  setUser(state, userConnect) {
    return state.user = userConnect;
  },
  setToken(state, tokenConnect) {
    return state.token = tokenConnect;
  },
  setRole(state, roleConnect) {
    return state.role = roleConnect;
  },
  },
  getters: {
    getUser(state) {
      return state.user;
    },
    getToken(state) {
      return state.token;
    },
    getRole(state) {
      return state.role;
    },
  }
})
export default store
