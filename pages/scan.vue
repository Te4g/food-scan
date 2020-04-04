<template>
  <div>
    <Scanner />
    <v-file-input />
    <v-btn>click me</v-btn>
    <div id="scanProduct"></div>
  </div>
</template>

<script>
import Scanner from '../components/Scanner'
export default {
  components: {
    Scanner
  }
}

</script>

<style scoped>

</style>
