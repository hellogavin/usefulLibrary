@ ECHO OFF
SET PROG=һ�����IE�����ϵͳ���ϰ棨XP/WIN7/VISTA��
COLOR 2F
@ ECHO.
@ ECHO.                               ˵                  ��
@ ECHO.
@ ECHO --------------------------------------------------------------------------------
@ ECHO.
@ ECHO.     ����һ����������򣬹��������Ĭ��IE����Ŀ¼�µ�IE��ʱ�����ļ���
@ ECHO.     ʹ�ñ����򣬿��������������BiLiBiLi�����������жϴ���������
@ ECHO.     ���޼��ز������������ͬʱҲ�ܷ������ڿ��Կ������IE����=w=
@ ECHO.     Ҫִ�У��밴�����������һ��
@ ECHO.                                                           by   pptp1
@ ECHO.                                                 2010��10��24�� ����
@ ECHO.                                             2010��10��25�� ��������
@ ECHO --------------------------------------------------------------------------------
TITLE %PROG%
PAUSE
CLS
@ ECHO.
@ ECHO.                    ����       ��ѡ�����Ĳ���ϵͳ      ����
@ ECHO.
@ ECHO.
ECHO                    �U             [1] WINDOWS XP                 �U
ECHO                    �U             [2] WINDOWS 7 / VISTA          �U
@ ECHO.
@ ECHO.
SET /P CHOICE=       ��ѡ���㵱ǰ�Ĳ���ϵͳ�汾 (1��2) ��Ȼ�󰴻س���ִ��IE��������
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
echo ����IE����ɹ�=w=
echo. & pause