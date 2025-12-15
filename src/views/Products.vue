<template>
  <div class="products">
    <Header />
    
    <!-- 页面标题 -->
    <section class="page-header">
      <div class="container">
        <h1 class="page-title">电子产品</h1>
        <p class="page-subtitle">优质电子产品，满足企业多样化需求</p>
      </div>
    </section>

    <!-- 产品分类 -->
    <section class="product-categories">
      <div class="container">
        <div class="categories-tabs">
          <el-tabs v-model="activeCategory" @tab-click="handleCategoryChange">
            <el-tab-pane label="办公设备" name="office">
              <div class="products-grid">
                <div class="product-card" v-for="product in officeProducts" :key="product.id">
                  <div class="product-image">
                    <img :src="product.image" :alt="product.name" />
                  </div>
                  <div class="product-info">
                    <h3>{{ product.name }}</h3>
                    <p class="product-description">{{ product.description }}</p>
                    <div class="product-price">¥{{ product.price }}</div>
                    <div class="product-actions">
                      <el-button type="primary" @click="handleConsult(product)">咨询购买</el-button>
                    </div>
                  </div>
                </div>
              </div>
            </el-tab-pane>
            
            <el-tab-pane label="网络设备" name="network">
              <div class="products-grid">
                <div class="product-card" v-for="product in networkProducts" :key="product.id">
                  <div class="product-image">
                    <img :src="product.image" :alt="product.name" />
                  </div>
                  <div class="product-info">
                    <h3>{{ product.name }}</h3>
                    <p class="product-description">{{ product.description }}</p>
                    <div class="product-price">¥{{ product.price }}</div>
                    <div class="product-actions">
                      <el-button type="primary" @click="handleConsult(product)">咨询购买</el-button>
                    </div>
                  </div>
                </div>
              </div>
            </el-tab-pane>
            
            <el-tab-pane label="智能硬件" name="smart">
              <div class="products-grid">
                <div class="product-card" v-for="product in smartProducts" :key="product.id">
                  <div class="product-image">
                    <img :src="product.image" :alt="product.name" />
                  </div>
                  <div class="product-info">
                    <h3>{{ product.name }}</h3>
                    <p class="product-description">{{ product.description }}</p>
                    <div class="product-price">¥{{ product.price }}</div>
                    <div class="product-actions">
                      <el-button type="primary" @click="handleConsult(product)">咨询购买</el-button>
                    </div>
                  </div>
                </div>
              </div>
            </el-tab-pane>
          </el-tabs>
        </div>
      </div>
    </section>

    <!-- 产品优势 -->
    <section class="product-advantages">
      <div class="container">
        <h2 class="section-title">产品优势</h2>
        <div class="advantages-grid">
          <div class="advantage-item">
            <el-icon size="48"><Check /></el-icon>
            <h3>正品保障</h3>
            <p>所有产品均为原装正品，提供正规发票和保修服务</p>
          </div>
          <div class="advantage-item">
            <el-icon size="48"><Clock /></el-icon>
            <h3>快速交付</h3>
            <p>深圳本地库存，下单后快速配送，支持上门安装</p>
          </div>
          <div class="advantage-item">
            <el-icon size="48"><Service /></el-icon>
            <h3>专业服务</h3>
            <p>提供专业的技术咨询、安装调试和售后服务</p>
          </div>
          <div class="advantage-item">
            <el-icon size="48"><PriceTag /></el-icon>
            <h3>价格优势</h3>
            <p>厂家直供，价格透明，为企业提供最优采购方案</p>
          </div>
        </div>
      </div>
    </section>

    <!-- 采购流程 -->
    <section class="purchase-process">
      <div class="container">
        <h2 class="section-title">采购流程</h2>
        <div class="process-steps">
          <div class="process-step">
            <div class="step-icon">
              <el-icon><ChatDotRound /></el-icon>
            </div>
            <h3>需求沟通</h3>
            <p>详细了解您的采购需求和使用场景</p>
          </div>
          <div class="process-step">
            <div class="step-icon">
              <el-icon><Document /></el-icon>
            </div>
            <h3>方案报价</h3>
            <p>提供详细的产品方案和报价清单</p>
          </div>
          <div class="process-step">
            <div class="step-icon">
              <el-icon><ShoppingCart /></el-icon>
            </div>
            <h3>下单采购</h3>
            <p>确认方案后签订合同，安排采购</p>
          </div>
          <div class="process-step">
            <div class="step-icon">
              <el-icon><Truck /></el-icon>
            </div>
            <h3>配送安装</h3>
            <p>快速配送并提供专业安装调试服务</p>
          </div>
          <div class="process-step">
            <div class="step-icon">
              <el-icon><Headset /></el-icon>
            </div>
            <h3>售后服务</h3>
            <p>提供完善的售后技术支持和维护</p>
          </div>
        </div>
      </div>
    </section>

    <Footer />
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import Header from '@/components/Layout/Header.vue'
import Footer from '@/components/Layout/Footer.vue'
import {
  Check,
  Clock,
  Service,
  PriceTag,
  ChatDotRound,
  Document,
  ShoppingCart,
  Truck,
  Headset
} from '@element-plus/icons-vue'

