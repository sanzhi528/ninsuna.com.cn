<template>
  <div class="consultation">
    <Header />
    
    <!-- 页面标题 -->
    <section class="page-header">
      <div class="container">
        <h1 class="page-title">科技咨询</h1>
        <p class="page-subtitle">专业的技术咨询服务，为您提供最优解决方案</p>
      </div>
    </section>

    <!-- 咨询表单 -->
    <section class="consultation-form">
      <div class="container">
        <div class="form-container">
          <h2>在线咨询</h2>
          <p class="form-description">请填写以下信息，我们的专业顾问将在24小时内与您联系</p>
          
          <el-form 
            :model="consultForm" 
            :rules="formRules" 
            ref="consultFormRef"
            label-width="120px"
            class="consult-form"
          >
            <el-form-item label="咨询类型" prop="type">
              <el-radio-group v-model="consultForm.type">
                <el-radio label="tech">技术咨询</el-radio>
                <el-radio label="software">软件开发</el-radio>
                <el-radio label="product">产品采购</el-radio>
                <el-radio label="other">其他服务</el-radio>
              </el-radio-group>
            </el-form-item>
            
            <el-form-item label="姓名" prop="name">
              <el-input v-model="consultForm.name" placeholder="请输入您的姓名" />
            </el-form-item>
            
            <el-form-item label="联系电话" prop="phone">
              <el-input v-model="consultForm.phone" placeholder="请输入您的联系电话" />
            </el-form-item>
            
            <el-form-item label="邮箱" prop="email">
              <el-input v-model="consultForm.email" placeholder="请输入您的邮箱地址" />
            </el-form-item>
            
            <el-form-item label="公司名称" prop="company">
              <el-input v-model="consultForm.company" placeholder="请输入您的公司名称" />
            </el-form-item>
            
            <el-form-item label="咨询内容" prop="content">
              <el-input 
                v-model="consultForm.content" 
                type="textarea" 
                :rows="5"
                placeholder="请详细描述您的需求，包括项目背景、技术要求、预算范围等信息"
              />
            </el-form-item>
            
            <el-form-item>
              <el-button type="primary" size="large" @click="submitConsult" :loading="submitting">
                提交咨询
              </el-button>
              <el-button size="large" @click="resetForm">重置表单</el-button>
            </el-form-item>
          </el-form>
        </div>
      </div>
    </section>

    <!-- 咨询优势 -->
    <section class="consult-advantages">
      <div class="container">
        <h2 class="section-title">咨询优势</h2>
        <div class="advantages-grid">
          <div class="advantage-item">
            <div class="advantage-icon">
              <el-icon><Clock /></el-icon>
            </div>
            <h3>快速响应</h3>
            <p>专业顾问24小时内响应，及时解决您的问题</p>
          </div>
          <div class="advantage-item">
            <div class="advantage-icon">
              <el-icon><User /></el-icon>
            </div>
            <h3>专业团队</h3>
            <p>资深技术专家团队，提供专业的解决方案</p>
          </div>
          <div class="advantage-item">
            <div class="advantage-icon">
              <el-icon><Document /></el-icon>
            </div>
            <h3>详细方案</h3>
            <p>提供详细的技术方案和项目计划书</p>
          </div>
          <div class="advantage-item">
            <div class="advantage-icon">
              <el-icon><PriceTag /></el-icon>
            </div>
            <h3>合理报价</h3>
            <p>透明报价体系，确保性价比最优</p>
          </div>
        </div>
      </div>
    </section>

    <!-- 常见问题 -->
    <section class="faq-section">
      <div class="container">
        <h2 class="section-title">常见问题</h2>
        <el-collapse v-model="activeFaq" accordion>
          <el-collapse-item name="1" title="咨询需要收费吗？">
            <p>初步咨询是完全免费的。我们的专业顾问会先了解您的需求，提供初步建议。只有在确定具体方案并签订合同后，才会产生相关费用。</p>
          </el-collapse-item>
          <el-collapse-item name="2" title="响应时间需要多久？">
            <p>我们承诺在收到咨询后的24小时内与您联系。对于紧急项目，您可以在咨询内容中注明"紧急"，我们会优先处理。</p>
          </el-collapse-item>
          <el-collapse-item name="3" title="软件开发项目的周期是多久？">
            <p>项目周期根据具体需求而定，一般小型项目需要2-4周，中型项目需要1-3个月，大型项目可能需要3-6个月或更长。我们会根据需求评估后给出详细的时间计划。</p>
          </el-collapse-item>
          <el-collapse-item name="4" title="是否提供售后服务？">
            <p>是的，我们提供完善的售后服务。软件开发项目通常包含3-12个月的免费维护期，电子产品提供正规的保修服务。</p>
          </el-collapse-item>
          <el-collapse-item name="5" title="可以上门服务吗？">
            <p>对于深圳地区的客户，我们提供上门服务。其他地区的客户可以根据项目需求安排远程支持或现场服务。</p>
          </el-collapse-item>
        </el-collapse>
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
import { Clock, User, Document, PriceTag } from '@element-plus/icons-vue'

