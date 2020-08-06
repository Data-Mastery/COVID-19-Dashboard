<template>
  <div>
    <highcharts v-if="isMounted" :options="chartData"></highcharts>
  </div>
</template>

<script>
import { mapState } from "vuex";

export default {
  mounted() {
    this.isMounted = true;
  },
  methods: {
    changeArr: function() {
      if (this.selectval === "fizz") {
        this.$store.commit("updateLineDate", [10, 20, 30, 21, 19, 12]);
      } else if (this.selectval === "bar") {
        this.$store.commit(
          "updateLineDate",
          [10, 20, 30, 21, 19, 12].reverse()
        );
      } else {
        this.$store.commit("updateLineDate", [7, 13, 20, 45, 19, 12]);
      }
    }
  },
  data() {
    return {
      selectval: [],
      items: ["foo", "bar", "fizz", "buzz"],
      isMounted: false
    };
  },
  computed: {
    ...mapState(["lineData"]),
    chartData() {
      return {
        chart: {
          type: this.type
        },
        series: [
          {
            data: this.lineData,
            name: "Test Series",
            color: this.color
          }
        ]
      };
    }
  }
};
</script>

<style scoped></style>
