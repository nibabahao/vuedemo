import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const state = {
  cid: 0,
  shareShow: false
}
const mutations = {
  A_GET: (state, opts) => {
    console.log(state, opts)
  }
}
const actions = {
  a_get: ({commit}, state, opts) => {
    commit('A_GET', state, opts)
  }
}
const getters = {

}
const store = new Vuex.Store({
  state,
  mutations,
  getters,
  actions
})

export default store
