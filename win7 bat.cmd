mode con cols=40 lines=20
title win7终极批处理
@echo off
color 3f 
:main
cls
echo.  	     
echo        ┌──────────┐
echo      win7  终极批处理  
echo        └──────────┘
echo. 
echo      1 - 清理win7系统垃圾
echo      2 - 修复打开图片缓慢
echo      3 - 重启explorer进程
echo      4 - 定时关机/取消关机
echo      5 - 清除任务栏历史图标
echo      6 - 去掉快捷方式小箭头
echo      7 - 恢复快捷方式小箭头
echo      8 - 备份/优化系统服务
echo      9 - 清除图片位置冗余文件夹
echo      0 - 退出 
echo.
echo      ※直接回车可查看说明文档※
echo.
set choice=
set /p choice=请输入[序号+回车]:
if /i '%choice%'=='1' goto main1
if /i '%choice%'=='2' goto main2
if /i '%choice%'=='3' goto main3
if /i '%choice%'=='4' goto main4
if /i '%choice%'=='5' goto main5
if /i '%choice%'=='6' goto main6
if /i '%choice%'=='7' goto main7
if /i '%choice%'=='8' goto main8
if /i '%choice%'=='9' goto main9
if /i '%choice%'=='0' goto end
cls
echo   您好!感谢使用[win7终级批处理].本工具
echo 默认win7系统安装在C盘下.如果win7非安装
echo 在C盘下.部分功能无效.
echo.
echo 本工具可以常规清理系统垃圾.修复因用户进
echo 行过校准颜色而使打开图片缓慢.清除任务栏
echo 托盘里的历史图标.清除桌面背景\图片位置
echo 里用户自定义的文件夹.去除快捷方式小箭头
echo 恢复小箭头(无法将图标附到任务栏和开始
echo 菜单等问题也可用此修复).备份及优化系统
echo 服务.批处理中有些功能要修改注册表,如有
echo 软件拦截,请放行.
echo.
echo 所有功能均在作者机子上测试通过,但由于不
echo 定因素,不能保证所有用户都能正常使用！如
echo 果出现问题,请恕作者不负任何责任!
echo.
echo. 
pause
goto main

:end
exit

:main1
cls
mode con cols=80 lines=20
echo 正在清理系统盘中的垃圾文件...
del /f /s /q %systemdrive%\*.log 2>nul
del /f /s /q %systemdrive%\*.bak 2>nul 
del /f /s /q %systemdrive%\*.chk 2>nul
del /f /s /q %systemdrive%\*.tmp 2>nul
del /f /s /q %systemdrive%\*._mp 2>nul
del /f /s /q %systemdrive%\*.ftg 2>nul
del /f /s /q %systemdrive%\*.gid 2>nul
del /f /s /q %systemdrive%\*.pnf 2>nul
del /f /s /q %systemdrive%\thumbs.db 2>nul
rd /s /q %windir%\temp md %windir%\temp 2>nul
del /f /s /q %systemdrive%\recycled\*.* 2>nul
del /f /s /q %windir%\prefetch\*.* 2>nul
del /f /q %userprofile%\AppData\Roaming\Microsoft\Windows\Cookies\*.* 2>nul
del /f /s /q "%userprofile%\AppData\Local\Microsoft\Windows\Temporary Internet Files\*.*" 2>nul
cls
d:
cd\
echo 正在清理其他盘中的垃圾文件...
del /f /s /q *.log 2>nul
del /f /s /q *.tmp 2>nul
del /f /s /q thumbs.db 2>nul
e:
cd\
del /f /s /q *.log 2>nul
del /f /s /q *.tmp 2>nul
del /f /s /q thumbs.db 2>nul
f:
cd\
del /f /s /q *.log 2>nul
del /f /s /q *.tmp 2>nul
del /f /s /q thumbs.db 2>nul
g:
cd\
del /f /s /q *.log 2>nul
del /f /s /q *.tmp 2>nul
del /f /s /q thumbs.db 2>nul
goto main

:main2
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo           正在修复,请稍等... 
echo.           
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
del %windir%\system32\spool\drivers\color\CalibratedDisplayProfile-?.icc >nul 2>nul 
ping localhost -n 3 >nul 2>nul
goto main

