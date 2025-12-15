# 本屯科技网站部署指南

## 项目概述

本屯科技企业展示网站是一个基于Vue 3 + Vite构建的单页应用，提供科技信息咨询、软件开发、电子产品销售等服务展示。

## 环境要求

- Node.js 16.0+ 
- npm 8.0+
- 现代浏览器支持

## 项目结构

```
bentiun-tech-website/
├── src/                 # 源代码目录
├── public/              # 静态资源目录
├── dist/                # 构建输出目录
├── vite.config.js       # Vite配置文件
├── package.json         # 项目依赖配置
├── deploy.sh            # 部署脚本
└── README.md            # 项目说明文档
```

## 部署环境

### 1. 开发环境 (Development)
- 用途：本地开发调试
- 域名：localhost:3000
- 特点：热重载、调试信息、开发工具

### 2. 测试环境 (Test) 
- 用途：功能测试和集成测试
- 域名：test.bentiun.com
- 特点：模拟生产环境、测试数据

### 3. 生产环境 (Production)
- 用途：正式对外服务
- 域名：www.bentiun.com / www.bentiun.com.cn / www.bentiun.cn
- 特点：优化构建、CDN加速、监控告警

## 部署步骤

### 方式一：使用部署脚本（推荐）

```bash
# 开发环境部署
npm run deploy:dev

# 测试环境部署  
npm run deploy:test

# 生产环境部署
npm run deploy:prod
```

### 方式二：手动部署

1. **安装依赖**
```bash
npm install
```

2. **构建项目**
```bash
# 开发环境构建
npm run build:dev

# 测试环境构建
npm run build:test

# 生产环境构建
npm run build:prod
```

3. **预览构建结果**
```bash
npm run preview
```

4. **部署到服务器**
将 `dist` 目录下的文件上传到Web服务器（如Nginx、Apache）的网站根目录。

## 服务器配置

### Nginx配置示例

```nginx
server {
    listen 80;
    server_name www.bentiun.com www.bentiun.com.cn www.bentiun.cn;
    
    # 启用gzip压缩
    gzip on;
    gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;
    
    # 静态资源缓存
    location /assets/ {
        expires 1y;
        add_header Cache-Control "public, immutable";
    }
    
    # 主页面配置
    location / {
        root /var/www/bentiun-tech/dist;
        index index.html;
        try_files $uri $uri/ /index.html;
    }
    
    # API代理（如果有后端服务）
    location /api/ {
        proxy_pass http://backend-server:8080/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```

### Apache配置示例

```apache
<VirtualHost *:80>
    ServerName www.bentiun.com
    ServerAlias www.bentiun.com.cn www.bentiun.cn
    
    DocumentRoot /var/www/bentiun-tech/dist
    
    # 启用重写模块
    RewriteEngine On
    
    # 处理前端路由
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteRule . /index.html [L]
    
    # 静态资源缓存
    <FilesMatch "\.(css|js|png|jpg|jpeg|gif|ico|svg)$">
        ExpiresActive On
        ExpiresDefault "access plus 1 year"
    </FilesMatch>
</VirtualHost>
```

## 域名配置

### 主要域名
- **主域名**: www.bentiun.com
- **备用域名**: www.bentiun.com.cn
- **短域名**: www.bentiun.cn

### DNS配置

```
# A记录配置
www.bentiun.com     A     服务器IP地址
www.bentiun.com.cn  A     服务器IP地址  
www.bentiun.cn      A     服务器IP地址

# CNAME配置（如果使用CDN）
www.bentiun.com     CNAME     cdn.bentiun.com
```

## SSL证书配置

建议为所有域名配置HTTPS证书：

```bash
# 使用Let's Encrypt获取免费证书
certbot --nginx -d www.bentiun.com -d www.bentiun.com.cn -d www.bentiun.cn
```

## 监控和日志

### 性能监控
- 使用Google Analytics进行用户行为分析
- 配置性能监控工具（如Lighthouse CI）
- 设置错误监控（如Sentry）

### 日志配置
```javascript
// 生产环境日志配置
if (import.meta.env.PROD) {
  console.log = function() {}; // 禁用console.log
}
```

## 备份策略

### 代码备份
- 使用Git进行版本控制
- 定期推送到远程仓库

### 数据备份
- 数据库定期备份
- 静态资源备份
- 配置文件备份

## 故障恢复

### 快速回滚
```bash
# 回滚到上一个版本
git checkout previous-version-tag
npm run build:prod
# 重新部署
```

### 紧急处理
1. 检查服务器状态
2. 查看错误日志
3. 临时切换到维护页面
4. 联系技术支持

## 联系方式

- **技术支持**: tech@bentiun.com
- **紧急联系**: emergency@bentiun.com
- **联系电话**: +86-0755-85216839

## 更新日志

### v1.0.0 (2024-01-01)
- 初始版本发布
- 基础功能实现
- 响应式设计完成

---

*最后更新: 2024-01-01*