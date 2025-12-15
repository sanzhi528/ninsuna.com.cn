<template>
  <div class="products">
    <div class="page-header">
      <h1>产品管理</h1>
      <p>管理网站展示的电子产品和服务项目</p>
    </div>
    
    <el-card>
      <template #header>
        <div class="card-header">
          <span>产品列表</span>
          <el-button type="primary" size="small">
            <el-icon><Plus /></el-icon>
            添加产品
          </el-button>
        </div>
      </template>
      
      <div class="search-bar">
        <el-input 
          v-model="searchKeyword" 
          placeholder="搜索产品名称" 
          style="width: 300px"
          prefix-icon="Search"
        />
        <el-select v-model="categoryFilter" placeholder="选择分类" style="width: 200px">
          <el-option label="全部" value=""></el-option>
          <el-option label="办公设备" value="office"></el-option>
          <el-option label="网络设备" value="network"></el-option>
          <el-option label="智能硬件" value="hardware"></el-option>
          <el-option label="软件开发" value="software"></el-option>
          <el-option label="科技咨询" value="consultation"></el-option>
        </el-select>
        <el-button type="primary" icon="Search">搜索</el-button>
        <el-button icon="Refresh">重置</el-button>
      </div>
      
      <el-table :data="productList" style="width: 100%" v-loading="loading">
        <el-table-column prop="id" label="ID" width="80" />
        <el-table-column prop="name" label="产品名称" />
        <el-table-column prop="category" label="分类" width="120">
          <template #default="{ row }">
            <el-tag>{{ getCategoryText(row.category) }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="price" label="价格" width="120">
          <template #default="{ row }">
            {{ row.price ? `¥${row.price}` : '面议' }}
          </template>
        </el-table-column>
        <el-table-column prop="stock" label="库存" width="100" />
        <el-table-column prop="status" label="状态" width="100">
          <template #default="{ row }">
            <el-tag :type="row.status ? 'success' : 'danger'">
              {{ row.status ? '上架' : '下架' }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="createTime" label="创建时间" width="180" />
        <el-table-column label="操作" width="200">
          <template #default="{ row }">
            <el-button size="small" type="primary" link>编辑</el-button>
            <el-button size="small" type="warning" link>
              {{ row.status ? '下架' : '上架' }}
            </el-button>
            <el-button size="small" type="danger" link>删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { Plus, Search, Refresh } from '@element-plus/icons-vue'

const searchKeyword = ref('')
const categoryFilter = ref('')
const loading = ref(false)

const productList = ref([
  {
    id: 1,
    name: 'ThinkPad X1 Carbon 笔记本电脑',
    category: 'office',
    price: 8999,
    stock: 50,
    status: true,
    createTime: '2024-01-15 10:00:00'
  },
  {
    id: 2,
    name: '华为企业级路由器',
    category: 'network',
    price: 1200,
    stock: 30,
    status: true,
    createTime: '2024-01-10 14:30:00'
  },
  {
    id: 3,
    name: '企业ERP系统开发',
    category: 'software',
    price: null,
    stock: null,
    status: true,
    createTime: '2024-01-05 09:15:00'
  },
  {
    id: 4,
    name: '科技架构咨询',
    category: 'consultation',
    price: null,
    stock: null,
    status: true,
    createTime: '2024-01-03 16:20:00'
  }
])

const getCategoryText = (category) => {
  const categories = {
    office: '办公设备',
    network: '网络设备',
    hardware: '智能硬件',
    software: '软件开发',
    consultation: '科技咨询'
  }
  return categories[category] || '其他'
}
</script>

<style scoped>
.products {
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

.search-bar {
  display: flex;
  gap: 1rem;
  margin-bottom: 1.5rem;
  align-items: center;
}
</style>