<template>
  <div class="order-stats">
    <div class="page-header">
      <h1>订单统计</h1>
      <p>查看订单数量和收入统计信息</p>
    </div>
    
    <div class="stats-overview">
      <el-card>
        <div class="stat-item">
          <h3>总订单数</h3>
          <p class="stat-number">89</p>
          <p class="stat-change positive">+15.2% 较上月</p>
        </div>
      </el-card>
      
      <el-card>
        <div class="stat-item">
          <h3>本月新增</h3>
          <p class="stat-number">12</p>
          <p class="stat-change positive">+20% 较上月</p>
        </div>
      </el-card>
      
      <el-card>
        <div class="stat-item">
          <h3>总收入</h3>
          <p class="stat-number">¥156,800</p>
          <p class="stat-change positive">+18.7% 较上月</p>
        </div>
      </el-card>
      
      <el-card>
        <div class="stat-item">
          <h3>平均客单价</h3>
          <p class="stat-number">¥1,762</p>
          <p class="stat-change positive">+3.1% 较上月</p>
        </div>
      </el-card>
    </div>
    
    <el-card style="margin-top: 2rem;">
      <template #header>
        <h3>订单收入趋势</h3>
      </template>
      <div class="chart-placeholder">
        <p>订单收入趋势图表区域</p>
        <p>这里将显示订单数量和收入的月度趋势</p>
      </div>
    </el-card>
    
    <el-card style="margin-top: 2rem;">
      <template #header>
        <h3>产品销量排行</h3>
      </template>
      <div class="chart-placeholder">
        <p>产品销量排行图表区域</p>
        <p>这里将显示各类产品和服务的销量排行</p>
      </div>
    </el-card>
  </div>
</template>

<script setup>
// 订单统计页面逻辑
</script>

<style scoped>
.order-stats {
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

.stats-overview {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 1.5rem;
  margin-bottom: 2rem;
}

.stat-item {
  text-align: center;
  padding: 1.5rem;
}

.stat-item h3 {
  color: #6b7280;
  font-size: 0.9rem;
  margin-bottom: 1rem;
}

.stat-number {
  font-size: 2.5rem;
  font-weight: bold;
  color: #1f2937;
  margin: 0 0 0.5rem 0;
}

.stat-change {
  margin: 0;
  font-size: 0.9rem;
}

.stat-change.positive {
  color: #10b981;
}

.stat-change.negative {
  color: #ef4444;
}

.chart-placeholder {
  height: 300px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  background: #f8fafc;
  border-radius: 8px;
  color: #6b7280;
}

.chart-placeholder p {
  margin: 0.5rem 0;
}
</style>