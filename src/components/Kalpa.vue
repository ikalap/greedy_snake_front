<script setup>
const msg = "hello";
const rawHtml = "<br>world";
</script>

<template>
<span>Message: {{ msg }}</span>
<span v-html="rawHtml"></span>
</template>

<style scoped>

</style>