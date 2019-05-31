@ECHO OFF
cd %~dp0
call ..\build_config.cmd
rfc2217_server_esp.py %SERIAL_PORT%
