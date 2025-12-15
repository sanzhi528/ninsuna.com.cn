<template>
  <header class="header">
    <div class="container">
      <div class="header-content">
        <div class="logo">
          <img src="/logo.svg" alt="本屯科技" class="logo-img" />
          <span class="logo-text">本屯科技</span>
        </div>
        
        <nav class="nav">
          <router-link to="/" class="nav-link">首页</router-link>
          <router-link to="/services" class="nav-link">服务项目</router-link>
          <router-link to="/products" class="nav-link">电子产品</router-link>
          <router-link to="/consultation" class="nav-link">科技咨询</router-link>
          <router-link to="/contact" class="nav-link">联系我们</router-link>
        </nav>
        
        <div class="header-actions">
          <el-button v-if="!userStore.isLoggedIn" type="primary" @click="$router.push('/login')">
            登录
          </el-button>
          <el-button v-if="!userStore.isLoggedIn" @click="$router.push('/register')">
            注册
          </el-button>
          <el-dropdown v-if="userStore.isLoggedIn">
            <span class="user-info">
              <el-avatar :size="32" :src="userStore.userInfo?.avatar" />
              {{ userStore.userInfo?.username }}
            </span>
            <template #dropdown>
              <el-dropdown-menu>
                <el-dropdown-item @click="$router.push('/admin')">管理后台</el-dropdown-item>
                <el-dropdown-item divided @click="handleLogout">退出登录</el-dropdown-item>
              </el-dropdown-menu>
            </template>
          </el-dropdown>
        </div>
      </div>
    </div>
  </header>
</template>

<script setup>
import { useUserStore } from '@/stores/user'

const userStore = useUserStore()

const handleLogout = () => {
  userStore.logout()
  // 跳转到首页
  if (window.location.pathname !== '/') {
    window.location.href = '/'
  }
}
</script>

<style scoped>
.header {
  background: rgba(255, 255, 255, 0.95);
  backdrop-filter: blur(10px);
  border-bottom: 1px solid #f0f0f0;
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 1000;
  transition: all 0.3s ease;
}

.header-content {
  display: flex;
  align-items: center;
  justify-content: space-between;
  height: 70px;
}

.logo {
  display: flex;
  align-items: center;
  gap: 10px;
  font-size: 1.5rem;
  font-weight: bold;
  color: #2c3e50;
}

.logo-img {
  width: 40px;
  height: 40px;
}

.logo-text {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.nav {
  display: flex;
  gap: 2rem;
}

.nav-link {
  text-decoration: none;
  color: #666;
  font-weight: 500;
  transition: color 0.3s ease;
  position: relative;
}

.nav-link:hover,
.nav-link.router-link-active {
  color: #667eea;
}

.nav-link.router-link-active::after {
  content: '';
  position: absolute;
  bottom: -5px;
  left: 0;
  width: 100%;
  height: 2px;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

.header-actions {
  display: flex;
  align-items: center;
  gap: 1rem;
}

.user-info {
  display: flex;
  align-items: center;
  gap: 8px;
  cursor: pointer;
  padding: 8px 12px;
  border-radius: 6px;
  transition: background-color 0.3s ease;
}

.user-info:hover {
  background-color: #f5f5f5;
}

@media (max-width: 768px) {
  .nav {
    display: none;
  }
  
  .header-content {
    padding: 0 10px;
  }
}
</style>