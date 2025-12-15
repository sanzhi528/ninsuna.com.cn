@echo off
echo 正在为奔腾科技网站配置本地域名绑定...
echo.

REM 备份原始hosts文件
if exist %windir%\System32\drivers\etc\hosts.bak (
    echo 已存在hosts备份文件，跳过备份
) else (
    copy %windir%\System32\drivers\etc\hosts %windir%\System32\drivers\etc\hosts.bak >nul 2>&1
    echo 已备份原始hosts文件
)

REM 检查是否已存在相关配置
findstr "www.bentiun.com" %windir%\System32\drivers\etc\hosts >nul
if %errorlevel% equ 0 (
    echo 域名配置已存在，跳过添加
    goto :show_info
)

REM 以管理员权限添加域名配置
echo 需要管理员权限来修改hosts文件...
echo.

REM 创建临时文件
echo 127.0.0.1 www.bentiun.com > temp_hosts.txt
echo 127.0.0.1 www.bentiun.com.cn >> temp_hosts.txt
echo 127.0.0.1 www.bentiun.cn >> temp_hosts.txt
echo # 奔腾科技本地测试域名配置 >> temp_hosts.txt
echo. >> temp_hosts.txt

REM 合并到hosts文件
type temp_hosts.txt >> %windir%\System32\drivers\etc\hosts

echo 域名配置已添加成功！

:show_info
echo.
echo ========================================
echo 奔腾科技网站本地域名绑定完成
echo ========================================
echo.
echo 现在您可以通过以下域名访问网站：
echo.
echo   http://www.bentiun.com:8081/index.html
echo   http://www.bentiun.com.cn:8081/index.html  
echo   http://www.bentiun.cn:8081/index.html
echo.
echo 或者直接访问：
echo   http://localhost:8081/index.html
echo.
echo 测试方法：
echo 1. 打开浏览器
echo 2. 输入上述任意一个网址
echo 3. 查看网站是否正常显示
echo.
echo 如果遇到权限问题，请以管理员身份运行此脚本
echo.

REM 清理临时文件
del temp_hosts.txt >nul 2>&1

pause