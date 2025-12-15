@echo off
echo 正在测试localhost:3000连接...
echo.

REM 测试端口连接
echo 1. 检查端口状态...
netstat -an | findstr :3000
if %errorlevel% equ 0 (
    echo ✅ 端口3000正在监听
) else (
    echo ❌ 端口3000未监听
)

echo.
echo 2. 测试网络连接...
ping -n 1 localhost >nul
if %errorlevel% equ 0 (
    echo ✅ localhost网络连接正常
) else (
    echo ❌ localhost网络连接失败
)

echo.
echo 3. 尝试打开浏览器...
start "" "http://localhost:3000"
start "" "http://127.0.0.1:3000"

echo.
echo 4. 服务器状态：
tasklist | findstr node
if %errorlevel% equ 0 (
    echo ✅ Node.js服务器正在运行
) else (
    echo ❌ Node.js服务器未运行
)

echo.
echo 如果仍然无法访问，请尝试：
echo - 使用Edge浏览器访问
echo - 访问 http://127.0.0.1:3000
echo - 检查防火墙设置
echo - 清除浏览器缓存

echo.
pause