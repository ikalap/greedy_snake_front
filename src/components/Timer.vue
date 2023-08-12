<script setup>
import { ref } from 'vue'

const count = ref(0)

function increment(){
  coutn.value++
}

</script>

<template>
  <button @click="increment">
    {{ count }}
  </button>

</template>

<style scoped>

</style>