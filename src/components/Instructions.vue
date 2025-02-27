<template>
  <div class="instructions">
    <h1>游戏说明</h1>
    <p>使用 w a s d 或者 方向键来控制移动</p>
    <p>使用 p 暂停游戏</p>
    <button @click="closeInstructions">关闭</button>
  </div>
</template>

<script setup>
import { defineEmits } from 'vue';

const emit = defineEmits(['close-instructions']);

function closeInstructions() {
  emit('close-instructions');
}
</script>

<style scoped>
.instructions {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.8);
  color: white;
  z-index: 1000;
}

button {
  padding: 10px 20px;
  font-size: 1em;
  cursor: pointer;
  margin-top: 20px;
}
</style>