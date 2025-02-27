<template>
  <div class="start-screen" v-if="!gameEnable && !endScreenEnable">
    <h1>贪吃蛇游戏</h1>
    <Menu @start-game="startGame" @show-instructions="showInstructions" @show-settings="showSettings" @show-about="showAbout"/>
    <Instructions v-if="instructionsVisible" @close-instructions="closeInstructions"/>
    <Settings v-if="settingsVisible" @close-settings="closeSettings" @difficulty-selected="setDifficulty"/>
  </div>
  <Sneak v-if="gameEnable" :difficulty="difficulty" @game-over="endGame"/>
  <EndScreen v-if="endScreenEnable" @restart-game="restartGame"/>
</template>

<script setup>
import { ref } from "vue";
import Sneak from "@/components/Sneak.vue";
import EndScreen from "@/components/EndScreen.vue";
import Menu from "@/components/Menu.vue";
import Instructions from "@/components/Instructions.vue";
import Settings from "@/components/Settings.vue";

// 游戏是否开始
let gameEnable = ref(false);
// 游戏结束界面是否显示
let endScreenEnable = ref(false);
// 说明界面是否显示
let instructionsVisible = ref(false);
// 设置界面是否显示
let settingsVisible = ref(false);
// 难度设置
let difficulty = ref('normal');

// 开始游戏按钮
function startGame() {
  gameEnable.value = true;
  endScreenEnable.value = false;
}

// 游戏结束处理
function endGame() {
  gameEnable.value = false;
  endScreenEnable.value = true;
}

// 重新开始游戏
function restartGame() {
  gameEnable.value = true;
  endScreenEnable.value = false;
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
  alert('这是关于页面');
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
  difficulty.value = newDifficulty;
}
</script>

<style scoped>
.start-screen {
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