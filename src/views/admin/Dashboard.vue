<template>
  <div class="dashboard">
    <div class="dashboard-header">
      <h1>仪表盘</h1>
      <p>欢迎回来，{{ userStore.userInfo?.username || '管理员' }}</p>
    </div>
    
    <div class="stats-grid">
      <el-card class="stat-card">
        <div class="stat-content">
          <div class="stat-icon user-icon">
            <el-icon><User /></el-icon>
          </div>
          <div class="stat-info">
            <h3>总用户数</h3>
            <p class="stat-number">{{ stats.totalUsers }}</p>
            <p class="stat-change">
              <span :class="{ 'positive': stats.userGrowth > 0, 'negative': stats.userGrowth < 0 }">
                {{ stats.userGrowth > 0 ? '+' : '' }}{{ stats.userGrowth }}%
              </span>
              较上月
            </p>
          </div>
        </div>
      </el-card>
      
      <el-card class="stat-card">
        <div class="stat-content">
          <div class="stat-icon consultation-icon">
            <el-icon><ChatDotRound /></el-icon>
          </div>
          <div class="stat-info">
            <h3>咨询数量</h3>
            <p class="stat-number">{{ stats.totalConsultations }}</p>
            <p class="stat-change">
              <span :class="{ 'positive': stats.consultationGrowth > 0, 'negative': stats.consultationGrowth < 0 }">
                {{ stats.consultationGrowth > 0 ? '+' : '' }}{{ stats.consultationGrowth }}%
              </span>
              较上月
            </p>
          </div>
        </div>
      </el-card>
      
      <el-card class="stat-card">
        <div class="stat-content">
          <div class="stat-icon order-icon">
            <el-icon><ShoppingCart /></el-icon>
          </div>
          <div class="stat-info">
            <h3>订单数量</h3>
            <p class="stat-number">{{ stats.totalOrders }}</p>
            <p class="stat-change">
              <span :class="{ 'positive': stats.orderGrowth > 0, 'negative': stats.orderGrowth < 0 }">
                {{ stats.orderGrowth > 0 ? '+' : '' }}{{ stats.orderGrowth }}%
              </span>
              较上月
            </p>
          </div>
        </div>
      </el-card>
      
      <el-card class="stat-card">
        <div class="stat-content">
          <div class="stat-icon revenue-icon">
            <el-icon><Money /></el-icon>
          </div>
          <div class="stat-info">
            <h3>总收入</h3>
            <p class="stat-number">¥{{ stats.totalRevenue }}</p>
            <p class="stat-change">
              <span :class="{ 'positive': stats.revenueGrowth > 0, 'negative': stats.revenueGrowth < 0 }">
                {{ stats.revenueGrowth > 0 ? '+' : '' }}{{ stats.revenueGrowth }}%
              </span>
              较上月
            </p>
          </div>
        </div>
      </el-card>
    </div>
    
    <div class="charts-grid">
      <el-card class="chart-card">
        <template #header>
          <div class="chart-header">
            <h3>用户增长趋势</h3>
            <el-select v-model="userChartRange" size="small" style="width: 120px">
              <el-option label="最近7天" value="7"></el-option>
              <el-option label="最近30天" value="30"></el-option>
              <el-option label="最近90天" value="90"></el-option>
            </el-select>
          </div>
        </template>
        <div class="chart-container">
          <div class="chart-placeholder">用户增长图表区域</div>
        </div>
      </el-card>
      
      <el-card class="chart-card">
        <template #header>
          <div class="chart-header">
            <h3>咨询类型分布</h3>
          </div>
        </template>
        <div class="chart-container">
          <div class="chart-placeholder">咨询类型分布图表区域</div>
        </div>
      </el-card>
    </div>
    
    <div class="recent-activities">
      <el-card>
        <template #header>
          <h3>最近活动</h3>
        </template>
        <div class="activities-list">
          <div v-for="activity in recentActivities" :key="activity.id" class="activity-item">
            <div class="activity-icon">
              <el-icon>
                <component :is="activity.icon" />
              </el-icon>
            </div>
            <div class="activity-content">
              <p class="activity-text">{{ activity.text }}</p>
              <p class="activity-time">{{ activity.time }}</p>
            </div>
          </div>
        </div>
      </el-card>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue'
