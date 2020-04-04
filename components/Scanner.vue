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
        constraints: {
          width: window.innerWidth,
          height: window.innerHeight,
          facingMode: 'environment'
        },
        area: {
          top: '0%',
          right: '0%',
          left: '0%',
          bottom: '0%'
        },
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
