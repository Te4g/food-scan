<template>
  <div>yo</div>
</template>

<script>
import Quagga from 'quagga'

export default {
  name: 'Scanner',
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
    })
  },
  destroyed () {
    Quagga.stop()
  }
}
</script>

<style scoped>

</style>
