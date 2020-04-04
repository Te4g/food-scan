<template>
  <div>
    <Scanner />
    <v-file-input id="scanProduct" />
    <v-btn>click me</v-btn>
  </div>
</template>

<script>
import Scanner from '../components/Scanner'
export default {
  components: { Scanner }
}

</script>

<style scoped>

</style>
