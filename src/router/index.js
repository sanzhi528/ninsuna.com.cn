import { createRouter, createWebHistory } from 'vue-router'
import { useUserStore } from '@/stores/user'

const routes = [
  {
    path: '/',
    name: 'Home',
    component: () => import('@/views/Home.vue'),
    meta: { title: '首页 - 本屯科技' }
  },
  {
    path: '/services',
    name: 'Services',
    component: () => import('@/views/Services.vue'),
    meta: { title: '服务项目 - 本屯科技' }
  },
  {
    path: '/products',
    name: 'Products',
    component: () => import('@/views/Products.vue'),
    meta: { title: '电子产品 - 本屯科技' }
  },
  {
    path: '/consultation',
    name: 'Consultation',
    component: () => import('@/views/Consultation.vue'),
    meta: { title: '科技咨询 - 本屯科技' }
  },
  {
    path: '/contact',
    name: 'Contact',
    component: () => import('@/views/Contact.vue'),
    meta: { title: '联系我们 - 本屯科技' }
  },
  {
    path: '/login',
    name: 'Login',
    component: () => import('@/views/Login.vue'),
    meta: { title: '登录 - 本屯科技' }
  },
  {
    path: '/register',
    name: 'Register',
    component: () => import('@/views/Register.vue'),
    meta: { title: '注册 - 本屯科技' }
  },
  {
    path: '/admin',
    name: 'Admin',
    component: () => import('@/views/Admin.vue'),
    meta: { title: '管理后台 - 本屯科技', requiresAuth: true },
    redirect: '/admin/dashboard',
    children: [
      {
        path: 'dashboard',
        name: 'AdminDashboard',
        component: () => import('@/views/admin/Dashboard.vue'),
        meta: { title: '仪表盘 - 管理后台' }
      },
      {
        path: 'users',
        name: 'AdminUsers',
        component: () => import('@/views/admin/Users.vue'),
        meta: { title: '用户管理 - 管理后台' }
      },
      {
        path: 'user-stats',
        name: 'AdminUserStats',
        component: () => import('@/views/admin/UserStats.vue'),
        meta: { title: '用户统计 - 管理后台' }
      },
      {
        path: 'consultations',
        name: 'AdminConsultations',
        component: () => import('@/views/admin/Consultations.vue'),
        meta: { title: '咨询管理 - 管理后台' }
      },
      {
        path: 'consultation-stats',
        name: 'AdminConsultationStats',
        component: () => import('@/views/admin/ConsultationStats.vue'),
        meta: { title: '咨询统计 - 管理后台' }
      },
      {
        path: 'orders',
        name: 'AdminOrders',
        component: () => import('@/views/admin/Orders.vue'),
        meta: { title: '订单管理 - 管理后台' }
      },
      {
        path: 'order-stats',
        name: 'AdminOrderStats',
        component: () => import('@/views/admin/OrderStats.vue'),
        meta: { title: '订单统计 - 管理后台' }
      },
      {
        path: 'products',
        name: 'AdminProducts',
        component: () => import('@/views/admin/Products.vue'),
        meta: { title: '产品管理 - 管理后台' }
      },
      {
        path: 'settings',
        name: 'AdminSettings',
        component: () => import('@/views/admin/Settings.vue'),
        meta: { title: '系统设置 - 管理后台' }
      }
    ]
  },
  {
    path: '/:pathMatch(.*)*',
    name: 'NotFound',
    component: () => import('@/views/NotFound.vue'),
    meta: { title: '页面未找到 - 本屯科技' }
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes,
  scrollBehavior(to, from, savedPosition) {
    if (savedPosition) {
      return savedPosition
    } else {
      return { top: 0 }
    }
  }
})

// 路由守卫 - 设置页面标题和认证检查
router.beforeEach((to, from, next) => {
  if (to.meta.title) {
    document.title = to.meta.title
  }
  
  // 检查是否需要认证
  if (to.meta.requiresAuth) {
    const userStore = useUserStore()
    if (!userStore.isLoggedIn) {
      next('/login')
      return
    }
  }
  
  next()
})

export default router