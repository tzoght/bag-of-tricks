@echo off
set BASEDIR=%~dp0..
set JRE_HOME=%BASEDIR%\jre
set JAVA_HOME=%BASEDIR%\jre
set PATH=%JAVA_HOME%\bin;%PATH%
set LOCALCLASSPATH=
for %%i in ("%BASEDIR%\lib\*.jar") do call "%BASEDIR%\bin\lcp.bat" %%i
set CLASSPATH="%USERPROFILE%";"%BASEDIR%\bin";%LOCALCLASSPATH%;"%BASEDIR%\classes.jar"
set JAVA_VERSION=1.7.0_15-b03

REM the option -version: protects against java 6 being installed on the system already
REM set -DreadOnlyJsemp=true to disable SEMP schema validation in SolAdmin
start javaw -version:%JAVA_VERSION% -Xms64m -XX:MaxPermSize=256m -classpath %CLASSPATH% -Duser.language=en -Duser.region=US -Dapp.home="%BASEDIR%" -DhideDlgExStack=true -DreadOnlyJsemp=false -DinitRouterIp= -DinitRouterHost= -DinitRouterPort= com.solacesystems.solmgmt.framework.Main com.solacesystems.solmgmt.apps.soladmincraft.SoladminCraftBootFactory
