:Head
@echo off

:PythonInstall
echo %path% | findstr Python >nul && goto PythonInstallFinish || goto PythonInstaller

:PythonInstallFinish
@echo 您已安装 Python，正在启动程序...
goto Statup

:PythonInstaller
echo 未查找到 Python，请前去 python.org 下载最新版 Python！
echo 安装时记得勾选 Add Python 3.8 to PATH
start https://www.python.org/downloads/windows/
echo 按任意键退出...
pause >nul
exit

:Statup
@echo 正在检查并安装必要组件
pip freeze > requirements.txt
pip install -r requirements.txt

:Select
cls
@echo Powered by SurelySomeday,Link:https://github.com/SurelySomeday
@echo Bat File by SummonHIM,Link:https://github.com/SummonHIM
@echo 选择一项功能
@echo,
@echo 1.自动签到
@echo 2.自动刷资源
@echo 3.退出
set SelectNum=
set /p SelectNum=[1,2,3]：
if "%SelectNum%" == "1" goto RunautoCheck
if "%SelectNum%" == "2" goto RunautoView
if "%SelectNum%" == "3" exit
@echo,
@echo 该命令 "%SelectNum%" 不存在!
@echo 命令提示:
pause
goto Select

:RunautoCheck
@echo,
@echo 正在启动自动签到...
python autoCheck.py
goto Restart

:RunautoView
@echo,
@echo 正在启动自动刷资源...
python autoView.py
goto Restart

:Restart
cls
@echo 运行结束，是否重启？(Y/n)
set RestartYorN=
set /p RestartYorN=[Y = 是， 任意键 = 退出]：
if "%RestartYorN%" == "y" goto Head
if "%RestartYorN%" == "Y" goto Head
exit
