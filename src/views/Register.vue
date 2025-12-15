<template>
  <div class="register">
    <Header />
    
    <div class="register-container">
      <div class="register-background"></div>
      <div class="register-content">
        <div class="register-form-container">
          <div class="register-header">
            <img src="/logo.svg" alt="本屯科技" class="register-logo" />
            <h1>创建账户</h1>
            <p>注册新账户开始使用我们的服务</p>
          </div>
          
          <el-form 
            :model="registerForm" 
            :rules="registerRules" 
            ref="registerFormRef"
            class="register-form"
            size="large"
          >
            <el-form-item prop="username">
              <el-input 
                v-model="registerForm.username" 
                placeholder="请输入用户名"
                prefix-icon="User"
              />
            </el-form-item>
            
            <el-form-item prop="email">
              <el-input 
                v-model="registerForm.email" 
                placeholder="请输入邮箱地址"
                prefix-icon="Message"
              />
            </el-form-item>
            
            <el-form-item prop="phone">
              <el-input 
                v-model="registerForm.phone" 
                placeholder="请输入手机号码"
                prefix-icon="Phone"
              />
            </el-form-item>
            
            <el-form-item prop="company">
              <el-input 
                v-model="registerForm.company" 
                placeholder="请输入公司名称（选填）"
                prefix-icon="OfficeBuilding"
              />
            </el-form-item>
            
            <el-form-item prop="password">
              <el-input 
                v-model="registerForm.password" 
                type="password" 
                placeholder="请输入密码"
                prefix-icon="Lock"
                show-password
              />
            </el-form-item>
            
            <el-form-item prop="confirmPassword">
              <el-input 
                v-model="registerForm.confirmPassword" 
                type="password" 
                placeholder="请确认密码"
                prefix-icon="Lock"
                show-password
              />
            </el-form-item>
            
            <el-form-item prop="agreement">
              <el-checkbox v-model="registerForm.agreement">
                我已阅读并同意
                <a href="#" class="agreement-link">《服务协议》</a>
                和
                <a href="#" class="agreement-link">《隐私政策》</a>
              </el-checkbox>
            </el-form-item>
            
            <el-button 
              type="primary" 
              size="large" 
              class="register-button"
              @click="handleRegister"
              :loading="loading"
            >
              注册
            </el-button>
            
            <div class="login-link">
              已有账户？ 
              <router-link to="/login">立即登录</router-link>
            </div>
          </el-form>
        </div>
        
        <div class="register-benefits">
          <h2>注册即享权益</h2>
          <div class="benefits-list">
            <div class="benefit-item">
              <el-icon><Discount /></el-icon>
              <div>
                <h3>专属优惠</h3>
                <p>注册用户享受产品和服务专属折扣</p>
              </div>
            </div>
            <div class="benefit-item">
              <el-icon><Star /></el-icon>
              <div>
                <h3>优先服务</h3>
                <p>注册用户享受技术支持和咨询的优先处理</p>
              </div>
            </div>
            <div class="benefit-item">
              <el-icon><Document /></el-icon>
              <div>
                <h3>项目管理</h3>
                <p>在线管理您的项目进度和服务记录</p>
              </div>
            </div>
            <div class="benefit-item">
              <el-icon><Bell /></el-icon>
              <div>
                <h3>最新资讯</h3>
                <p>第一时间获取科技行业最新动态和优惠信息</p>
              </div>
            </div>
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
  Message,
  Phone,
  OfficeBuilding,
  Lock,
  Discount,
  Star,
  Document,
  Bell
} from '@element-plus/icons-vue'

const router = useRouter()
const userStore = useUserStore()
const registerFormRef = ref()
const loading = ref(false)

const registerForm = reactive({
  username: '',
  email: '',
  phone: '',
  company: '',
  password: '',
  confirmPassword: '',
  agreement: false
})

const validateConfirmPassword = (rule, value, callback) => {
  if (value === '') {
    callback(new Error('请再次输入密码'))
  } else if (value !== registerForm.password) {
    callback(new Error('两次输入密码不一致'))
  } else {
    callback()
  }
}

