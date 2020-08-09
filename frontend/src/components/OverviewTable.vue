<template>
  <v-card class="d-inline-block mx-auto" light>
    <v-data-table
      :headers="chartData.headers"
      :items="chartData.desserts"
      v-if="this.$store.state.shrunk & this.isMounted"
    ></v-data-table>
  </v-card>
</template>



<script>
import { mapGetters } from "vuex";

export default {
  mounted() {
    this.isMounted = true;
  },
  data: function() {
    return {
      isMounted: false
    };
  },
  computed: {
    ...mapGetters(["restructureArr"]),
    chartData() {
      return {
        singleSelect: false,
        selected: [],
        headers: [
          {
            text: "Cases by day",
            align: "start",
            sortable: false,
            value: "name"
          },
          { text: "Date", value: "country" }
        ],
        desserts: this.restructureArr
      };
    }
  }
};
</script>