<template>
  <div class="about">
    <div style="width: 50%">
      <h1>关于贪吃蛇游戏</h1>
      <section class="game-intro">
        <h2>游戏简介</h2>
        <p>这是一款经典的贪吃蛇游戏，玩家通过控制蛇的方向来吃掉地图上的食物，使蛇不断变长。</p>
        <p>游戏的目标是尽可能地延长蛇的长度，同时避免撞到墙壁或自身。</p>
      </section>

      <section class="tech-stack">
        <h2>技术栈</h2>
        <ul>
          <li><strong>前端框架：</strong>Vue 3</li>
          <li><strong>状态管理：</strong>Composition API</li>
          <li><strong>样式：</strong>CSS3</li>
          <li><strong>工具：</strong>VSCode, Git</li>
        </ul>
      </section>

      <section class="development-process">
        <h2>开发过程</h2>
        <p>游戏的开发分为以下几个步骤：</p>
        <ol>
          <li><strong>项目初始化：</strong>使用 Vue CLI 创建项目，并配置基础的项目结构。</li>
          <li><strong>设计游戏逻辑：</strong>定义贪吃蛇的移动规则、碰撞检测、食物生成等核心逻辑。</li>
          <li><strong>实现用户交互：</strong>通过键盘事件监听器实现对蛇的控制。</li>
          <li><strong>添加设置和说明界面：</strong>为用户提供难度选择和游戏操作说明的功能。</li>
          <li><strong>优化与测试：</strong>对游戏进行性能优化，确保在不同设备上流畅运行，并修复已知问题。</li>
        </ol>
      </section>
    </div>

    <button @click="closeAbout">关闭</button>
  </div>
</template>


<script setup>
import {defineEmits, ref} from 'vue';
import Settings from "@/components/Settings.vue";
const emit = defineEmits(['close-about']);

function closeAbout() {
  emit('close-about');
}
</script>

<style scoped>
.about {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.8);
  color: white;
  z-index: 1000;
  padding: 20px 80px;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}

h1 {
  font-size: 2em;
  margin-bottom: 20px;
}

section {
  margin-bottom: 40px;
}

h2 {
  font-size: 1.5em;
  margin-bottom: 10px;
}

p {
  font-size: 1em;
  line-height: 1.6;
}

ul, ol {
  font-size: 1em;
  line-height: 1.6;
}

button {
  padding: 10px 20px;
  font-size: 1em;
  cursor: pointer;
  margin-top: 20px;
}
</style>


