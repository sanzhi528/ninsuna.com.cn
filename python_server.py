#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Python静态文件服务器
为科技网站提供静态文件服务
"""

import http.server
import socketserver
import os
import sys
import webbrowser
from datetime import datetime

class TechWebsiteHandler(http.server.SimpleHTTPRequestHandler):
    """自定义HTTP请求处理器"""
    
    def __init__(self, *args, **kwargs):
        # 设置默认目录为当前目录
        super().__init__(*args, directory=os.getcwd(), **kwargs)
    
    def log_message(self, format, *args):
        """自定义日志输出格式"""
        timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        print(f"[{timestamp}] {format % args}")
    
    def end_headers(self):
        """添加CORS头信息"""
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS')
        self.send_header('Access-Control-Allow-Headers', 'Content-Type')
        super().end_headers()
    
    def do_GET(self):
        """处理GET请求"""
        # 如果请求根路径，默认返回index.html
        if self.path == '/':
            self.path = '/index.html'
        
        # 处理Vue.js单页应用的路由
        if self.path.startswith('/src/') or self.path.startswith('/@/'):
            # Vue.js开发模式下的特殊路径，返回404
            self.send_error(404, "Vue.js开发模式需要Vite构建工具")
            return
            
        return super().do_GET()

def start_server(port=8000):
    """启动HTTP服务器"""
    
    # 获取当前目录
    current_dir = os.path.dirname(os.path.abspath(__file__))
    os.chdir(current_dir)
    
    # 检查关键文件是否存在
    required_files = ['index.html', 'built_vue.html', 'simple_vue.html']
    for file in required_files:
        if not os.path.exists(file):
            print(f"⚠️  警告: 文件 {file} 不存在")
    
    print("=" * 60)
    print("🚀 Python静态文件服务器")
    print("=" * 60)
    print(f"📂 项目目录: {current_dir}")
    print(f"🌐 服务器地址: http://localhost:{port}")
    print(f"📄 可用页面:")
    print(f"   • http://localhost:{port}/built_vue.html (完整Vue.js应用)")
    print(f"   • http://localhost:{port}/simple_vue.html (简化版本)")
    print(f"   • http://localhost:{port}/index.html (原始Vue.js项目)")
    print(f"   • http://localhost:{port}/test.html (连接测试)")
    print("=" * 60)
    
    try:
        # 创建TCP服务器
        with socketserver.TCPServer(("", port), TechWebsiteHandler) as httpd:
            print(f"✅ 服务器已启动，监听端口 {port}")
            print("💡 按 Ctrl+C 停止服务器")
            print("=" * 60)
            
            # 禁用自动打开浏览器功能，避免弹出多个窗口
            print(f"🌐 服务器已启动，请手动访问: http://localhost:{port}/complete_vue.html")
            
            # 启动服务器
            httpd.serve_forever()
            
    except KeyboardInterrupt:
        print("\n🛑 服务器已停止")
    except OSError as e:
        if "Address already in use" in str(e):
            print(f"❌ 端口 {port} 已被占用，请尝试其他端口")
            print("💡 可以尝试: python python_server.py 8080")
        else:
            print(f"❌ 服务器启动失败: {e}")
    except Exception as e:
        print(f"❌ 发生错误: {e}")

if __name__ == "__main__":
    # 获取端口参数
    port = 8000
    if len(sys.argv) > 1:
        try:
            port = int(sys.argv[1])
        except ValueError:
            print("❌ 端口号必须是数字")
            sys.exit(1)
    
    # 启动服务器
    start_server(port)