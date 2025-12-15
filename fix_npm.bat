@echo off
echo ========================================
echo            npm环境修复工具
echo ========================================
echo.

echo 1. 检查当前Node.js和npm版本
node --version
npm --version
echo.

echo 2. 清理npm缓存
npm cache clean --force
echo.

echo 3. 重新安装npm到兼容版本
npm install -g npm@8.19.4
echo.

echo 4. 验证新版本
npm --version
echo.

echo 5. 安装项目依赖
npm install
echo.

echo 6. 启动Vite开发服务器
npm run dev
echo.

echo ========================================
echo           修复完成！
echo ========================================
pause