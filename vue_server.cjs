const http = require('http');
const fs = require('fs');
const path = require('path');
const url = require('url');

const port = 3000;

// MIME类型映射
const mimeTypes = {
    '.html': 'text/html',
    '.js': 'application/javascript',
    '.css': 'text/css',
    '.json': 'application/json',
    '.png': 'image/png',
    '.jpg': 'image/jpeg',
    '.gif': 'image/gif',
    '.svg': 'image/svg+xml',
    '.ico': 'image/x-icon'
};

const server = http.createServer((req, res) => {
    const parsedUrl = url.parse(req.url);
    let pathname = parsedUrl.pathname;
    
    // 默认首页
    if (pathname === '/') {
        pathname = '/index.html';
    }
    
    const filePath = path.join(__dirname, pathname);
    const extname = path.extname(filePath).toLowerCase();
    const contentType = mimeTypes[extname] || 'application/octet-stream';
    
    console.log(`请求: ${pathname} -> ${filePath}`);
    
    // 检查文件是否存在
    fs.access(filePath, fs.constants.F_OK, (err) => {
        if (err) {
            // 文件不存在，返回404或重定向到index.html（SPA路由）
            if (extname === '') {
                // 可能是Vue路由，返回index.html
                serveFile(path.join(__dirname, 'index.html'), 'text/html', res);
            } else {
                res.writeHead(404, { 'Content-Type': 'text/html' });
                res.end(`
                    <html>
                        <head><title>404 - 文件未找到</title></head>
                        <body>
                            <h1>404 - 文件未找到</h1>
                            <p>请求的文件: ${pathname}</p>
                            <p>完整路径: ${filePath}</p>
                            <p>服务器正在运行，但无法找到请求的资源。</p>
                        </body>
                    </html>
                `);
            }
        } else {
            serveFile(filePath, contentType, res);
        }
    });
});

function serveFile(filePath, contentType, res) {
    fs.readFile(filePath, (error, content) => {
        if (error) {
            res.writeHead(500);
            res.end('服务器错误: ' + error.code);
        } else {
            res.writeHead(200, { 
                'Content-Type': contentType,
                'Access-Control-Allow-Origin': '*',
                'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE',
                'Access-Control-Allow-Headers': 'Content-Type' 
            });
            res.end(content, 'utf-8');
        }
    });
}

server.listen(port, () => {
    console.log(`🚀 Vue.js服务器运行在 http://localhost:${port}`);
    console.log(`📂 项目目录: ${__dirname}`);
    console.log(`📄 首页文件: ${path.join(__dirname, 'index.html')}`);
    console.log(`💡 按 Ctrl+C 停止服务器`);
    console.log(`\n⚠️ 注意: 这是一个简化服务器，Vue.js应用可能需要Vite构建工具才能完全正常工作`);
});