:main3
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo   explorer进程重启中,请勿关闭程序...
echo.           
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
taskkill /f /im Explorer.exe >nul 2>nul
ping localhost -n 3 >nul 2>nul
start "explorer.exe" "%windir%\explorer.exe"
goto main

:main4
cls
set hour=%time:~0,2%
set min=%time:~3,2%
echo  ┌————————————————┐ 
echo  丨                                丨
echo  丨    %date% %hour%时%min%分    丨
echo  丨                                丨
echo  └———————————————─┘
echo.
echo.
echo.
echo.
echo      ===========================
echo            1 - 定时关机
echo            2 - 取消关机
echo            0 - 退出
echo      ===========================
echo.
echo.
echo      ※直接回车可查看说明文档※       
echo.        
echo.
set ver0=
set /p ver0=请输入[序号+回车]:
if /i "%ver0%"=="1" goto powerdown
if /i "%ver0%"=="2" goto giveup
if /i "%ver0%"=="0" goto exitd
cls
echo.
echo.
echo   如果要在21:30关机,输入格式:
echo.   
echo   请输入时:21
echo   请输入分:30
echo.
echo.
echo   请正确输入时间,否则可能不能成功执行!
echo. 
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
pause
goto main4
:exitd
goto main
:powerdown
cls
echo  ┌————————————————┐ 
echo  丨                                丨
echo  丨    %date% %hour%时%min%分    丨
echo  丨                                丨
echo  └———————————————─┘
echo.
echo.
echo.
echo [24时制]
set /p time1=请输入时: 
set /p time2=请输入分:
echo.
if /i "%time1%"=="" goto powerdown
if /i "%time2%"=="" goto powerdown
at %time1%:%time2% shutdown -s -t 0 >nul
echo.
echo 您的电脑将在%time1%:%time2%时刻关闭
echo.
echo 在关机之前,您可以随时取消关机计划
echo.
echo.
echo.
pause
goto main
:giveup
cls
at /del /yes
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo    关机计划已经取消,按任意键返回...
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo. 
pause >nul
goto main

:main5
reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v IconStreams /f
reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v PastIconsStream /f
goto main3

:main6
copy Empty.ico %systemdrive%\windows >nul
@echo Windows Registry Editor Version 5.00>>D:\tmp.reg
@echo [HKEY_CLASSES_ROOT\piffile]>>D:\tmp.reg
@echo "IsShortcut"="">>D:\tmp.reg 
@echo [HKEY_CLASSES_ROOT\lnkfile]>>D:\tmp.reg
@echo "IsShortcut"="">>D:\tmp.reg
@echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons]>>D:\tmp.reg
@echo "29"="C:\\Windows\\Empty.ico,0">>D:\tmp.reg
regedit/s D:\tmp.reg
del D:\tmp.reg
goto main3

:main7
@echo Windows Registry Editor Version 5.00>>D:\tmp.reg
@echo [HKEY_CLASSES_ROOT\piffile]>>D:\tmp.reg
@echo "IsShortcut"="">>D:\tmp.reg 
@echo [HKEY_CLASSES_ROOT\lnkfile]>>D:\tmp.reg
@echo "IsShortcut"="">>D:\tmp.reg
@echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons]>>D:\tmp.reg
regedit/s D:\tmp.reg
del D:\tmp.reg
del %windir%\Empty.ico
goto main3

