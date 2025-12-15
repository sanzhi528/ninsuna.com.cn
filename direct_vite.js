// 直接运行Vite的简化版本
const { spawn } = require('child_process');
const fs = require('fs');
const path = require('path');

console.log('🚀 尝试直接运行Vite开发服务器...');

// 检查node_modules是否存在
const nodeModulesPath = path.join(__dirname, 'node_modules');
const viteBinPath = path.join(nodeModulesPath, '.bin', 'vite');

if (fs.existsSync(viteBinPath)) {
    console.log('✅ 找到已安装的Vite');
    
    const viteProcess = spawn('node', [viteBinPath], {
        cwd: __dirname,
        stdio: 'inherit',
        shell: true
    });
    
    viteProcess.on('close', (code) => {
        console.log(`Vite进程退出，代码: ${code}`);
    });
    
} else {
    console.log('❌ 未找到Vite，尝试使用npx...');
    
    // 尝试使用npx运行vite
    const npxProcess = spawn('npx', ['vite'], {
        cwd: __dirname,
        stdio: 'inherit',
        shell: true
    });
    
    npxProcess.on('close', (code) => {
        console.log(`npx进程退出，代码: ${code}`);
    });
}