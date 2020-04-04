<template>
  <div>
    <Scanner />
    <v-file-input />
    <v-btn>click me</v-btn>
    <div v-if="code">
      le codebar est : {{ code }}
    </div>
    <div id="scanProduct" />
  </div>
</template>

<script>
import Scanner from '../components/Scanner'
export default {
  components: {
    Scanner
  },
  data () {
    return {
      code: null
    }
  }
}

</script>

<style scoped>

</style>
