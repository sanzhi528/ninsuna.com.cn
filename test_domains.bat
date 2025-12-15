@echo off
echo 奔腾科技网站域名测试工具
echo ================================
echo.

echo 正在测试本地服务器状态...
curl -s -I http://localhost:8081/index.html >nul 2>&1
if %errorlevel% neq 0 (
    echo 错误：本地服务器未运行！
    echo 请先运行：python -m http.server 8081
    pause
    exit /b 1
)

echo 本地服务器运行正常！
echo.

echo 测试域名解析...
ping -n 1 www.bentiun.com >nul 2>&1
if %errorlevel% equ 0 (
    echo ✓ www.bentiun.com 解析正常
) else (
    echo ✗ www.bentiun.com 解析失败（需要配置hosts）
)

ping -n 1 www.bentiun.com.cn >nul 2>&1
if %errorlevel% equ 0 (
    echo ✓ www.bentiun.com.cn 解析正常
) else (
    echo ✗ www.bentiun.com.cn 解析失败（需要配置hosts）
)

ping -n 1 www.bentiun.cn >nul 2>&1
if %errorlevel% equ 0 (
    echo ✓ www.bentiun.cn 解析正常
) else (
    echo ✗ www.bentiun.cn 解析失败（需要配置hosts）
)

echo.
echo 可用的访问方式：
echo.
echo 1. 直接访问（无需配置）：
echo    http://localhost:8081/index.html
echo.
echo 2. 域名访问（需要配置hosts）：
echo    http://www.bentiun.com:8081/index.html
echo    http://www.bentiun.com.cn:8081/index.html
echo    http://www.bentiun.cn:8081/index.html
echo.

set /p choice="请选择要测试的网址（输入1或2）："

if "%choice%"=="1" (
    start http://localhost:8081/index.html
) else if "%choice%"=="2" (
    echo 正在打开域名测试页面...
    start http://www.bentiun.com:8081/index.html
    timeout /t 2 >nul
    start http://www.bentiun.com.cn:8081/index.html
    timeout /t 2 >nul
    start http://www.bentiun.cn:8081/index.html
) else (
    echo 无效选择
)

echo.
echo 测试完成！
pause