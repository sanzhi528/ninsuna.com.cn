<template>
  <div class="admin">
    <Header />
    
    <div class="admin-container">
      <div class="admin-sidebar">
        <div class="admin-user-info">
          <el-avatar :size="60" :src="userStore.userInfo?.avatar" />
          <div class="user-details">
            <h3>{{ userStore.userInfo?.username || '管理员' }}</h3>
            <p>{{ userStore.userInfo?.role || '管理员' }}</p>
          </div>
        </div>
        
        <el-menu
          :default-active="activeMenu"
          class="admin-menu"
          background-color="#1f2937"
          text-color="#d1d5db"
          active-text-color="#3b82f6"
          router
        >
          <el-menu-item index="/admin/dashboard">
            <el-icon><DataBoard /></el-icon>
            <span>仪表盘</span>
          </el-menu-item>
          
          <el-sub-menu index="user-management">
            <template #title>
              <el-icon><User /></el-icon>
              <span>用户管理</span>
            </template>
            <el-menu-item index="/admin/users">用户列表</el-menu-item>
            <el-menu-item index="/admin/user-stats">用户统计</el-menu-item>
          </el-sub-menu>
          
          <el-sub-menu index="consultation-management">
            <template #title>
              <el-icon><ChatDotRound /></el-icon>
              <span>咨询管理</span>
            </template>
            <el-menu-item index="/admin/consultations">咨询列表</el-menu-item>
            <el-menu-item index="/admin/consultation-stats">咨询统计</el-menu-item>
          </el-sub-menu>
          
          <el-sub-menu index="order-management">
            <template #title>
              <el-icon><ShoppingCart /></el-icon>
              <span>订单管理</span>
            </template>
            <el-menu-item index="/admin/orders">订单列表</el-menu-item>
            <el-menu-item index="/admin/order-stats">订单统计</el-menu-item>
          </el-sub-menu>
          
          <el-menu-item index="/admin/products">
            <el-icon><Goods /></el-icon>
            <span>产品管理</span>
          </el-menu-item>
          
          <el-menu-item index="/admin/settings">
            <el-icon><Setting /></el-icon>
            <span>系统设置</span>
          </el-menu-item>
        </el-menu>
      </div>
      
      <div class="admin-main">
        <div class="admin-header">
          <div class="breadcrumb">
            <h2>{{ pageTitle }}</h2>
          </div>
          <div class="admin-actions">
            <el-button @click="handleLogout" type="danger" size="small">
              <el-icon><SwitchButton /></el-icon>
              退出登录
            </el-button>
          </div>
        </div>
        
        <div class="admin-content">
          <router-view />
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import { useRouter, useRoute } from 'vue-router'
import { useUserStore } from '@/stores/user'
import { ElMessageBox, ElMessage } from 'element-plus'
import Header from '@/components/Layout/Header.vue'
import {
  DataBoard,
  User,
  ChatDotRound,
  ShoppingCart,
  Goods,
  Setting,
  SwitchButton
} from '@element-plus/icons-vue'

const router = useRouter()
const route = useRoute()
const userStore = useUserStore()

const activeMenu = computed(() => route.path)

const pageTitle = computed(() => {
  const titles = {
    '/admin/dashboard': '仪表盘',
    '/admin/users': '用户管理',
    '/admin/user-stats': '用户统计',
    '/admin/consultations': '咨询管理',
    '/admin/consultation-stats': '咨询统计',
    '/admin/orders': '订单管理',
    '/admin/order-stats': '订单统计',
    '/admin/products': '产品管理',
    '/admin/settings': '系统设置'
  }
  return titles[route.path] || '管理后台'
})

onMounted(() => {
  if (!userStore.isLoggedIn) {
    router.push('/login')
    return
  }
  
  if (route.path === '/admin') {
    router.push('/admin/dashboard')
  }
})

const handleLogout = async () => {
  try {
    await ElMessageBox.confirm('确定要退出登录吗？', '提示', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning'
    })
    
    userStore.logout()
    ElMessage.success('已退出登录')
    router.push('/')
  } catch (error) {
    // 用户取消操作
  }
}
</script>

<style scoped>
.admin {
  min-height: 100vh;
  background-color: #f8fafc;
}

.admin-container {
  display: flex;
  min-height: calc(100vh - 70px);
  margin-top: 70px;
}

.admin-sidebar {
  width: 280px;
  background-color: #1f2937;
  color: white;
  display: flex;
  flex-direction: column;
}

.admin-user-info {
  padding: 2rem 1.5rem;
  display: flex;
  align-items: center;
  gap: 1rem;
  border-bottom: 1px solid #374151;
}

.user-details h3 {
  color: white;
  margin: 0 0 0.25rem 0;
  font-size: 1.1rem;
}

.user-details p {
  color: #9ca3af;
  margin: 0;
  font-size: 0.9rem;
}

.admin-menu {
  flex: 1;
  border: none;
}

.admin-menu .el-menu-item,
.admin-menu .el-sub-menu__title {
  height: 50px;
  line-height: 50px;
}

.admin-menu .el-menu-item.is-active {
  background-color: #3b82f6 !important;
}

.admin-main {
  flex: 1;
  display: flex;
  flex-direction: column;
}

.admin-header {
  background: white;
  padding: 1rem 2rem;
  border-bottom: 1px solid #e5e7eb;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.breadcrumb h2 {
  margin: 0;
  color: #1f2937;
  font-size: 1.5rem;
}

.admin-content {
  flex: 1;
  padding: 2rem;
  overflow-y: auto;
}

@media (max-width: 768px) {
  .admin-sidebar {
    width: 100%;
    position: fixed;
    top: 70px;
    left: -100%;
    height: calc(100vh - 70px);
    z-index: 1000;
    transition: left 0.3s;
  }
  
  .admin-sidebar.active {
    left: 0;
  }
  
  .admin-main {
    width: 100%;
  }
}
</style>