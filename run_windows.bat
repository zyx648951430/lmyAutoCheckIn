:Head
@echo off

:PythonInstall
echo %path% | findstr Python >nul && goto PythonInstallFinish || goto PythonInstaller

:PythonInstallFinish
@echo ���Ѱ�װ Python��������������...
goto Statup

:PythonInstaller
echo δ���ҵ� Python����ǰȥ python.org �������°� Python��
echo ��װʱ�ǵù�ѡ Add Python 3.8 to PATH
start https://www.python.org/downloads/windows/
echo ��������˳�...
pause >nul
exit

:Statup
@echo ���ڼ�鲢��װ��Ҫ���
pip freeze > requirements.txt
pip install -r requirements.txt

:Select
cls
@echo Powered by SurelySomeday,Link:https://github.com/SurelySomeday
@echo Bat File by SummonHIM,Link:https://github.com/SummonHIM
@echo ѡ��һ���
@echo,
@echo 1.�Զ�ǩ��
@echo 2.�Զ�ˢ��Դ
@echo 3.�˳�
set SelectNum=
set /p SelectNum=[1,2,3]��
if "%SelectNum%" == "1" goto RunautoCheck
if "%SelectNum%" == "2" goto RunautoView
if "%SelectNum%" == "3" exit
@echo,
@echo ������ "%SelectNum%" ������!
@echo ������ʾ:
pause
goto Select

:RunautoCheck
@echo,
@echo ���������Զ�ǩ��...
python autoCheck.py
goto Restart

:RunautoView
@echo,
@echo ���������Զ�ˢ��Դ...
python autoView.py
goto Restart

:Restart
cls
@echo ���н������Ƿ�������(Y/n)
set RestartYorN=
set /p RestartYorN=[Y = �ǣ� ����� = �˳�]��
if "%RestartYorN%" == "y" goto Head
if "%RestartYorN%" == "Y" goto Head
exit