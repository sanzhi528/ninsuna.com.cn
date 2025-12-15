<template>
  <div class="not-found">
    <Header />
    
    <div class="not-found-container">
      <div class="not-found-content">
        <div class="error-code">404</div>
        <h1>页面未找到</h1>
        <p>抱歉，您访问的页面不存在或已被移除。</p>
        <div class="action-buttons">
          <el-button type="primary" size="large" @click="goHome">
            <el-icon><HomeFilled /></el-icon>
            返回首页
          </el-button>
          <el-button size="large" @click="goBack">
            <el-icon><ArrowLeft /></el-icon>
            返回上页
          </el-button>
        </div>
        
        <div class="suggestions">
          <h3>您可能想访问：</h3>
          <div class="suggestion-links">
            <router-link to="/">首页</router-link>
            <router-link to="/services">服务项目</router-link>
            <router-link to="/products">电子产品</router-link>
            <router-link to="/consultation">科技咨询</router-link>
            <router-link to="/contact">联系我们</router-link>
          </div>
        </div>
      </div>
      
      <div class="not-found-illustration">
        <div class="illustration">
          <div class="planet"></div>
          <div class="satellite"></div>
          <div class="stars">
            <div v-for="i in 20" :key="i" class="star" :style="starStyle(i)"></div>
          </div>
        </div>
      </div>
    </div>
    
    <Footer />
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router'
import Header from '@/components/Layout/Header.vue'
import Footer from '@/components/Layout/Footer.vue'
import { HomeFilled, ArrowLeft } from '@element-plus/icons-vue'

const router = useRouter()

const goHome = () => {
  router.push('/')
}

const goBack = () => {
  router.go(-1)
}

const starStyle = (index) => {
  const size = Math.random() * 3 + 1
  const opacity = Math.random() * 0.7 + 0.3
  const delay = Math.random() * 3
  const duration = Math.random() * 2 + 1
  
  return {
    width: `${size}px`,
    height: `${size}px`,
    opacity: opacity,
    animationDelay: `${delay}s`,
    animationDuration: `${duration}s`
  }
}
</script>

<style scoped>
.not-found {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
}

.not-found-container {
  flex: 1;
  display: grid;
  grid-template-columns: 1fr 1fr;
  align-items: center;
  justify-content: center;
  min-height: calc(100vh - 140px);
  margin-top: 70px;
  padding: 2rem;
  max-width: 1200px;
  margin-left: auto;
  margin-right: auto;
}

.not-found-content {
  text-align: center;
}

.error-code {
  font-size: 8rem;
  font-weight: bold;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
  margin-bottom: 1rem;
  line-height: 1;
}

.not-found-content h1 {
  font-size: 2.5rem;
  color: #2c3e50;
  margin-bottom: 1rem;
}

.not-found-content p {
  font-size: 1.2rem;
  color: #666;
  margin-bottom: 2rem;
}

.action-buttons {
  display: flex;
  gap: 1rem;
  justify-content: center;
  margin-bottom: 3rem;
}

.suggestions h3 {
  color: #2c3e50;
  margin-bottom: 1rem;
}

.suggestion-links {
  display: flex;
  gap: 1.5rem;
  justify-content: center;
  flex-wrap: wrap;
}

.suggestion-links a {
  color: #667eea;
  text-decoration: none;
  padding: 0.5rem 1rem;
  border: 1px solid #667eea;
  border-radius: 25px;
  transition: all 0.3s ease;
}

.suggestion-links a:hover {
  background: #667eea;
  color: white;
}

.not-found-illustration {
  display: flex;
  align-items: center;
  justify-content: center;
}

.illustration {
  position: relative;
  width: 300px;
  height: 300px;
}

.planet {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 120px;
  height: 120px;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  border-radius: 50%;
  box-shadow: 0 0 50px rgba(102, 126, 234, 0.3);
}

.satellite {
  position: absolute;
  top: 30%;
  left: 70%;
  width: 20px;
  height: 20px;
  background: #f093fb;
  border-radius: 50%;
  animation: orbit 8s linear infinite;
}

.stars {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}

.star {
  position: absolute;
  background: white;
  border-radius: 50%;
  animation: twinkle infinite alternate;
}

@keyframes orbit {
  0% {
    transform: rotate(0deg) translateX(80px) rotate(0deg);
  }
  100% {
    transform: rotate(360deg) translateX(80px) rotate(-360deg);
  }
}

@keyframes twinkle {
  0% {
    opacity: 0.3;
    transform: scale(1);
  }
  100% {
    opacity: 1;
    transform: scale(1.2);
  }
}

@media (max-width: 768px) {
  .not-found-container {
    grid-template-columns: 1fr;
    gap: 2rem;
    text-align: center;
  }
  
  .error-code {
    font-size: 6rem;
  }
  
  .not-found-content h1 {
    font-size: 2rem;
  }
  
  .action-buttons {
    flex-direction: column;
    align-items: center;
  }
  
  .suggestion-links {
    flex-direction: column;
    align-items: center;
  }
  
  .illustration {
    width: 200px;
    height: 200px;
  }
  
  .planet {
    width: 80px;
    height: 80px;
  }
}
</style>