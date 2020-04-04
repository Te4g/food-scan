<template>
  <div>
    <v-quagga :on-detected="logIt" :reader-size="readerSize" :reader-types="['ean_reader']" />
  </div>
</template>

<script>
import Vue from 'vue'
import VueQuagga from 'vue-quaggajs'

// register component 'v-quagga'
Vue.use(VueQuagga)

export default {
  name: 'VueBarcodeTest',
  data () {
    return {
      readerSize: {
        width: 640,
        height: 480
      },
      detecteds: []
    }
  },
  methods: {
    logIt (data) {
      console.log('detected', data)
    }

  }
}
</script>
