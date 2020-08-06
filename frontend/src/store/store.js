import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export const store = new Vuex.Store({
  state: {
    lineData: [2, 3, 4, 5, 6, 7],
    country: "Germany"
  },
  mutations: {
    updateLineDate(state, data) {
      state.lineData = data;
    },
    updateCountry(state, data) {
      state.country = data;
    }
  }
});
