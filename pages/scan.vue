<template>
  <v-layout>
    <v-container>
      <v-row v-if="detected">
        <v-card
          class="mx-auto"
          max-width="344"
        >
          <v-img
            :src="product.product.image_front_url"
            height="200px"
          />

          <v-card-title>
            {{ product.product.product_name }}
          </v-card-title>

          <v-card-subtitle>
            {{ product.product.brands }}
          </v-card-subtitle>

          <v-card-actions>
            <v-btn text>
              Add to meal
            </v-btn>

            <v-btn
              color="purple"
              text
              @click="activateScan"
            >
              Scan one more
            </v-btn>

            <v-spacer />

            <v-btn
              icon
              @click="show = !show"
            >
              <v-icon>{{ show ? 'mdi-chevron-up' : 'mdi-chevron-down' }}</v-icon>
            </v-btn>
          </v-card-actions>

          <v-expand-transition>
            <div v-show="show">
              <v-divider />

              <v-card-text>
                <v-list-item>
                  <v-list-item-content>Kcal/100g : {{ product.product.nutriments.energy_100g }}</v-list-item-content>
                  <v-list-item-content>Quantity package : {{ product.product.quantity }}</v-list-item-content>
                  <v-list-item-content>Kcal package : {{ Math.round(product.product.nutriments.energy_100g * product.product.quantity / 100) }}</v-list-item-content>
                  <v-list-item-content>Sugar/100g : {{ product.product.nutriments.sugars_100g }}</v-list-item-content>
                  <v-list-item-content>Sodium/100g : {{ product.product.nutriments.sodium_100g }}</v-list-item-content>
                </v-list-item>
              </v-card-text>
            </div>
          </v-expand-transition>
        </v-card>
      </v-row>
      <v-row>
        <v-quagga :on-detected="logIt" :reader-size="readerSize" :reader-types="['ean_reader']" />
      </v-row>
    </v-container>
  </v-layout>
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
      show: false,
      code: '',
      detected: false,
      product: '',
      url: 'https://world.openfoodfacts.org/api/v0/product/'
    }
  },
  methods: {
    logIt (data) {
      console.log('detected', data)
      this.code = data.codeResult.code
      this.product = this.$axios.$get(`${this.url}${this.code}.json`)
      this.detected = true
      VueQuagga.stop()
    },
    activateScan () {
      VueQuagga.start()
    }

  }
}
</script>
