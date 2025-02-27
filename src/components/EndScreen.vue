<template>
  <div class="end-screen">
    <h1>游戏结束</h1>
    <Menu @start-game="restartGame" @show-instructions="showInstructions" @show-settings="showSettings" @show-about="showAbout"/>
    <Instructions v-if="instructionsVisible" @close-instructions="closeInstructions"/>
  </div>
</template>

<script setup>
import { defineEmits, ref } from 'vue';
import Menu from "@/components/Menu.vue";
import Instructions from "@/components/Instructions.vue";

const emit = defineEmits(['restart-game', 'show-instructions', 'show-settings', 'show-about']);
const instructionsVisible = ref(false);

function restartGame() {
  emit('restart-game');
}

function showInstructions() {
  instructionsVisible.value = true;
}

function showSettings() {
  emit('show-settings');
}

function showAbout() {
  emit('show-about');
}

function closeInstructions() {
  instructionsVisible.value = false;
}
</script>

<style scoped>
.end-screen {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-color: #f0f0f0;
}

h1 {
  font-size: 3em;
  margin-bottom: 20px;
}
</style>