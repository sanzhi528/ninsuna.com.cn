import { defineStore } from 'pinia'
import { ref, computed } from 'vue'

export const useUserStore = defineStore('user', () => {
  // 状态
  const userInfo = ref(null)
  const token = ref(localStorage.getItem('token') || '')
  
  // 计算属性
  const isLoggedIn = computed(() => !!token.value && !!userInfo.value)
  
  // 方法
  const login = async (loginData) => {
    try {
      // 模拟登录API调用
      const response = await new Promise((resolve) => {
        setTimeout(() => {
          resolve({
            success: true,
            data: {
              token: 'mock_token_' + Date.now(),
              user: {
                id: 1,
                username: loginData.username,
                email: loginData.username + '@bentiun.com',
                avatar: '/avatar-default.png',
                role: 'user'
              }
            }
          })
        }, 1000)
      })
      
      if (response.success) {
        token.value = response.data.token
        userInfo.value = response.data.user
        localStorage.setItem('token', token.value)
        localStorage.setItem('userInfo', JSON.stringify(userInfo.value))
        return { success: true }
      }
    } catch (error) {
      console.error('登录失败:', error)
      return { success: false, message: '登录失败，请稍后重试' }
    }
  }
  
  const register = async (registerData) => {
    try {
      // 模拟注册API调用
      const response = await new Promise((resolve) => {
        setTimeout(() => {
          resolve({
            success: true,
            data: {
              message: '注册成功，请登录'
            }
          })
        }, 1000)
      })
      
      return response
    } catch (error) {
      console.error('注册失败:', error)
      return { success: false, message: '注册失败，请稍后重试' }
    }
  }
  
  const logout = () => {
    token.value = ''
    userInfo.value = null
    localStorage.removeItem('token')
    localStorage.removeItem('userInfo')
  }
  
  const checkAuth = () => {
    const savedToken = localStorage.getItem('token')
    const savedUserInfo = localStorage.getItem('userInfo')
    
    if (savedToken && savedUserInfo) {
      token.value = savedToken
      userInfo.value = JSON.parse(savedUserInfo)
    }
  }
  
  // 初始化时检查认证状态
  checkAuth()
  
  return {
    userInfo,
    token,
    isLoggedIn,
    login,
    register,
    logout,
    checkAuth
  }
})