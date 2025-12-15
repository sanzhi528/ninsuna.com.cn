#!/bin/bash

# 本屯科技网站部署脚本
# 使用方法: ./deploy.sh [环境]
# 环境参数: dev(开发) | prod(生产) | test(测试)

set -e

# 默认环境为开发环境
ENVIRONMENT=${1:-dev}
PROJECT_NAME="bentiun-tech"
VERSION="1.0.0"

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 日志函数
log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# 检查依赖
check_dependencies() {
    log_info "检查依赖..."
    
    if ! command -v node &> /dev/null; then
        log_error "Node.js 未安装"
        exit 1
    fi
    
    if ! command -v npm &> /dev/null; then
        log_error "npm 未安装"
        exit 1
    fi
    
    log_info "依赖检查通过"
}

# 安装依赖
install_dependencies() {
    log_info "安装项目依赖..."
    npm install
    log_info "依赖安装完成"
}

# 构建项目
build_project() {
    log_info "构建项目..."
    
    case $ENVIRONMENT in
        "dev")
            npm run build:dev
            ;;
        "test")
            npm run build:test
            ;;
        "prod")
            npm run build:prod
            ;;
        *)
            log_error "未知环境: $ENVIRONMENT"
            exit 1
            ;;
    esac
    
    log_info "项目构建完成"
}

# 部署到生产环境
deploy_production() {
    log_info "开始生产环境部署..."
    
    # 检查生产环境配置
    if [ ! -f ".env.production" ]; then
        log_error "生产环境配置文件不存在"
        exit 1
    fi
    
    # 这里可以添加具体的部署逻辑
    # 例如: 上传到服务器、重启服务等
    log_info "生产环境部署完成"
}

# 部署到开发环境
deploy_development() {
    log_info "启动开发服务器..."
    npm run dev
}

# 主函数
main() {
    log_info "开始部署本屯科技网站 (环境: $ENVIRONMENT)"
    
    check_dependencies
    install_dependencies
    
    case $ENVIRONMENT in
        "dev")
            deploy_development
            ;;
        "prod")
            build_project
            deploy_production
            ;;
        "test")
            build_project
            log_info "测试环境构建完成"
            ;;
        *)
            log_error "未知环境: $ENVIRONMENT"
            echo "使用方法: $0 [dev|prod|test]"
            exit 1
            ;;
    esac
    
    log_info "部署完成"
}

# 执行主函数
main "$@"