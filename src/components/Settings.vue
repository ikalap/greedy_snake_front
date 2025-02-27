<template>
  <div class="settings">
    <h1>设置</h1>
    <label>
      <span>难度:</span>
      <select v-model="selectedDifficulty">
        <option value="easy">简单</option>
        <option value="normal">普通</option>
        <option value="hard">困难</option>
        <option value="nightmare">噩梦</option>
      </select>
    </label>
    <button @click="closeSettings">关闭</button>
  </div>
</template>

<script setup>
import { defineEmits, ref, watch } from 'vue';

const emit = defineEmits(['close-settings', 'difficulty-selected']);
const selectedDifficulty = ref('normal');

watch(selectedDifficulty, (newDifficulty) => {
  emit('difficulty-selected', newDifficulty);
});

function closeSettings() {
  emit('close-settings');
}
</script>

<style scoped>
.settings {
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

label {
  margin-bottom: 20px;
}

button {
  padding: 10px 20px;
  font-size: 1em;
  cursor: pointer;
}
</style>