<template>
  <div class="user-stats">
    <div class="page-header">
      <h1>用户统计</h1>
      <p>查看用户增长和活跃度统计数据</p>
    </div>
    
    <div class="stats-overview">
      <el-card>
        <div class="stat-item">
          <h3>总用户数</h3>
          <p class="stat-number">1,256</p>
          <p class="stat-change positive">+12.5% 较上月</p>
        </div>
      </el-card>
      
      <el-card>
        <div class="stat-item">
          <h3>本月新增</h3>
          <p class="stat-number">142</p>
          <p class="stat-change positive">+8.3% 较上月</p>
        </div>
      </el-card>
      
      <el-card>
        <div class="stat-item">
          <h3>活跃用户</h3>
          <p class="stat-number">856</p>
          <p class="stat-change positive">+5.2% 较上月</p>
        </div>
      </el-card>
      
      <el-card>
        <div class="stat-item">
          <h3>平均留存率</h3>
          <p class="stat-number">78%</p>
          <p class="stat-change positive">+2.1% 较上月</p>
        </div>
      </el-card>
    </div>
    
    <el-card style="margin-top: 2rem;">
      <template #header>
        <h3>用户增长趋势</h3>
      </template>
      <div class="chart-placeholder">
        <p>用户增长趋势图表区域</p>
        <p>这里将显示用户注册和活跃度的趋势图表</p>
      </div>
    </el-card>
    
    <el-card style="margin-top: 2rem;">
      <template #header>
        <h3>用户地域分布</h3>
      </template>
      <div class="chart-placeholder">
        <p>用户地域分布图表区域</p>
        <p>这里将显示用户的地域分布热力图</p>
      </div>
    </el-card>
  </div>
</template>

<script setup>
// 用户统计页面逻辑
</script>

<style scoped>
.user-stats {
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