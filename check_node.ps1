Write-Host "========================================" -ForegroundColor Green
Write-Host "        Node.js 安装状态检查" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

# 检查Node.js是否安装
try {
    $nodeVersion = node --version
    Write-Host "✅ Node.js 已安装 - 版本: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Node.js 未安装" -ForegroundColor Red
}

# 检查npm是否安装
try {
    $npmVersion = npm --version
    Write-Host "✅ npm 已安装 - 版本: $npmVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ npm 未安装" -ForegroundColor Red
}

Write-Host ""
Write-Host "安装步骤:" -ForegroundColor Yellow
Write-Host "1. 访问 https://nodejs.org/"
Write-Host "2. 下载LTS版本（绿色按钮）"
Write-Host "3. 运行安装程序，全部默认设置"
Write-Host "4. 重启计算机"
Write-Host "5. 重新运行此脚本验证安装"
Write-Host ""

Write-Host "项目运行步骤:" -ForegroundColor Yellow
Write-Host "1. npm install     (安装依赖)"
Write-Host "2. npm run dev    (启动服务器)"
Write-Host "3. 访问 http://localhost:3000"
Write-Host ""

Read-Host "按Enter键继续..."