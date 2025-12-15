<template>
  <div class="consultations">
    <div class="page-header">
      <h1>咨询管理</h1>
      <p>管理用户提交的科技咨询请求</p>
    </div>
    
    <el-card>
      <template #header>
        <div class="card-header">
          <span>咨询列表</span>
          <div class="filter-tabs">
            <el-radio-group v-model="filterStatus" size="small">
              <el-radio-button label="all">全部</el-radio-button>
              <el-radio-button label="pending">待处理</el-radio-button>
              <el-radio-button label="processing">处理中</el-radio-button>
              <el-radio-button label="completed">已完成</el-radio-button>
            </el-radio-group>
          </div>
        </div>
      </template>
      
      <el-table :data="consultationList" style="width: 100%" v-loading="loading">
        <el-table-column prop="id" label="ID" width="80" />
        <el-table-column prop="userName" label="用户" />
        <el-table-column prop="type" label="咨询类型" width="120" />
        <el-table-column prop="content" label="咨询内容" :show-overflow-tooltip="true" />
        <el-table-column prop="createTime" label="提交时间" width="180" />
        <el-table-column prop="status" label="状态" width="100">
          <template #default="{ row }">
            <el-tag :type="getStatusType(row.status)">
              {{ getStatusText(row.status) }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="150">
          <template #default="{ row }">
            <el-button size="small" type="primary" link>查看</el-button>
            <el-button size="small" type="success" link v-if="row.status === 'pending'">
              接单
            </el-button>
            <el-button size="small" type="warning" link v-if="row.status === 'processing'">
              完成
            </el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>

<script setup>
import { ref } from 'vue'

const filterStatus = ref('all')
const loading = ref(false)

const consultationList = ref([
  {
    id: 1,
    userName: '张三',
    type: '软件开发',
    content: '需要开发一个企业管理系统，包含员工管理、考勤、薪资等功能',
    createTime: '2024-01-20 10:30:00',
    status: 'pending'
  },
  {
    id: 2,
    userName: '李四',
    type: '科技咨询',
    content: '关于云计算架构的技术咨询，需要专业建议',
    createTime: '2024-01-19 14:20:00',
    status: 'processing'
  },
  {
    id: 3,
    userName: '王五',
    type: '电子产品',
    content: '需要采购一批办公电脑和网络设备',
    createTime: '2024-01-18 09:15:00',
    status: 'completed'
  }
])

const getStatusType = (status) => {
  const types = {
    pending: 'warning',
    processing: 'primary',
    completed: 'success'
  }
  return types[status] || 'info'
}

const getStatusText = (status) => {
  const texts = {
    pending: '待处理',
    processing: '处理中',
    completed: '已完成'
  }
  return texts[status] || '未知'
}
</script>

<style scoped>
.consultations {
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

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.filter-tabs {
  display: flex;
  gap: 1rem;
  align-items: center;
}
</style>