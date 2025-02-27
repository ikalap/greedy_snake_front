<template>
  <div class="menu">
    <button @click="startGame">开始游戏</button>
    <button @click="showInstructions">说明</button>
    <button @click="showSettings">设置</button>
    <button @click="showAbout">关于</button>
  </div>
</template>

<script setup>
import { defineEmits } from 'vue';

const emit = defineEmits(['start-game', 'show-instructions', 'show-settings', 'show-about']);

function startGame() {
  emit('start-game');
}

function showInstructions() {
  emit('show-instructions');
}

function showSettings() {
  emit('show-settings');
}

function showAbout() {
  emit('show-about');
}
</script>

<style scoped>
.menu {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

button {
  padding: 10px 20px;
  font-size: 1em;
  cursor: pointer;
  margin: 5px 0;
}
</style>