const router = useRouter()
const activeCategory = ref('office')

// 模拟产品数据
const officeProducts = ref([
  {
    id: 1,
    name: '激光打印机',
    description: '高速激光打印，支持双面打印，适合办公室使用',
    price: '1999',
    image: '/printer.svg'
  },
  {
    id: 2,
    name: '多功能一体机',
    description: '打印、复印、扫描一体，节省空间，提高效率',
    price: '2999',
    image: '/multifunction.svg'
  },
  {
    id: 3,
    name: '高速扫描仪',
    description: '高分辨率扫描，支持批量文档处理',
    price: '1599',
    image: '/scanner.svg'
  }
])

const networkProducts = ref([
  {
    id: 4,
    name: '企业级路由器',
    description: '高性能路由器，支持多WAN口，适合企业网络',
    price: '899',
    image: '/router.svg'
  },
  {
    id: 5,
    name: '千兆交换机',
    description: '24口千兆交换机，支持VLAN划分',
    price: '1299',
    image: '/switch.svg'
  },
  {
    id: 6,
    name: '无线AP',
    description: '企业级无线接入点，支持无缝漫游',
    price: '699',
    image: '/ap.svg'
  }
])

const smartProducts = ref([
  {
    id: 7,
    name: '智能门禁系统',
    description: '人脸识别门禁，支持远程控制和管理',
    price: '4999',
    image: '/access-control.svg'
  },
  {
    id: 8,
    name: '视频会议系统',
    description: '高清视频会议，支持多方通话和屏幕共享',
    price: '8999',
    image: '/video-conference.svg'
  },
  {
    id: 9,
    name: '智能安防摄像头',
    description: '4K高清摄像头，支持AI识别和云存储',
    price: '799',
    image: '/camera.svg'
  }
])

const handleCategoryChange = (tab) => {
  activeCategory.value = tab.paneName
}

const handleConsult = (product) => {
  router.push({
    path: '/consultation',
    query: { product: product.name }
  })
}
</script>

<style scoped>
.products {
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

.product-categories {
  padding: 5rem 0;
}

.categories-tabs {
  max-width: 1200px;
  margin: 0 auto;
}

.products-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2rem;
  margin-top: 2rem;
}

.product-card {
  background: white;
  border-radius: 15px;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
  overflow: hidden;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.product-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
}

.product-image {
  height: 200px;
  background: #f8f9fa;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 2rem;
}

.product-image img {
  max-width: 100%;
  max-height: 150px;
}

.product-info {
  padding: 1.5rem;
}

.product-info h3 {
  font-size: 1.3rem;
  color: #2c3e50;
  margin-bottom: 0.5rem;
}

.product-description {
  color: #666;
  line-height: 1.5;
  margin-bottom: 1rem;
  min-height: 60px;
}

.product-price {
  font-size: 1.5rem;
  font-weight: bold;
  color: #e74c3c;
  margin-bottom: 1rem;
}

.product-advantages {
  padding: 5rem 0;
  background: #f8f9fa;
}

.advantages-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 2rem;
  max-width: 1000px;
  margin: 0 auto;
}

.advantage-item {
  text-align: center;
  padding: 2rem;
  background: white;
  border-radius: 15px;
  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
}

.advantage-item .el-icon {
  color: #667eea;
  margin-bottom: 1rem;
}

.advantage-item h3 {
  font-size: 1.3rem;
  color: #2c3e50;
  margin-bottom: 1rem;
}

.advantage-item p {
  color: #666;
  line-height: 1.6;
}

.purchase-process {
  padding: 5rem 0;
}

.process-steps {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 2rem;
  max-width: 1200px;
  margin: 0 auto;
}

.process-step {
  text-align: center;
  padding: 2rem;
}

.step-icon {
  width: 80px;
  height: 80px;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0 auto 1rem;
  font-size: 2rem;
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
  .page-title {
    font-size: 2rem;
  }
  
  .products-grid {
    grid-template-columns: 1fr;
  }
  
  .advantages-grid,
  .process-steps {
    grid-template-columns: 1fr;
  }
}
</style>