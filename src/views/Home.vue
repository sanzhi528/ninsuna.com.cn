<template>
  <div class="home">
    <Header />
    
    <!-- 英雄区域 -->
    <section class="hero">
      <div class="hero-background"></div>
      <div class="container">
        <div class="hero-content">
          <div class="hero-text">
            <h1 class="hero-title">
              专业的科技服务提供商
              <span class="gradient-text">本屯科技</span>
            </h1>
            <p class="hero-description">
              我们致力于为企业提供全方位的科技解决方案，包括科技信息咨询、软件开发、电子产品销售等专业服务。
              凭借多年的行业经验和技术实力，我们已成为众多企业的信赖合作伙伴。
            </p>
            <div class="hero-actions">
              <el-button type="primary" size="large" @click="$router.push('/services')">
                了解服务
              </el-button>
              <el-button size="large" @click="$router.push('/contact')">
                联系我们
              </el-button>
            </div>
          </div>
          <div class="hero-image">
            <img src="/tech-hero.svg" alt="科技服务" class="hero-img" />
          </div>
        </div>
      </div>
    </section>

    <!-- 服务特色 -->
    <section class="features">
      <div class="container">
        <h2 class="section-title">我们的核心服务</h2>
        <div class="features-grid">
          <div class="feature-card">
            <div class="feature-icon">
              <el-icon size="48"><ChatDotRound /></el-icon>
            </div>
            <h3>科技信息咨询</h3>
            <p>提供专业的科技趋势分析、技术评估和解决方案咨询服务，帮助企业把握科技发展方向。</p>
          </div>
          <div class="feature-card">
            <div class="feature-icon">
              <el-icon size="48"><Monitor /></el-icon>
            </div>
            <h3>软件开发</h3>
            <p>定制化软件开发服务，包括Web应用、移动应用、企业管理系统等，满足不同业务需求。</p>
          </div>
          <div class="feature-card">
            <div class="feature-icon">
              <el-icon size="48"><ShoppingCart /></el-icon>
            </div>
            <h3>电子产品销售</h3>
            <p>提供优质的电子产品销售服务，涵盖办公设备、智能硬件、网络设备等多个品类。</p>
          </div>
        </div>
      </div>
    </section>

    <!-- 公司优势 -->
    <section class="advantages">
      <div class="container">
        <h2 class="section-title">为什么选择我们</h2>
        <div class="advantages-content">
          <div class="advantage-item">
            <div class="advantage-number">01</div>
            <div class="advantage-text">
              <h3>专业团队</h3>
              <p>拥有经验丰富的技术专家和顾问团队，能够提供专业的解决方案。</p>
            </div>
          </div>
          <div class="advantage-item">
            <div class="advantage-number">02</div>
            <div class="advantage-text">
              <h3>优质服务</h3>
              <p>以客户需求为导向，提供全方位的技术支持和售后服务保障。</p>
            </div>
          </div>
          <div class="advantage-item">
            <div class="advantage-number">03</div>
            <div class="advantage-text">
              <h3>创新技术</h3>
              <p>紧跟科技发展趋势，不断引入新技术，为客户创造更大价值。</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- CTA区域 -->
    <section class="cta">
      <div class="container">
        <div class="cta-content">
          <h2>准备好开始您的科技之旅了吗？</h2>
          <p>立即联系我们，获得专业的科技解决方案</p>
          <el-button type="primary" size="large" @click="$router.push('/consultation')">
            免费咨询
          </el-button>
        </div>
      </div>
    </section>

    <Footer />
  </div>
</template>

<script setup>
import Header from '@/components/Layout/Header.vue'
import Footer from '@/components/Layout/Footer.vue'
import { ChatDotRound, Monitor, ShoppingCart } from '@element-plus/icons-vue'
</script>

<style scoped>
.home {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
}

/* 英雄区域样式 */
.hero {
  position: relative;
  min-height: 80vh;
  display: flex;
  align-items: center;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  overflow: hidden;
  margin-top: 70px;
}

.hero-background {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grid" width="10" height="10" patternUnits="userSpaceOnUse"><path d="M 10 0 L 0 0 0 10" fill="none" stroke="rgba(255,255,255,0.1)" stroke-width="0.5"/></pattern></defs><rect width="100" height="100" fill="url(%23grid)"/></svg>');
}

.hero-content {
  position: relative;
  z-index: 2;
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 4rem;
  align-items: center;
  color: white;
}

.hero-title {
  font-size: 3.5rem;
  font-weight: 700;
  line-height: 1.2;
  margin-bottom: 1.5rem;
}

.gradient-text {
  background: linear-gradient(45deg, #ffd89b 0%, #19547b 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.hero-description {
  font-size: 1.2rem;
  line-height: 1.6;
  margin-bottom: 2rem;
  opacity: 0.9;
}

.hero-actions {
  display: flex;
  gap: 1rem;
}

.hero-image {
  display: flex;
  justify-content: center;
  align-items: center;
}

.hero-img {
  max-width: 100%;
  height: auto;
  filter: drop-shadow(0 20px 40px rgba(0, 0, 0, 0.3));
}

/* 特色服务样式 */
.features {
  padding: 5rem 0;
  background: #f8f9fa;
}

.features-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2rem;
}

.feature-card {
  background: white;
  padding: 2rem;
  border-radius: 15px;
  text-align: center;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.feature-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
}

.feature-icon {
  margin-bottom: 1rem;
  color: #667eea;
}

.feature-card h3 {
  font-size: 1.5rem;
  margin-bottom: 1rem;
  color: #2c3e50;
}

.feature-card p {
  color: #666;
  line-height: 1.6;
}

/* 优势区域样式 */
.advantages {
  padding: 5rem 0;
}

.advantages-content {
  display: grid;
  gap: 2rem;
  max-width: 800px;
  margin: 0 auto;
}

.advantage-item {
  display: flex;
  align-items: center;
  gap: 2rem;
  padding: 2rem;
  background: white;
  border-radius: 15px;
  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
}

.advantage-number {
  font-size: 3rem;
  font-weight: bold;
  color: #667eea;
  opacity: 0.3;
}

.advantage-text h3 {
  font-size: 1.5rem;
  margin-bottom: 0.5rem;
  color: #2c3e50;
}

.advantage-text p {
  color: #666;
  line-height: 1.6;
}

/* CTA区域样式 */
.cta {
  padding: 5rem 0;
  background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
  color: white;
  text-align: center;
}

.cta-content h2 {
  font-size: 2.5rem;
  margin-bottom: 1rem;
}

.cta-content p {
  font-size: 1.2rem;
  margin-bottom: 2rem;
  opacity: 0.9;
}

@media (max-width: 768px) {
  .hero-content {
    grid-template-columns: 1fr;
    text-align: center;
    gap: 2rem;
  }
  
  .hero-title {
    font-size: 2.5rem;
  }
  
  .advantage-item {
    flex-direction: column;
    text-align: center;
  }
  
  .hero-actions {
    justify-content: center;
    flex-wrap: wrap;
  }
}
</style>