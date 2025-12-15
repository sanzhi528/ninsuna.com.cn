@echo off
echo ========================================
echo         Node.js 安装指导脚本
echo ========================================
echo.
echo 请按照以下步骤安装Node.js：
echo.
echo 1. 下载Node.js：
echo    访问 https://nodejs.org/
echo    下载LTS版本（绿色按钮）
echo    选择Windows安装包（.msi格式）
echo.
echo 2. 安装步骤：
echo    - 双击下载的.msi文件
echo    - 点击"Next"继续
echo    - 勾选接受协议，点击"Next"
echo    - 保持默认安装目录
echo    - 点击"Next"然后"Install"
echo    - 安装完成后点击"Finish"
echo.
echo 3. 验证安装：
echo    安装完成后，重新打开此脚本或命令提示符
echo    运行以下命令验证：
echo    node --version
echo    npm --version
echo.
echo 4. 安装项目依赖：
echo    npm install
echo.
echo 5. 启动开发服务器：
echo    npm run dev
echo.
echo 6. 访问网站：
echo    浏览器打开 http://localhost:3000
echo.
echo ========================================
echo 当前系统Node.js状态检查：
echo ========================================
echo.
node --version
if %errorlevel% neq 0 (
    echo ❌ Node.js 未安装或环境变量未配置
    echo 请按照上述步骤安装Node.js
) else (
    echo ✅ Node.js 已安装
    npm --version
    if %errorlevel% neq 0 (
        echo ❌ npm 配置有问题
    ) else (
        echo ✅ npm 已安装
    )
)
echo.
echo 按任意键继续...
pause >nul