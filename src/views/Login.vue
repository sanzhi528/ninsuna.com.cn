<template>
  <div class="login">
    <Header />
    
    <div class="login-container">
      <div class="login-background"></div>
      <div class="login-content">
        <div class="login-form-container">
          <div class="login-header">
            <img src="/logo.svg" alt="本屯科技" class="login-logo" />
            <h1>欢迎回来</h1>
            <p>登录您的账户继续使用服务</p>
          </div>
          
          <el-form 
            :model="loginForm" 
            :rules="loginRules" 
            ref="loginFormRef"
            class="login-form"
            size="large"
          >
            <el-form-item prop="username">
              <el-input 
                v-model="loginForm.username" 
                placeholder="请输入用户名或邮箱"
                prefix-icon="User"
              />
            </el-form-item>
            
            <el-form-item prop="password">
              <el-input 
                v-model="loginForm.password" 
                type="password" 
                placeholder="请输入密码"
                prefix-icon="Lock"
                show-password
              />
            </el-form-item>
            
            <div class="login-options">
              <el-checkbox v-model="rememberMe">记住我</el-checkbox>
              <a href="#" class="forgot-password">忘记密码？</a>
            </div>
            
            <el-button 
              type="primary" 
              size="large" 
              class="login-button"
              @click="handleLogin"
              :loading="loading"
            >
              登录
            </el-button>
            
            <div class="login-divider">
              <span>或</span>
            </div>
            
            <div class="social-login">
              <el-button class="social-button wechat">
                <el-icon><ChatDotRound /></el-icon>
                微信登录
              </el-button>
              <el-button class="social-button qq">
                <el-icon><ChatLineRound /></el-icon>
                QQ登录
              </el-button>
            </div>
            
            <div class="register-link">
              还没有账户？ 
              <router-link to="/register">立即注册</router-link>
            </div>
          </el-form>
        </div>
        
        <div class="login-features">
          <div class="feature-item">
            <el-icon><Monitor /></el-icon>
            <h3>专业服务</h3>
            <p>享受专业的科技咨询和开发服务</p>
          </div>
          <div class="feature-item">
            <el-icon><ShoppingCart /></el-icon>
            <h3>便捷采购</h3>
            <p>在线选购优质的电子产品</p>
          </div>
          <div class="feature-item">
            <el-icon><Headset /></el-icon>
            <h3>技术支持</h3>
            <p>获得专业的技术支持和售后服务</p>
          </div>
        </div>
      </div>
    </div>
    
    <Footer />
  </div>
</template>

<script setup>
import { ref, reactive } from 'vue'
import { useRouter } from 'vue-router'
import { useUserStore } from '@/stores/user'
import { ElMessage } from 'element-plus'
import Header from '@/components/Layout/Header.vue'
import Footer from '@/components/Layout/Footer.vue'
import {
  User,
  Lock,
  ChatDotRound,
  ChatLineRound,
  Monitor,
  ShoppingCart,
  Headset
} from '@element-plus/icons-vue'

const router = useRouter()
const userStore = useUserStore()
const loginFormRef = ref()
const loading = ref(false)
const rememberMe = ref(false)

const loginForm = reactive({
  username: '',
  password: ''
})

const loginRules = {
  username: [
    { required: true, message: '请输入用户名或邮箱', trigger: 'blur' },
    { min: 3, message: '用户名至少3个字符', trigger: 'blur' }
  ],
  password: [
    { required: true, message: '请输入密码', trigger: 'blur' },
    { min: 6, message: '密码至少6个字符', trigger: 'blur' }
  ]
}

const handleLogin = async () => {
  try {
    const valid = await loginFormRef.value.validate()
    if (!valid) return
    
    loading.value = true
    
    const result = await userStore.login(loginForm)
    
    if (result.success) {
      ElMessage.success('登录成功！')
      // 跳转到首页或之前访问的页面
      const redirect = router.currentRoute.value.query.redirect || '/'
      router.push(redirect)
    } else {
      ElMessage.error(result.message || '登录失败')
    }
  } catch (error) {
    ElMessage.error('登录失败，请稍后重试')
  } finally {
    loading.value = false
  }
}
</script>

<style scoped>
.login {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
}

.login-container {
  flex: 1;
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: calc(100vh - 140px);
  margin-top: 70px;
}

.login-background {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  opacity: 0.1;
}

.login-content {
  position: relative;
  z-index: 2;
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 4rem;
  max-width: 1200px;
  width: 100%;
  padding: 2rem;
}

.login-form-container {
  background: white;
  padding: 3rem;
  border-radius: 20px;
  box-shadow: 0 20px 60px rgba(0, 0, 0, 0.1);
}

.login-header {
  text-align: center;
  margin-bottom: 2rem;
}

.login-logo {
  width: 60px;
  height: 60px;
  margin-bottom: 1rem;
}

.login-header h1 {
  font-size: 2rem;
  color: #2c3e50;
  margin-bottom: 0.5rem;
}

.login-header p {
  color: #666;
}

.login-form {
  width: 100%;
}

.login-options {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 2rem;
}

.forgot-password {
  color: #667eea;
  text-decoration: none;
  font-size: 0.9rem;
}

.forgot-password:hover {
  text-decoration: underline;
}

.login-button {
  width: 100%;
  height: 50px;
  margin-bottom: 1.5rem;
}

.login-divider {
  position: relative;
  text-align: center;
  margin: 2rem 0;
  color: #999;
}

.login-divider::before {
  content: '';
  position: absolute;
  top: 50%;
  left: 0;
  right: 0;
  height: 1px;
  background: #eee;
}

.login-divider span {
  background: white;
  padding: 0 1rem;
}

.social-login {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 1rem;
  margin-bottom: 2rem;
}

.social-button {
  height: 50px;
  border: 1px solid #eee;
  background: white;
  color: #666;
}

.social-button.wechat:hover {
  border-color: #07c160;
  color: #07c160;
}

.social-button.qq:hover {
  border-color: #12b7f5;
  color: #12b7f5;
}

.register-link {
  text-align: center;
  color: #666;
}

.register-link a {
  color: #667eea;
  text-decoration: none;
  font-weight: 500;
}

.register-link a:hover {
  text-decoration: underline;
}

.login-features {
  display: flex;
  flex-direction: column;
  gap: 2rem;
  justify-content: center;
}

.feature-item {
  display: flex;
  align-items: center;
  gap: 1rem;
  padding: 1.5rem;
  background: rgba(255, 255, 255, 0.9);
  border-radius: 15px;
  backdrop-filter: blur(10px);
}

.feature-item .el-icon {
  font-size: 2.5rem;
  color: #667eea;
}

.feature-item h3 {
  color: #2c3e50;
  margin-bottom: 0.5rem;
}

.feature-item p {
  color: #666;
  margin: 0;
}

@media (max-width: 768px) {
  .login-content {
    grid-template-columns: 1fr;
    gap: 2rem;
  }
  
  .login-form-container {
    padding: 2rem;
  }
  
  .social-login {
    grid-template-columns: 1fr;
  }
  
  .feature-item {
    text-align: center;
    flex-direction: column;
  }
}
</style>