:main8
cls
echo.
echo.
echo.
echo      ===========================
echo            1 - 备份服务
echo. 
echo            2 - 优化服务
echo. 
echo            0 - 退出
echo      =========================== 
echo.
echo.
echo.
echo        建议在优化之前先做备份
echo.
echo.
echo.
echo.
echo.
set ver1=
set /p ver1=请输入[序号+回车]:
if /i "%ver1%"=="1" goto bfser
if /i "%ver1%"=="2" goto yhser
if /i "%ver1%"=="0" goto exitser
:exitser
goto main
:bfser
cls
echo.
echo 正在备份服务,如果优化出了问题您可以及时
echo 恢复.备份会生成一个以当前时间命名的批处
echo 理文件,恢复时只要双击即可.
rem  get current date and time
for /f "tokens=1, 2, 3, 4 delims=-/. " %%j in ('Date /T') do set FILENAME=srv_%%j_%%k_%%l_%%m
for /f "tokens=1, 2 delims=: " %%j in ('TIME /T') do set FILENAME=%FILENAME%_%%j_%%k.bat
rem get all service name
sc query type= service state= all| findstr /r /C:"SERVICE_NAME:" >tmpsrv.txt
echo.
echo.
echo.
echo         正在备份,请稍等...
echo.
echo.
echo.
echo.
echo.
echo.
echo.
rem save service start state into batch file 
echo @echo Restore The Service Start State Saved At %TIME% %DATE% >"%FILENAME%" 
echo @pause >>"%FILENAME%"
for /f "tokens=2 delims=:" %%j in (tmpsrv.txt) do @( sc qc %%j |findstr  START_TYPE >tmpstype.txt &&  for /f "tokens=4 delims=:_ " %%s in ( tmpstype.txt) do @echo sc config  %%j start= %%s >>"%FILENAME%")
echo @pause >>"%FILENAME%"
del tmpsrv.txt
del tmpstype.txt
echo 服务已备份到:
echo     %FILENAME%
echo.
echo 按任意键返回...&pause >nul
goto main8
:yhser
cls
sc config   AxInstSV= demand
sc config   ALG start= demand
sc config   AppMgmt start= demand
sc config   AudioEndpointBuilder start= auto
sc config   Audiosrv start= auto
sc config   BFE start= auto
sc config   BITS start= demand
sc config   Browser start= demand
sc config   CertPropSvc start= demand
sc config   clr_optimization_v2.0.50727_32 start= demand
sc config   COMSysApp start= demand
sc config   CryptSvc start= auto
sc config   DcomLaunch start= auto
sc config   Dhcp start= auto
sc config   Dnscache start= auto
sc config   dot3svc start= demand
sc config   EapHost start= demand
sc config   EventSystem start= auto
sc config   fdPHost start= demand
sc config   FDResPub start= demand
sc config   FontCache3.0.0.0 start= demand
sc config   gpsvc start= auto
sc config   hidserv start= demand
sc config   hkmsvc start= demand
sc config   idsvc start= demand
sc config   IKEEXT start= demand
sc config   IPBusEnum start= demand
sc config   KeyIso start= demand
sc config   LanmanServer start= auto
sc config   LanmanWorkstation start= auto
sc config   lltdsvc start= demand
sc config   lmhosts start= auto
sc config   MMCSS start= auto
sc config   MpsSvc start= auto
sc config   msiserver start= demand
sc config   napagent start= demand
sc config   Netlogon start= demand
sc config   Netman start= demand
sc config   netprofm start= auto
sc config   NetTcpPortSharing start= disabled
sc config   NlaSvc start= auto
sc config   nsi start= auto
sc config   PlugPlay start= auto
sc config   ProfSvc start= auto
sc config   RasAuto start= demand
sc config   RasMan start= demand
sc config   RemoteAccess start= disabled
sc config   RpcLocator start= demand
sc config   RpcSs start= auto
sc config   SamSs start= auto
sc config   SCardSvr start= demand
sc config   SCPolicySvc start= demand
sc config   SENS start= auto
sc config   SharedAccess start= disabled
sc config   SNMPTRAP start= demand
sc config   SSDPSRV start= demand
sc config   SstpSvc start= demand
sc config   SysMain start= auto
sc config   TapiSrv start= demand
sc config   TBS start= demand
sc config   Themes start= auto
sc config   THREADORDER start= demand
sc config   TrustedInstaller start= demand
sc config   upnphost start= demand
sc config   UxSms start= auto
sc config   vds start= demand
sc config   W32Time start= demand
sc config   wcncsvc start= demand
sc config   WcsPlugInService start= demand
sc config   WinHttpAutoProxySvc start= demand
sc config   Winmgmt start= auto
sc config   Wlansvc start= demand
sc config   wmiApSrv start= demand
sc config   WMPNetworkSvc start= demand
sc config   wscsvc start= auto
sc config   wuauserv start= demand
sc config   wudfsvc start= demand
sc config   WinDefend start= demand
goto main8

:main9
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo           正在清理,请稍等...
echo.           
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo Windows Registry Editor Version 5.00>>d:\tmp.reg
echo [-HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers\Images]>>d:\tmp.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers\Images]>>d:\tmp.reg
regedit /s d:\tmp.reg
del d:\tmp.reg
ping localhost -n 3 >nul 2>nul
goto main