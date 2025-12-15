<template>
  <footer class="footer">
    <div class="container">
      <div class="footer-content">
        <div class="footer-section">
          <div class="footer-logo">
            <img src="/logo.svg" alt="本屯科技" class="logo-img" />
            <span class="logo-text">本屯科技</span>
          </div>
          <p class="footer-desc">
            专业的科技信息咨询、软件开发、电子产品销售服务提供商
          </p>
          <div class="social-links">
            <a href="#" class="social-link">
              <el-icon><ChatDotRound /></el-icon>
            </a>
            <a href="#" class="social-link">
              <el-icon><Message /></el-icon>
            </a>
            <a href="#" class="social-link">
              <el-icon><Phone /></el-icon>
            </a>
          </div>
        </div>
        
        <div class="footer-section">
          <h3 class="footer-title">服务项目</h3>
          <ul class="footer-links">
            <li><router-link to="/services" class="footer-link">科技信息咨询</router-link></li>
            <li><router-link to="/services" class="footer-link">软件开发</router-link></li>
            <li><router-link to="/services" class="footer-link">电子产品销售</router-link></li>
            <li><router-link to="/consultation" class="footer-link">技术解决方案</router-link></li>
          </ul>
        </div>
        
        <div class="footer-section">
          <h3 class="footer-title">快速链接</h3>
          <ul class="footer-links">
            <li><router-link to="/" class="footer-link">首页</router-link></li>
            <li><router-link to="/products" class="footer-link">产品中心</router-link></li>
            <li><router-link to="/consultation" class="footer-link">在线咨询</router-link></li>
            <li><router-link to="/contact" class="footer-link">联系我们</router-link></li>
          </ul>
        </div>
        
        <div class="footer-section">
          <h3 class="footer-title">联系我们</h3>
          <div class="contact-info">
            <p><el-icon><Location /></el-icon> {{ companyInfo.address }}</p>
            <p><el-icon><Phone /></el-icon> {{ companyInfo.phone }}</p>
            <p><el-icon><Message /></el-icon> {{ companyInfo.infoEmail }}</p>
            <p><el-icon><Clock /></el-icon> {{ companyInfo.businessHours.weekdays }}</p>
          </div>
        </div>
      </div>
      
      <div class="footer-bottom">
        <div class="footer-bottom-content">
          <p>&copy; 2024 本屯科技. 保留所有权利.</p>
          <div class="footer-bottom-links">
            <a href="#" class="footer-bottom-link">隐私政策</a>
            <a href="#" class="footer-bottom-link">服务条款</a>
            <a href="#" class="footer-bottom-link">网站地图</a>
          </div>
        </div>
      </div>
    </div>
  </footer>
</template>

<script setup>
import { companyInfo } from '@/config/contact'
import {
  ChatDotRound,
  Message,
  Phone,
  Location,
  Clock
} from '@element-plus/icons-vue'
</script>

<style scoped>
.footer {
  background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
  color: white;
  padding: 3rem 0 1rem;
  margin-top: auto;
}

.footer-content {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 2rem;
  margin-bottom: 2rem;
}

.footer-section {
  display: flex;
  flex-direction: column;
  gap: 1rem;
}

.footer-logo {
  display: flex;
  align-items: center;
  gap: 10px;
  font-size: 1.5rem;
  font-weight: bold;
}

.logo-img {
  width: 40px;
  height: 40px;
}

.logo-text {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.footer-desc {
  color: #bdc3c7;
  line-height: 1.6;
}

.footer-title {
  font-size: 1.2rem;
  margin-bottom: 1rem;
  color: #ecf0f1;
}

.footer-links {
  list-style: none;
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}

.footer-link {
  color: #bdc3c7;
  text-decoration: none;
  transition: color 0.3s ease;
}

.footer-link:hover {
  color: #667eea;
}

.social-links {
  display: flex;
  gap: 1rem;
}

.social-link {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 40px;
  height: 40px;
  background: rgba(255, 255, 255, 0.1);
  border-radius: 50%;
  color: #bdc3c7;
  text-decoration: none;
  transition: all 0.3s ease;
}

.social-link:hover {
  background: #667eea;
  color: white;
  transform: translateY(-2px);
}

.contact-info {
  display: flex;
  flex-direction: column;
  gap: 0.8rem;
}

.contact-info p {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  color: #bdc3c7;
  margin: 0;
}

.footer-bottom {
  border-top: 1px solid rgba(255, 255, 255, 0.1);
  padding-top: 1rem;
}

.footer-bottom-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-wrap: wrap;
  gap: 1rem;
}

.footer-bottom-links {
  display: flex;
  gap: 2rem;
}

.footer-bottom-link {
  color: #bdc3c7;
  text-decoration: none;
  font-size: 0.9rem;
  transition: color 0.3s ease;
}

.footer-bottom-link:hover {
  color: #667eea;
}

@media (max-width: 768px) {
  .footer-content {
    grid-template-columns: 1fr;
    text-align: center;
  }
  
  .footer-bottom-content {
    flex-direction: column;
    text-align: center;
  }
  
  .footer-bottom-links {
    justify-content: center;
  }
}
</style>