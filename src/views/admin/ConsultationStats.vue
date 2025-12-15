<template>
  <div class="consultation-stats">
    <div class="page-header">
      <h1>咨询统计</h1>
      <p>查看咨询请求的数量和类型分布</p>
    </div>
    
    <div class="stats-overview">
      <el-card>
        <div class="stat-item">
          <h3>总咨询数</h3>
          <p class="stat-number">342</p>
          <p class="stat-change positive">+8.3% 较上月</p>
        </div>
      </el-card>
      
      <el-card>
        <div class="stat-item">
          <h3>本月新增</h3>
          <p class="stat-number">45</p>
          <p class="stat-change positive">+12.5% 较上月</p>
        </div>
      </el-card>
      
      <el-card>
        <div class="stat-item">
          <h3>平均响应时间</h3>
          <p class="stat-number">2.3h</p>
          <p class="stat-change positive">-15% 较上月</p>
        </div>
      </el-card>
      
      <el-card>
        <div class="stat-item">
          <h3>完成率</h3>
          <p class="stat-number">92%</p>
          <p class="stat-change positive">+3.2% 较上月</p>
        </div>
      </el-card>
    </div>
    
    <el-card style="margin-top: 2rem;">
      <template #header>
        <h3>咨询类型分布</h3>
      </template>
      <div class="chart-placeholder">
        <p>咨询类型分布图表区域</p>
        <p>这里将显示各类咨询的占比和趋势</p>
      </div>
    </el-card>
    
    <el-card style="margin-top: 2rem;">
      <template #header>
        <h3>咨询处理效率</h3>
      </template>
      <div class="chart-placeholder">
        <p>咨询处理效率图表区域</p>
        <p>这里将显示咨询响应时间和处理时长的统计</p>
      </div>
    </el-card>
  </div>
</template>

<script setup>
// 咨询统计页面逻辑
</script>

<style scoped>
.consultation-stats {
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