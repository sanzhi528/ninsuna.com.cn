<template>
  <div class="contact">
    <Header />
    
    <!-- 页面标题 -->
    <section class="page-header">
      <div class="container">
        <h1 class="page-title">联系我们</h1>
        <p class="page-subtitle">随时为您提供专业的科技服务支持</p>
      </div>
    </section>

    <!-- 联系信息 -->
    <section class="contact-info">
      <div class="container">
        <div class="contact-grid">
          <div class="contact-card">
            <div class="contact-icon">
              <el-icon><Location /></el-icon>
            </div>
            <h3>公司地址</h3>
            <p>{{ companyInfo.address }}</p>
          </div>
          
          <div class="contact-card">
            <div class="contact-icon">
              <el-icon><Phone /></el-icon>
            </div>
            <h3>联系电话</h3>
            <p>{{ companyInfo.phone }}</p>
            <p>工作日: {{ companyInfo.businessHours.weekdays }}</p>
          </div>
          
          <div class="contact-card">
            <div class="contact-icon">
              <el-icon><Message /></el-icon>
            </div>
            <h3>电子邮箱</h3>
            <p>{{ companyInfo.infoEmail }}</p>
            <p>{{ companyInfo.businessEmail }}</p>
          </div>
          
          <div class="contact-card">
            <div class="contact-icon">
              <el-icon><Clock /></el-icon>
            </div>
            <h3>服务时间</h3>
            <p>{{ companyInfo.businessHours.weekdays }}</p>
            <p>{{ companyInfo.businessHours.saturday }}</p>
            <p>{{ companyInfo.businessHours.sunday }}</p>
          </div>
        </div>
      </div>
    </section>

    <!-- 地图和联系表单 -->
    <section class="contact-content">
      <div class="container">
        <div class="content-grid">
          <div class="map-section">
            <h2>我们的位置</h2>
            <div class="map-container">
              <!-- 这里可以嵌入真实的地图 -->
              <div class="map-placeholder">
              <el-icon><MapLocation /></el-icon>
              <p>{{ companyInfo.address }}</p>
              <p>地图位置展示</p>
            </div>
            </div>
            <div class="transport-info">
              <h3>交通指南</h3>
              <ul>
                <li v-for="(transport, index) in companyInfo.transport" :key="index">{{ transport }}</li>
              </ul>
            </div>
          </div>
          
          <div class="form-section">
            <h2>在线留言</h2>
            <el-form 
              :model="messageForm" 
              :rules="messageRules" 
              ref="messageFormRef"
              label-width="80px"
              class="message-form"
            >
              <el-form-item label="姓名" prop="name">
                <el-input v-model="messageForm.name" placeholder="请输入您的姓名" />
              </el-form-item>
              
              <el-form-item label="电话" prop="phone">
                <el-input v-model="messageForm.phone" placeholder="请输入联系电话" />
              </el-form-item>
              
              <el-form-item label="邮箱" prop="email">
                <el-input v-model="messageForm.email" placeholder="请输入邮箱地址" />
              </el-form-item>
              
              <el-form-item label="主题" prop="subject">
                <el-input v-model="messageForm.subject" placeholder="请输入留言主题" />
              </el-form-item>
              
              <el-form-item label="内容" prop="content">
                <el-input 
                  v-model="messageForm.content" 
                  type="textarea" 
                  :rows="5"
                  placeholder="请输入您的留言内容"
                />
              </el-form-item>
              
              <el-form-item>
                <el-button type="primary" size="large" @click="submitMessage" :loading="submitting">
                  发送留言
                </el-button>
                <el-button size="large" @click="resetMessageForm">重置</el-button>
              </el-form-item>
            </el-form>
          </div>
        </div>
      </div>
    </section>

    <!-- 紧急联系 -->
    <section class="emergency-contact">
      <div class="container">
        <div class="emergency-content">
          <h2>紧急技术支持</h2>
          <p>对于紧急的技术问题，我们提供{{ companyInfo.emergencyHours }}</p>
          <div class="emergency-info">
            <div class="emergency-item">
              <el-icon><PhoneFilled /></el-icon>
              <div>
                <h3>紧急电话</h3>
                <p>{{ companyInfo.phone }} (转紧急服务)</p>
              </div>
            </div>
            <div class="emergency-item">
              <el-icon><Message /></el-icon>
              <div>
                <h3>紧急邮箱</h3>
                <p>{{ companyInfo.emergencyEmail }}</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <Footer />
  </div>
</template>

<script setup>
import { ref, reactive } from 'vue'
import { ElMessage } from 'element-plus'
import Header from '@/components/Layout/Header.vue'
import Footer from '@/components/Layout/Footer.vue'
import { companyInfo } from '@/config/contact'
import {
  Location,
  Phone,
  Message,
  Clock,
  MapLocation,
  PhoneFilled
} from '@element-plus/icons-vue'

