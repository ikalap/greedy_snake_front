<template>
  <div class="menu">
    <button @click="startGame">开始游戏</button>
    <button @click="showInstructions">说明</button>
    <button @click="showSettings">设置</button>
    <button @click="showAbout">关于</button>
  </div>
  <Instructions v-if="instructionsVisible" @close-instructions="closeInstructions"/>
  <Settings v-if="settingsVisible" @close-settings="closeSettings" @difficulty-selected="setDifficulty"/>
  <About v-if="aboutVisible" @close-about="closeAbout"/>
</template>

<script setup>
import {defineEmits, ref} from 'vue';
import Instructions from "@/components/Instructions.vue";
import Settings from "@/components/Settings.vue";
import About from "@/components/About.vue";
const emit = defineEmits(['start-game', 'show-instructions', 'show-settings', 'show-about']);

// 说明界面是否显示
let instructionsVisible = ref(false);
// 设置界面是否显示
let settingsVisible = ref(false);
// 设置界面是否显示
let aboutVisible = ref(false);
// 难度设置
let difficulty = ref('normal');

function startGame() {
  emit('start-game');
}

// 显示说明
function showInstructions() {
  instructionsVisible.value = true;
}

// 显示设置
function showSettings() {
  settingsVisible.value = true;
}

// 显示关于
function showAbout() {
  aboutVisible.value = true;
}

// 关闭关于
function closeAbout() {
  aboutVisible.value = false;
}

// 关闭说明
function closeInstructions() {
  instructionsVisible.value = false;
}

// 关闭设置
function closeSettings() {
  settingsVisible.value = false;
}

// 设置难度
function setDifficulty(newDifficulty) {
  emit('difficulty-selected', newDifficulty);
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