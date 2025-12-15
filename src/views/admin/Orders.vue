<template>
  <div class="orders">
    <div class="page-header">
      <h1>订单管理</h1>
      <p>管理用户提交的产品和服务订单</p>
    </div>
    
    <el-card>
      <template #header>
        <div class="card-header">
          <span>订单列表</span>
          <div class="filter-tabs">
            <el-radio-group v-model="filterStatus" size="small">
              <el-radio-button label="all">全部</el-radio-button>
              <el-radio-button label="pending">待支付</el-radio-button>
              <el-radio-button label="paid">已支付</el-radio-button>
              <el-radio-button label="shipped">已发货</el-radio-button>
              <el-radio-button label="completed">已完成</el-radio-button>
              <el-radio-button label="cancelled">已取消</el-radio-button>
            </el-radio-group>
          </div>
        </div>
      </template>
      
      <el-table :data="orderList" style="width: 100%" v-loading="loading">
        <el-table-column prop="id" label="订单号" width="140" />
        <el-table-column prop="userName" label="用户" width="120" />
        <el-table-column prop="productName" label="产品/服务" />
        <el-table-column prop="quantity" label="数量" width="80" />
        <el-table-column prop="amount" label="金额" width="120">
          <template #default="{ row }">
            ¥{{ row.amount }}
          </template>
        </el-table-column>
        <el-table-column prop="createTime" label="下单时间" width="180" />
        <el-table-column prop="status" label="状态" width="100">
          <template #default="{ row }">
            <el-tag :type="getStatusType(row.status)">
              {{ getStatusText(row.status) }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="200">
          <template #default="{ row }">
            <el-button size="small" type="primary" link>详情</el-button>
            <el-button size="small" type="success" link v-if="row.status === 'paid'">
              发货
            </el-button>
            <el-button size="small" type="warning" link v-if="row.status === 'shipped'">
              完成
            </el-button>
            <el-button size="small" type="danger" link v-if="row.status === 'pending'">
              取消
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

const orderList = ref([
  {
    id: '20241130001',
    userName: '张三',
    productName: 'ThinkPad X1 Carbon 笔记本电脑',
    quantity: 1,
    amount: 8999,
    createTime: '2024-01-20 14:30:00',
    status: 'paid'
  },
  {
    id: '20241130002',
    userName: '李四',
    productName: '软件开发服务 - 企业ERP系统',
    quantity: 1,
    amount: 50000,
    createTime: '2024-01-19 10:15:00',
    status: 'pending'
  },
  {
    id: '20241130003',
    userName: '王五',
    productName: '华为路由器 + 交换机套装',
    quantity: 2,
    amount: 3200,
    createTime: '2024-01-18 16:45:00',
    status: 'completed'
  }
])

const getStatusType = (status) => {
  const types = {
    pending: 'warning',
    paid: 'primary',
    shipped: 'info',
    completed: 'success',
    cancelled: 'danger'
  }
  return types[status] || 'info'
}

const getStatusText = (status) => {
  const texts = {
    pending: '待支付',
    paid: '已支付',
    shipped: '已发货',
    completed: '已完成',
    cancelled: '已取消'
  }
  return texts[status] || '未知'
}
</script>

<style scoped>
.orders {
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