const registerRules = {
  username: [
    { required: true, message: '请输入用户名', trigger: 'blur' },
    { min: 3, max: 20, message: '用户名长度在 3 到 20 个字符', trigger: 'blur' }
  ],
  email: [
    { required: true, message: '请输入邮箱地址', trigger: 'blur' },
    { type: 'email', message: '请输入正确的邮箱地址', trigger: 'blur' }
  ],
  phone: [
    { required: true, message: '请输入手机号码', trigger: 'blur' },
    { pattern: /^1[3-9]\d{9}$/, message: '请输入正确的手机号码', trigger: 'blur' }
  ],
  password: [
    { required: true, message: '请输入密码', trigger: 'blur' },
    { min: 6, message: '密码至少6个字符', trigger: 'blur' }
  ],
  confirmPassword: [
    { required: true, message: '请确认密码', trigger: 'blur' },
    { validator: validateConfirmPassword, trigger: 'blur' }
  ],
  agreement: [
    { 
      validator: (rule, value, callback) => {
        if (!value) {
          callback(new Error('请同意服务协议和隐私政策'))
        } else {
          callback()
        }
      },
      trigger: 'change'
    }
  ]
}

const handleRegister = async () => {
  try {
    const valid = await registerFormRef.value.validate()
    if (!valid) return
    
    loading.value = true
    
    const result = await userStore.register(registerForm)
    
    if (result.success) {
      ElMessage.success('注册成功！请登录您的账户。')
      router.push('/login')
    } else {
      ElMessage.error(result.message || '注册失败')
    }
  } catch (error) {
    ElMessage.error('注册失败，请稍后重试')
  } finally {
    loading.value = false
  }
}
</script>

<style scoped>
.register {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
}

.register-container {
  flex: 1;
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: calc(100vh - 140px);
  margin-top: 70px;
}

.register-background {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  opacity: 0.1;
}

.register-content {
  position: relative;
  z-index: 2;
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 4rem;
  max-width: 1200px;
  width: 100%;
  padding: 2rem;
}

.register-form-container {
  background: white;
  padding: 3rem;
  border-radius: 20px;
  box-shadow: 0 20px 60px rgba(0, 0, 0, 0.1);
}

.register-header {
  text-align: center;
  margin-bottom: 2rem;
}

.register-logo {
  width: 60px;
  height: 60px;
  margin-bottom: 1rem;
}

.register-header h1 {
  font-size: 2rem;
  color: #2c3e50;
  margin-bottom: 0.5rem;
}

.register-header p {
  color: #666;
}

.register-form {
  width: 100%;
}

.agreement-link {
  color: #667eea;
  text-decoration: none;
}

.agreement-link:hover {
  text-decoration: underline;
}

.register-button {
  width: 100%;
  height: 50px;
  margin: 1.5rem 0;
}

.login-link {
  text-align: center;
  color: #666;
}

.login-link a {
  color: #667eea;
  text-decoration: none;
  font-weight: 500;
}

.login-link a:hover {
  text-decoration: underline;
}

.register-benefits {
  padding: 2rem;
}

.register-benefits h2 {
  font-size: 2rem;
  color: #2c3e50;
  margin-bottom: 2rem;
  text-align: center;
}

.benefits-list {
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
}

.benefit-item {
  display: flex;
  align-items: center;
  gap: 1rem;
  padding: 1.5rem;
  background: rgba(255, 255, 255, 0.9);
  border-radius: 15px;
  backdrop-filter: blur(10px);
}

.benefit-item .el-icon {
  font-size: 2.5rem;
  color: #667eea;
  flex-shrink: 0;
}

.benefit-item h3 {
  color: #2c3e50;
  margin-bottom: 0.5rem;
  font-size: 1.1rem;
}

.benefit-item p {
  color: #666;
  margin: 0;
  font-size: 0.9rem;
}

@media (max-width: 768px) {
  .register-content {
    grid-template-columns: 1fr;
    gap: 2rem;
  }
  
  .register-form-container {
    padding: 2rem;
  }
  
  .benefit-item {
    flex-direction: column;
    text-align: center;
  }
}
</style>