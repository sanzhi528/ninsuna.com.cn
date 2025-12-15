<template>
  <div class="settings">
    <div class="page-header">
      <h1>系统设置</h1>
      <p>配置网站基本信息和系统参数</p>
    </div>
    
    <el-card>
      <template #header>
        <span>基本设置</span>
      </template>
      
      <el-form :model="settingsForm" label-width="120px">
        <el-form-item label="网站名称">
          <el-input v-model="settingsForm.siteName" placeholder="请输入网站名称" />
        </el-form-item>
        
        <el-form-item label="网站描述">
          <el-input 
            v-model="settingsForm.siteDescription" 
            type="textarea" 
            :rows="3"
            placeholder="请输入网站描述" 
          />
        </el-form-item>
        
        <el-form-item label="联系电话">
          <el-input v-model="settingsForm.phone" placeholder="请输入联系电话" />
        </el-form-item>
        
        <el-form-item label="联系邮箱">
          <el-input v-model="settingsForm.email" placeholder="请输入联系邮箱" />
        </el-form-item>
        
        <el-form-item label="公司地址">
          <el-input 
            v-model="settingsForm.address" 
            type="textarea" 
            :rows="2"
            placeholder="请输入公司地址" 
          />
        </el-form-item>
        
        <el-form-item label="营业时间">
          <el-input v-model="settingsForm.businessHours" placeholder="请输入营业时间" />
        </el-form-item>
        
        <el-form-item>
          <el-button type="primary" @click="handleSave">保存设置</el-button>
          <el-button>重置</el-button>
        </el-form-item>
      </el-form>
    </el-card>
    
    <el-card style="margin-top: 2rem;">
      <template #header>
        <span>域名设置</span>
      </template>
      
      <div class="domain-list">
        <div v-for="domain in domains" :key="domain.name" class="domain-item">
          <div class="domain-info">
            <span class="domain-name">{{ domain.name }}</span>
            <el-tag :type="domain.status ? 'success' : 'danger'">
              {{ domain.status ? '已绑定' : '未绑定' }}
            </el-tag>
          </div>
          <el-button size="small" type="primary" link>配置</el-button>
        </div>
      </div>
    </el-card>
  </div>
</template>

<script setup>
import { ref, reactive } from 'vue'
import { ElMessage } from 'element-plus'
import { companyInfo } from '@/config/contact'

const settingsForm = reactive({
  siteName: companyInfo.name,
  siteDescription: '专业的科技服务提供商，提供科技信息咨询、软件开发、电子产品销售等服务',
  phone: companyInfo.phone,
  email: companyInfo.email,
  address: companyInfo.address,
  businessHours: companyInfo.businessHours.weekdays
})

const domains = ref([
  { name: 'www.bentiun.com', status: true },
  { name: 'www.bentiun.com.cn', status: false },
  { name: 'www.bentiun.cn', status: false }
])

const handleSave = () => {
  ElMessage.success('设置保存成功')
}
</script>

<style scoped>
.settings {
  padding: 0;
}

.page-header {
  margin-bottom: 2rem;
}

.page-header h1 {
  font-size: 2rem;
  color: #1f2937;
  margin-bottom: 0.5rem;
}

.page-header p {
  color: #6b7280;
  margin: 0;
}

.domain-list {
  display: flex;
  flex-direction: column;
  gap: 1rem;
}

.domain-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 1rem;
  background: #f8fafc;
  border-radius: 8px;
}

.domain-info {
  display: flex;
  align-items: center;
  gap: 1rem;
}

.domain-name {
  font-weight: 500;
  color: #1f2937;
}
</style>