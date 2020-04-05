<template>
  <div>
    <v-quagga :on-detected="logIt" :reader-size="readerSize" :reader-types="['ean_reader']" />
    <p>le code est : {{ code }}</p>
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
      code: '',
      detecteds: []
    }
  },
  methods: {
    logIt (data) {
      console.log('detected', data)
      this.code = data.codeResult.code
    }

  }
}
</script>
