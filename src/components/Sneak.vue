<script setup>
import {onMounted, ref} from "vue";

// l 左 r 右 u 上 d 下
// 游戏的上下文信息
const env = ref({
  // 用于贪吃蛇的key - 递增
  id: 1,
  // 定义当前蛇前进的速度等级: 速度越高， 每1秒移动的次数越多
  speed: 3,
  // 定时器的id
  intervalId: undefined,
  // 贪吃蛇是否死亡
  isDeath: false,
  // 浏览器的宽度和高度
  winWidth: document.body.clientWidth,
  winHeight:  document.body.clientHeight,
  // 贪吃蛇的长度和狂赌
  nodeWidth: 50,
  nodeHeight: 50,
  // 各种方向移动时x坐标与y坐标的增减
  moveMap: {'l': [-50, 0], 'r':[50, 0], 'u':[0, -50], 'd': [0, 50]},
  // 各个方向对应的图片
  imgSrc: {'l': "/src/assets/images/left.png", 'r': "/src/assets/images/right.png", 'u': '/src/assets/images/up.png', 'd':'/src/assets/images/down.png', 'body':'/src/assets/images/body.png'},
  // 键盘keycode与方向的映射
  keyAndDirectionMap: {38: 'u', 40: 'd', 37:'l', 39:'r'},
})
// 定义贪吃蛇的对象存储
const sneak = ref([{x: Math.round( Math.random() * (env.value['winWidth'])),
  y:Math.round( Math.random() * (env.value['winHeight'])),
  direction: 'r', key: env.value['id']++
}]
)
// 苹果的位置 - 这里可能有多个苹果
const apples = ref([[Math.round(Math.random() * (env.value['winWidth'])), Math.round(Math.random() * (env.value['winHeight']))]])
// 按键改变方向: key: x,y  value: 四个方向 l r u d
const changeDirection = ref({})

console.log("初始化贪吃蛇:", sneak)
console.log("初始化苹果:", apples)
console.log("初始化changeDirection:", JSON.stringify(changeDirection))
console.log("env:", env)


// 某个位置进行direction移动后的下一个位置; 如果要前一个位置将返回值取反即可
function positionMove(x, y, direction, isRetreat= false){
  const negative = isRetreat ? -1 : 1;
  return [x + negative * env.value.moveMap[direction][0], y +  negative * env.value.moveMap[direction][1], direction]
}

// 贪吃蛇的移动
function move(){
  for(let node of sneak.value){
    const nextPosition = positionMove(node.x, node.y, node.direction);
    node.x = nextPosition[0]
    node.y = nextPosition[1]

    // 判断之后的位置如果有改变位移的位置，就改变方向
    if(changeDirection.value[`${node.x},${node.y}`] != null){
      node.direction = changeDirection.value[`${node.x},${node.y}`]
      // 如果时最后一个节点那么就移除掉这个位置
      if(node === sneak.value[sneak.value.length-1]){
        delete changeDirection.value[`${node.x},${node.y}`]
      }
    }

  }
  // 判断是否吃到了食物
  judgeEatApple()
  // 移动后对头节点进行是否死亡判断
  judgeDeath(sneak.value[0].x, sneak.value[0].y)

}

// 贪吃蛇是否吃到了食物
function judgeEatApple() {
  // 蛇的头节点 尾节点
  const head = sneak.value[0];
  const tail = sneak.value[sneak.value.length - 1]
  // 是否有吃到东西, 如果吃到： 1. 在尾部增加一个节点 2. 将被吃掉的苹果移除 3. 添加一个新的苹果
  for (const apple of apples.value) {
    if (apple[0] <= head.x && apple[0] + 50 >= head.x && apple[1] <= head.y && apple[1] + 50 >= head.y) {
      const nextPosition = positionMove(tail.x, tail.y, tail.direction, true);
      sneak.value.push({
        x: nextPosition[0], y: nextPosition[1], direction: nextPosition[2], key: env.value.id++
      })
      apples.value.pop(apple)
      apples.value.push([Math.random() * (env.value['winWidth']), Math.random() * (env.value['winHeight'])])

      // 临时停止
      // window.clearInterval(env.value['intervalId']);
    }
  }
}

// 判断贪吃蛇是否死亡
function judgeDeath(x, y){
  // console.log("执行了judgeDeath()" + x + " " + y)
  if(x < 0 || x > env.value['winWidth'] || y < 0 || y > env.value['winHeight']){
    window.clearInterval(env.value['intervalId']);
    env.value['isDeath'] = true
    return true;
  }
}

// 键盘按下触发按钮: 1.在原地留下一个标记 2.改变蛇头的方向
function handKeyCode(e){
  // 按下了 上下左右四个键 就改变方向
  if(env.value.keyAndDirectionMap[e.keyCode] != null){
    sneak.value[0].direction = env.value.keyAndDirectionMap[e.keyCode];

    // 如果贪吃蛇的长度超过一 才需要留下改变轨迹。
    if(sneak.value.length > 1){
      const key = sneak.value[0]['x'] + ',' + sneak.value[0]['y']
      changeDirection.value[key] = env.value.keyAndDirectionMap[e.keyCode]
    }
  }
}

// 组件挂载生命周期
onMounted(() => {
  // 组件加载时就挂载对于键盘的监听，用于控制贪吃蛇方向
  window.addEventListener('keydown', handKeyCode, true)
  // 每隔一段时间自动触发移动
  env.value['intervalId'] = setInterval(move,1000 / env.value['speed'])
})

</script>


<template>
  <div v-for = "node in sneak" :key="node.key">
    <img :src="node === sneak[0] ? env.imgSrc[node.direction] : env.imgSrc['body']" class="node fixed_0" :style="{transform: `translate(${node.x}px, ${node.y}px)`}" alt="蛇"/>
  </div>
  <div v-for = "apple in apples" :key="apple">
    <img src="../assets/images/food.png" class="apple fixed_0" :style="{transform: `translate(${apple[0]}px, ${apple[1]}px)`}" alt="苹果"/>
  </div>
  <h1 v-if="env['isDeath']" class="over">GAME OVER!</h1>
</template>

<style scoped>
.fixed_0{
  height: 50px;
  width: 50px;

  position: fixed;
  top: 0;
  left: 0;
}

.over{
  font-size: 80px;
  position: fixed;
  top: 50%;
  left: 30%;
  text-shadow:  5px 5px 5px #ff0000;
}

</style>