const consultFormRef = ref()
const submitting = ref(false)
const activeFaq = ref('1')

const consultForm = reactive({
  type: 'tech',
  name: '',
  phone: '',
  email: '',
  company: '',
  content: ''
})

const formRules = {
  type: [
    { required: true, message: '请选择咨询类型', trigger: 'change' }
  ],
  name: [
    { required: true, message: '请输入姓名', trigger: 'blur' },
    { min: 2, max: 20, message: '姓名长度在 2 到 20 个字符', trigger: 'blur' }
  ],
  phone: [
    { required: true, message: '请输入联系电话', trigger: 'blur' },
    { pattern: /^1[3-9]\d{9}$/, message: '请输入正确的手机号码', trigger: 'blur' }
  ],
  email: [
    { required: true, message: '请输入邮箱地址', trigger: 'blur' },
    { type: 'email', message: '请输入正确的邮箱地址', trigger: 'blur' }
  ],
  company: [
    { required: true, message: '请输入公司名称', trigger: 'blur' }
  ],
  content: [
    { required: true, message: '请输入咨询内容', trigger: 'blur' },
    { min: 10, message: '咨询内容至少10个字符', trigger: 'blur' }
  ]
}

const submitConsult = async () => {
  try {
    const valid = await consultFormRef.value.validate()
    if (!valid) return
    
    submitting.value = true
    
    // 模拟提交到后端
    await new Promise(resolve => setTimeout(resolve, 2000))
    
    ElMessage.success('咨询提交成功！我们的顾问将在24小时内与您联系。')
    resetForm()
  } catch (error) {
    ElMessage.error('提交失败，请稍后重试')
  } finally {
    submitting.value = false
  }
}

const resetForm = () => {
  consultFormRef.value.resetFields()
}
</script>

<style scoped>
.consultation {
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

.consultation-form {
  padding: 5rem 0;
  background: #f8f9fa;
}

.form-container {
  max-width: 800px;
  margin: 0 auto;
  background: white;
  padding: 3rem;
  border-radius: 15px;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
}

.form-container h2 {
  text-align: center;
  font-size: 2rem;
  color: #2c3e50;
  margin-bottom: 1rem;
}

.form-description {
  text-align: center;
  color: #666;
  margin-bottom: 2rem;
}

.consult-form {
  max-width: 600px;
  margin: 0 auto;
}

.consult-advantages {
  padding: 5rem 0;
}

.advantages-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 2rem;
  max-width: 1000px;
  margin: 0 auto;
}

.advantage-item {
  text-align: center;
  padding: 2rem;
}

.advantage-icon {
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

.advantage-item h3 {
  font-size: 1.3rem;
  color: #2c3e50;
  margin-bottom: 1rem;
}

.advantage-item p {
  color: #666;
  line-height: 1.6;
}

.faq-section {
  padding: 5rem 0;
  background: #f8f9fa;
}

.faq-section .container {
  max-width: 800px;
}

:deep(.el-collapse-item__header) {
  font-size: 1.1rem;
  font-weight: 600;
  color: #2c3e50;
}

:deep(.el-collapse-item__content) {
  color: #666;
  line-height: 1.6;
}

@media (max-width: 768px) {
  .page-title {
    font-size: 2rem;
  }
  
  .form-container {
    padding: 2rem 1rem;
    margin: 0 1rem;
  }
  
  .advantages-grid {
    grid-template-columns: 1fr;
  }
  
  :deep(.el-form-item__label) {
    width: 100px !important;
  }
  
  :deep(.el-form-item__content) {
    margin-left: 100px !important;
  }
}
</style>