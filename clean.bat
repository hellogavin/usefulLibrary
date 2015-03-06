@ ECHO OFF
SET PROG=一键清除IE缓存多系统整合版（XP/WIN7/VISTA）
COLOR 2F
@ ECHO.
@ ECHO.                               说                  明
@ ECHO.
@ ECHO --------------------------------------------------------------------------------
@ ECHO.
@ ECHO.     这是一个批处理程序，功能是清除默认IE缓存目录下的IE临时缓存文件。
@ ECHO.     使用本程序，可以清除由于载入BiLiBiLi播放器发生中断错误而引起的
@ ECHO.     无限加载播放器的情况，同时也能方便用于可以快速清除IE缓存=w=
@ ECHO.     要执行，请按任意键进入下一步
@ ECHO.                                                           by   pptp1
@ ECHO.                                                 2010年10月24日 制作
@ ECHO.                                             2010年10月25日 订正参数
@ ECHO --------------------------------------------------------------------------------
TITLE %PROG%
PAUSE
CLS
@ ECHO.
@ ECHO.                    ☆☆☆       请选择您的操作系统      ☆☆☆
@ ECHO.
@ ECHO.
ECHO                    ║             [1] WINDOWS XP                 ║
ECHO                    ║             [2] WINDOWS 7 / VISTA          ║
@ ECHO.
@ ECHO.
SET /P CHOICE=       请选择你当前的操作系统版本 (1或2) ，然后按回车键执行IE缓存清理：
IF /I '%CHOICE%'=='1' GOTO WINXP
IF /I '%CHOICE%'=='2' GOTO WIN7
:WINXP
del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*"
CLS
GOTO SUCCESS
:WIN7
del /f /s /q "%userprofile%\AppData\Local\Microsoft\Windows\Temporary Internet Files\*.*"
CLS
GOTO SUCCESS
:SUCCESS
echo 清理IE缓存成功=w=
echo. & pause