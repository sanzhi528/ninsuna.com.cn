<template>
  <div class="users">
    <div class="page-header">
      <h1>用户管理</h1>
      <p>管理网站用户账户和权限</p>
    </div>
    
    <el-card>
      <template #header>
        <div class="card-header">
          <span>用户列表</span>
          <el-button type="primary" size="small">
            <el-icon><Plus /></el-icon>
            添加用户
          </el-button>
        </div>
      </template>
      
      <div class="search-bar">
        <el-input 
          v-model="searchKeyword" 
          placeholder="搜索用户名、邮箱或手机号" 
          style="width: 300px"
          prefix-icon="Search"
        />
        <el-button type="primary" icon="Search">搜索</el-button>
        <el-button icon="Refresh">重置</el-button>
      </div>
      
      <el-table :data="userList" style="width: 100%" v-loading="loading">
        <el-table-column prop="id" label="ID" width="80" />
        <el-table-column prop="username" label="用户名" />
        <el-table-column prop="email" label="邮箱" />
        <el-table-column prop="phone" label="手机号" />
        <el-table-column prop="company" label="公司" />
        <el-table-column prop="role" label="角色" width="100">
          <template #default="{ row }">
            <el-tag :type="row.role === 'admin' ? 'danger' : 'primary'">
              {{ row.role === 'admin' ? '管理员' : '普通用户' }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="createTime" label="注册时间" width="180" />
        <el-table-column prop="status" label="状态" width="100">
          <template #default="{ row }">
            <el-tag :type="row.status ? 'success' : 'danger'">
              {{ row.status ? '正常' : '禁用' }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="200">
          <template #default="{ row }">
            <el-button size="small" type="primary" link>编辑</el-button>
            <el-button size="small" type="danger" link>删除</el-button>
            <el-button size="small" type="warning" link>
              {{ row.status ? '禁用' : '启用' }}
            </el-button>
          </template>
        </el-table-column>
      </el-table>
      
      <div class="pagination">
        <el-pagination
          v-model:current-page="currentPage"
          v-model:page-size="pageSize"
          :page-sizes="[10, 20, 50, 100]"
          :total="total"
          layout="total, sizes, prev, pager, next, jumper"
        />
      </div>
    </el-card>
  </div>
</template>

<script setup>
import { ref, reactive } from 'vue'
import { Plus, Search, Refresh } from '@element-plus/icons-vue'

const searchKeyword = ref('')
const loading = ref(false)
const currentPage = ref(1)
const pageSize = ref(10)
const total = ref(100)

const userList = ref([
  {
    id: 1,
    username: 'admin',
    email: 'admin@bentiun.com',
    phone: '13800138000',
    company: '本屯科技',
    role: 'admin',
    createTime: '2024-01-01 10:00:00',
    status: true
  },
  {
    id: 2,
    username: 'zhangsan',
    email: 'zhangsan@example.com',
    phone: '13900139000',
    company: 'ABC公司',
    role: 'user',
    createTime: '2024-01-15 14:30:00',
    status: true
  },
  {
    id: 3,
    username: 'lisi',
    email: 'lisi@example.com',
    phone: '13700137000',
    company: 'XYZ企业',
    role: 'user',
    createTime: '2024-01-20 09:15:00',
    status: false
  }
])
</script>

<style scoped>
.users {
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

.pagination {
  display: flex;
  justify-content: center;
  margin-top: 2rem;
}
</style>