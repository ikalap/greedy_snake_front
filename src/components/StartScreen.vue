<template>
  <div class="start-screen" v-if="screenEnable">
    <h1 v-if="isFirstScreen">贪吃蛇游戏</h1>
    <EndNote v-else @restart-game="restartGame"/>
    <Menu @start-game="startGame" @difficulty-selected="setDifficulty"/>
  </div>
  <Sneak v-else :difficulty="difficulty" @game-over="endGame"/>
</template>

<script setup>
import {ref} from "vue";
import Sneak from "@/components/Sneak.vue";
import EndNote from "@/components/EndNote.vue";
import Menu from "@/components/Menu.vue";

// 是否显示开始/结束界面, 是否是第一次(第一次不显示game over, 后面都显示)
let screenEnable = ref(true);
let isFirstScreen = ref(true);
// 难度设置
let difficulty = ref('normal');

// 开始游戏按钮
function startGame() {
  screenEnable.value = false;
  isFirstScreen.value = false;
}

// 游戏结束处理
function endGame() {
  screenEnable.value = true;
}

// 重新开始游戏
function restartGame() {
  screenEnable.value = false;
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
  width: 100%;
  height: 100vh;
  background-color: #f0f0f0;
}

h1 {
  font-size: 3em;
  margin-bottom: 20px;
}
</style>