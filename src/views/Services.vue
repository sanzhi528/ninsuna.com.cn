<template>
  <div class="services">
    <Header />
    
    <!-- 页面标题 -->
    <section class="page-header">
      <div class="container">
        <h1 class="page-title">服务项目</h1>
        <p class="page-subtitle">我们提供全方位的科技服务，助力企业数字化转型</p>
      </div>
    </section>

    <!-- 服务详情 -->
    <section class="services-detail">
      <div class="container">
        <div class="service-item">
          <div class="service-content">
            <h2>科技信息咨询</h2>
            <p>我们的专业咨询团队拥有丰富的行业经验，能够为企业提供全方位的科技信息咨询服务：</p>
            <ul class="service-features">
              <li>技术趋势分析与市场调研</li>
              <li>技术选型与架构设计咨询</li>
              <li>数字化转型战略规划</li>
              <li>技术风险评估与解决方案</li>
              <li>知识产权保护咨询</li>
            </ul>
            <div class="service-actions">
              <el-button type="primary" @click="$router.push('/consultation')">
                立即咨询
              </el-button>
            </div>
          </div>
          <div class="service-image">
            <img src="/consulting.svg" alt="科技信息咨询" />
          </div>
        </div>

        <div class="service-item reverse">
          <div class="service-content">
            <h2>软件开发</h2>
            <p>我们提供定制化的软件开发服务，涵盖从需求分析到部署上线的全流程：</p>
            <ul class="service-features">
              <li>Web应用开发（前端+后端）</li>
              <li>移动应用开发（iOS/Android）</li>
              <li>企业管理系统定制</li>
              <li>电商平台开发</li>
              <li>API接口开发与集成</li>
            </ul>
            <div class="service-actions">
              <el-button type="primary" @click="$router.push('/consultation')">
                需求沟通
              </el-button>
            </div>
          </div>
          <div class="service-image">
            <img src="/development.svg" alt="软件开发" />
          </div>
        </div>

        <div class="service-item">
          <div class="service-content">
            <h2>电子产品销售</h2>
            <p>我们提供优质的电子产品销售服务，确保产品质量和售后服务：</p>
            <ul class="service-features">
              <li>办公设备（打印机、扫描仪等）</li>
              <li>网络设备（路由器、交换机等）</li>
              <li>智能硬件设备</li>
              <li>安防监控系统</li>
              <li>企业级服务器与存储</li>
            </ul>
            <div class="service-actions">
              <el-button type="primary" @click="$router.push('/products')">
                查看产品
              </el-button>
            </div>
          </div>
          <div class="service-image">
            <img src="/electronics.svg" alt="电子产品销售" />
          </div>
        </div>
      </div>
    </section>

    <!-- 服务流程 -->
    <section class="service-process">
      <div class="container">
        <h2 class="section-title">服务流程</h2>
        <div class="process-steps">
          <div class="process-step">
            <div class="step-number">1</div>
            <h3>需求沟通</h3>
            <p>详细了解客户需求，分析项目可行性</p>
          </div>
          <div class="process-step">
            <div class="step-number">2</div>
            <h3>方案设计</h3>
            <p>制定详细的技术方案和项目计划</p>
          </div>
          <div class="process-step">
            <div class="step-number">3</div>
            <h3>项目实施</h3>
            <p>按照计划进行开发和实施工作</p>
          </div>
          <div class="process-step">
            <div class="step-number">4</div>
            <h3>测试验收</h3>
            <p>进行全面测试，确保质量达标</p>
          </div>
          <div class="process-step">
            <div class="step-number">5</div>
            <h3>售后服务</h3>
            <p>提供持续的技术支持和维护服务</p>
          </div>
        </div>
      </div>
    </section>

    <Footer />
  </div>
</template>

<script setup>
import Header from '@/components/Layout/Header.vue'
import Footer from '@/components/Layout/Footer.vue'
</script>

<style scoped>
.services {
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

.services-detail {
  padding: 5rem 0;
}

.service-item {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 4rem;
  align-items: center;
  margin-bottom: 6rem;
}

.service-item.reverse {
  direction: rtl;
}

.service-item.reverse .service-content {
  direction: ltr;
}

.service-content h2 {
  font-size: 2.5rem;
  color: #2c3e50;
  margin-bottom: 1.5rem;
}

.service-content p {
  font-size: 1.1rem;
  line-height: 1.6;
  color: #666;
  margin-bottom: 1.5rem;
}

.service-features {
  list-style: none;
  margin-bottom: 2rem;
}

.service-features li {
  padding: 0.5rem 0;
  color: #555;
  position: relative;
  padding-left: 1.5rem;
}

.service-features li::before {
  content: '✓';
  position: absolute;
  left: 0;
  color: #667eea;
  font-weight: bold;
}

.service-image img {
  width: 100%;
  max-width: 400px;
  height: auto;
  border-radius: 10px;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
}

.service-process {
  padding: 5rem 0;
  background: #f8f9fa;
}

.process-steps {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 2rem;
  max-width: 1000px;
  margin: 0 auto;
}

.process-step {
  text-align: center;
  padding: 2rem;
  background: white;
  border-radius: 15px;
  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
}

.step-number {
  width: 60px;
  height: 60px;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1.5rem;
  font-weight: bold;
  margin: 0 auto 1rem;
}

.process-step h3 {
  font-size: 1.3rem;
  color: #2c3e50;
  margin-bottom: 1rem;
}

.process-step p {
  color: #666;
  line-height: 1.6;
}

@media (max-width: 768px) {
  .service-item {
    grid-template-columns: 1fr;
    gap: 2rem;
    text-align: center;
  }
  
  .service-item.reverse {
    direction: ltr;
  }
  
  .page-title {
    font-size: 2rem;
  }
  
  .process-steps {
    grid-template-columns: 1fr;
  }
}
</style>