import { useUserStore } from '@/stores/user'
import {
  User,
  ChatDotRound,
  ShoppingCart,
  Money,
  UserFilled,
  ChatLineRound,
  ShoppingBag,
  Coin
} from '@element-plus/icons-vue'

const userStore = useUserStore()
const userChartRange = ref('30')

const stats = reactive({
  totalUsers: 1256,
  userGrowth: 12.5,
  totalConsultations: 342,
  consultationGrowth: 8.3,
  totalOrders: 89,
  orderGrowth: 15.2,
  totalRevenue: 156800,
  revenueGrowth: 18.7
})

const recentActivities = ref([
  {
    id: 1,
    icon: 'UserFilled',
    text: '新用户 "张三" 注册成功',
    time: '5分钟前'
  },
  {
    id: 2,
    icon: 'ChatLineRound',
    text: '收到来自 "李四" 的科技咨询',
    time: '15分钟前'
  },
  {
    id: 3,
    icon: 'ShoppingBag',
    text: '订单 #20241130001 已完成支付',
    time: '30分钟前'
  },
  {
    id: 4,
    icon: 'Coin',
    text: '软件开发项目 "企业ERP系统" 已启动',
    time: '1小时前'
  },
  {
    id: 5,
    icon: 'UserFilled',
    text: '用户 "王五" 更新了个人信息',
    time: '2小时前'
  }
])

onMounted(() => {
  // 模拟加载数据
  setTimeout(() => {
    // 这里可以加载真实的数据
  }, 1000)
})
</script>

<style scoped>
.dashboard {
  padding: 0;
}

.dashboard-header {
  margin-bottom: 2rem;
}

.dashboard-header h1 {
  font-size: 2rem;
  color: #1f2937;
  margin-bottom: 0.5rem;
}

.dashboard-header p {
  color: #6b7280;
  margin: 0;
}

.stats-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 1.5rem;
  margin-bottom: 2rem;
}

.stat-card {
  border-radius: 12px;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
}

.stat-content {
  display: flex;
  align-items: center;
  gap: 1rem;
}

.stat-icon {
  width: 60px;
  height: 60px;
  border-radius: 12px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1.5rem;
  color: white;
}

.user-icon { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); }
.consultation-icon { background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); }
.order-icon { background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); }
.revenue-icon { background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%); }

.stat-info h3 {
  margin: 0 0 0.5rem 0;
  color: #6b7280;
  font-size: 0.9rem;
  font-weight: 500;
}

.stat-number {
  font-size: 2rem;
  font-weight: bold;
  color: #1f2937;
  margin: 0 0 0.25rem 0;
}

.stat-change {
  margin: 0;
  font-size: 0.8rem;
  color: #6b7280;
}

.stat-change .positive {
  color: #10b981;
}

.stat-change .negative {
  color: #ef4444;
}

.charts-grid {
  display: grid;
  grid-template-columns: 2fr 1fr;
  gap: 1.5rem;
  margin-bottom: 2rem;
}

.chart-card {
  border-radius: 12px;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
}

.chart-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.chart-header h3 {
  margin: 0;
  color: #1f2937;
}

.chart-container {
  height: 300px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.chart-placeholder {
  color: #9ca3af;
  font-size: 1.1rem;
  text-align: center;
  padding: 2rem;
  background: #f8fafc;
  border-radius: 8px;
  width: 100%;
}

.activities-list {
  max-height: 400px;
  overflow-y: auto;
}

.activity-item {
  display: flex;
  align-items: center;
  gap: 1rem;
  padding: 1rem 0;
  border-bottom: 1px solid #e5e7eb;
}

.activity-item:last-child {
  border-bottom: none;
}

.activity-icon {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background: #f3f4f6;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #667eea;
}

.activity-content {
  flex: 1;
}

.activity-text {
  margin: 0 0 0.25rem 0;
  color: #1f2937;
}

.activity-time {
  margin: 0;
  color: #6b7280;
  font-size: 0.8rem;
}

@media (max-width: 768px) {
  .stats-grid {
    grid-template-columns: 1fr;
  }
  
  .charts-grid {
    grid-template-columns: 1fr;
  }
  
  .chart-container {
    height: 250px;
  }
}
</style>