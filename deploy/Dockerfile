# 使用Node.js官方镜像作为构建环境
FROM node:20 as build-stage

# 设置工作目录
WORKDIR /app

# 查看一下当前的路径
RUN pwd
RUN ls

# 复制package.json和package-lock.json
COPY package*.json ./

# 查看一下当前的路径
RUN pwd
RUN ls

# 安装项目依赖
RUN npm install

# 复制项目文件
COPY .. .

# 构建Vue应用
RUN npm run build

# 使用Nginx作为生产环境服务器
FROM nginx:stable-alpine as production-stage

# 设置工作目录
WORKDIR /usr/share/nginx/html

# 复制构建好的静态文件
COPY --from=build-stage /app/dist .

# 暴露80端口
EXPOSE 80

# 启动Nginx
CMD ["nginx", "-g", "daemon off;"]