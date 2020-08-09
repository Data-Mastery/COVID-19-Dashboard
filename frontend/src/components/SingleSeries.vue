<template>
  <div>
    <highcharts :options="chartData" v-if="this.$store.state.shrunk & this.isMounted"></highcharts>
  </div>
</template>

<script>
import { mapState } from "vuex";

export default {
  mounted() {
    this.isMounted = true;
  },
  data() {
    return {
      isMounted: false
    };
  },
  computed: {
    ...mapState(["lineData", "country"]),
    chartData() {
      return {
        chart: {
          type: "column"
        },
        title: {
          text: `Overall cases for ${this.country}: <strong>${Math.max(
            ...this.lineData["data"]
          )}</strong>`
        },
        yAxis: {
          title: {
            text: "Total Cases"
          }
        },
        xAxis: {
          categories: this.lineData["columns"]
        },
        legend: {
          enabled: false
        },
        series: [
          {
            data: this.lineData["data"],
            name: this.country,
            color: "#229695"
          }
        ]
      };
    }
  }
};
</script>

<style scoped></style>
