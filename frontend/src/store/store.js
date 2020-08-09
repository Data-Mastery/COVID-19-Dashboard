import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export const store = new Vuex.Store({
  state: {
    lineData: {
      data: [],
      columns: []
    },
    country: "Norway",
    shrunk: false
  },
  getters: {
    restructureArr: state => {
      let raw = [
        {
          name: state.lineData.data,
          country: state.lineData.columns
        }
      ];

      let list = [];
      for (let i = 0; i < raw.length; i++) {
        let obj = raw[i];
        if (obj.name.length == obj.country.length) {
          for (let i = 0; i < obj.name.length; i++) {
            list.push({ name: obj.name[i], country: obj.country[i] });
          }
        }
      }
      list = list.reverse();
      return list;
    }
  },
  mutations: {
    updateLineDate(state, data) {
      state.lineData = data;
    },
    updateCountry(state, data) {
      state.country = data;
    },
    updateShrunk(state, data) {
      state.shrunk = data;
    }
  }
});
