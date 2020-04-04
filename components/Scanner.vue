<template>
<div>
  <p>le code est: {{ code }} </p>
</div>
</template>

<script>
import Quagga from 'quagga'

export default {
  name: 'Scanner',
  data () {
    return {
      code: ''
    }
  },
  mounted () {
    Quagga.init({
      inputStream: {
        name: 'Live',
        type: 'LiveStream',
        target: document.querySelector('#scanProduct')
      },
      decoder: {
        readers: ['code_128_reader']
      }
    }, function (err) {
      if (err) {
        console.log(err)
        return
      }
      console.log('Init ok, ready to start')
      Quagga.start()
      Quagga.onDetected(this.onDetected)
    })
  },
  destroyed () {
    Quagga.stop()
  },
  methods: {
    onDetected (result) {
      this.code = result.codeResult.code
    }
  }
}
</script>

<style scoped>

</style>