const messageFormRef = ref()
const submitting = ref(false)

const messageForm = reactive({
  name: '',
  phone: '',
  email: '',
  subject: '',
  content: ''
})

const messageRules = {
  name: [
    { required: true, message: '请输入姓名', trigger: 'blur' }
  ],
  phone: [
    { required: true, message: '请输入联系电话', trigger: 'blur' },
    { pattern: /^1[3-9]\d{9}$/, message: '请输入正确的手机号码', trigger: 'blur' }
  ],
  email: [
    { required: true, message: '请输入邮箱地址', trigger: 'blur' },
    { type: 'email', message: '请输入正确的邮箱地址', trigger: 'blur' }
  ],
  subject: [
    { required: true, message: '请输入留言主题', trigger: 'blur' }
  ],
  content: [
    { required: true, message: '请输入留言内容', trigger: 'blur' },
    { min: 10, message: '留言内容至少10个字符', trigger: 'blur' }
  ]
}

const submitMessage = async () => {
  try {
    const valid = await messageFormRef.value.validate()
    if (!valid) return
    
    submitting.value = true
    
    // 模拟提交
    await new Promise(resolve => setTimeout(resolve, 2000))
    
    ElMessage.success('留言发送成功！我们将尽快与您联系。')
    resetMessageForm()
  } catch (error) {
    ElMessage.error('发送失败，请稍后重试')
  } finally {
    submitting.value = false
  }
}

const resetMessageForm = () => {
  messageFormRef.value.resetFields()
}
</script>

<style scoped>
.contact {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
}

.page-header {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  padding: 4rem 0;
  text-align: center;
  margin-top: 70px;
}

.page-title {
  font-size: 3rem;
  margin-bottom: 1rem;
}

.page-subtitle {
  font-size: 1.2rem;
  opacity: 0.9;
}

.contact-info {
  padding: 5rem 0;
  background: #f8f9fa;
}

.contact-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 2rem;
}

.contact-card {
  background: white;
  padding: 2rem;
  border-radius: 15px;
  text-align: center;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease;
}

.contact-card:hover {
  transform: translateY(-5px);
}

.contact-icon {
  width: 80px;
  height: 80px;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0 auto 1rem;
  font-size: 2rem;
}

.contact-card h3 {
  font-size: 1.3rem;
  color: #2c3e50;
  margin-bottom: 1rem;
}

.contact-card p {
  color: #666;
  line-height: 1.6;
  margin: 0.5rem 0;
}

.contact-content {
  padding: 5rem 0;
}

.content-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 4rem;
  align-items: start;
}

.map-section h2,
.form-section h2 {
  font-size: 2rem;
  color: #2c3e50;
  margin-bottom: 2rem;
}

.map-container {
  height: 300px;
  background: #f8f9fa;
  border-radius: 10px;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-bottom: 2rem;
}

.map-placeholder {
  text-align: center;
  color: #666;
}

.map-placeholder .el-icon {
  font-size: 4rem;
  color: #667eea;
  margin-bottom: 1rem;
}

.transport-info h3 {
  color: #2c3e50;
  margin-bottom: 1rem;
}

.transport-info ul {
  list-style: none;
  padding: 0;
}

.transport-info li {
  padding: 0.5rem 0;
  color: #666;
  border-bottom: 1px solid #eee;
}

.transport-info li:last-child {
  border-bottom: none;
}

.message-form {
  background: white;
  padding: 2rem;
  border-radius: 10px;
  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
}

.emergency-contact {
  padding: 5rem 0;
  background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
  color: white;
  text-align: center;
}

.emergency-content h2 {
  font-size: 2.5rem;
  margin-bottom: 1rem;
}

.emergency-content > p {
  font-size: 1.2rem;
  margin-bottom: 3rem;
  opacity: 0.9;
}

.emergency-info {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2rem;
  max-width: 700px;
  margin: 0 auto;
}

.emergency-item {
  display: flex;
  align-items: center;
  gap: 1rem;
  padding: 2rem;
  background: rgba(255, 255, 255, 0.1);
  border-radius: 10px;
  text-align: left;
}

.emergency-item .el-icon {
  font-size: 3rem;
  color: #e74c3c;
}

.emergency-item h3 {
  font-size: 1.3rem;
  margin-bottom: 0.5rem;
}

.emergency-item p {
  opacity: 0.9;
  margin: 0;
}

@media (max-width: 768px) {
  .page-title {
    font-size: 2rem;
  }
  
  .content-grid {
    grid-template-columns: 1fr;
    gap: 2rem;
  }
  
  .contact-grid {
    grid-template-columns: 1fr;
  }
  
  .emergency-info {
    grid-template-columns: 1fr;
  }
  
  .emergency-item {
    flex-direction: column;
    text-align: center;
  }
}
</style>