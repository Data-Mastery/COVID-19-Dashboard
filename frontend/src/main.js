import Vue from "vue";
import App from "./App.vue";
import vuetify from "./plugins/vuetify";
import Highcharts from "highcharts";
import Maps from "highcharts/modules/map";
import HighchartsVue from "highcharts-vue";

import { store } from "./store/store";

Maps(Highcharts);
Vue.use(HighchartsVue);
Vue.config.productionTip = false;

new Vue({
  vuetify,
  store,
  render: h => h(App)
}).$mount("#app");
