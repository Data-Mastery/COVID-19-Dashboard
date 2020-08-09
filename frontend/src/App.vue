<template>
  <v-app id="inspire">
    <v-navigation-drawer v-model="drawer" app clipped>
      <v-list dense>
        <v-list-item link>
          <v-list-item-action>
            <v-icon>mdi-view-dashboard</v-icon>
          </v-list-item-action>
          <v-list-item-content>
            <v-list-item-title>Dashboard</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>

    <v-app-bar app clipped-left>
      <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
      <v-toolbar-title>Corona Dashboard</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-toolbar-title>
        <v-img :src="require(`@/assets/logo.png`)" contain height="100%" width="210px" />
      </v-toolbar-title>
    </v-app-bar>

    <v-main>
      <v-container fluid>
        <v-row align="center" justify="center">
          <h2>Example for a VueJS Frontend with a R-Shiny Backend Server</h2>
        </v-row>
        <v-row>
          <worldmap></worldmap>
          <v-col cols="12" sm="3">
            <overviewtable></overviewtable>
          </v-col>
          <v-col cols="12" sm="12">
            <singleseries></singleseries>
          </v-col>
        </v-row>
      </v-container>
    </v-main>

    <v-footer app>
      <span>&copy; {{ new Date().getFullYear() }}</span>
    </v-footer>
  </v-app>
</template>

<script>
import WorldMap from "./components/WorldMap";
import OverviewTable from "./components/OverviewTable";
import SingleSeries from "./components/SingleSeries";
import { mapState } from "vuex";

export default {
  props: {
    source: String
  },
  components: {
    worldmap: WorldMap,
    overviewtable: OverviewTable,
    singleseries: SingleSeries
  },
  computed: {
    ...mapState({
      lineData: state => state.lineData.data.length
    })
  },
  data: () => ({
    dynamicCol: 12,
    drawer: null
  }),
  created() {
    this.$vuetify.theme.dark = true;
  }
};
</script>

<style scoped>
</style>
