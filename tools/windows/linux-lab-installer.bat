@echo off

set GIT_BASH="C:/Program Files (x86)/Git/git-bash.exe"
set CLOUD_LAB="https://gitee.com/tinylab/cloud-lab.git"
set WORK_BRANCH=next

echo .................................................................................................
echo ........................... Linux Lab for Windows Installer .....................................
echo .................................................................................................
echo .......... Copyright © 2016-2022 Wu Zhangjin, falcon@tinylab.org, All Right Reserved. ...........
echo .................................................................................................

echo .
echo .Note: Please don't run me in the cloud-lab source code, this is only for the first fresh install
echo .      If you have downloaded cloud-lab, please open git-bash.exe and run those commands instead:
echo .
echo .      $ cd /path/to/cloud-lab
echo .      $ tools/docker/run
echo .
echo .==== STOP by input 'n', Press any key to CONTINUE.
echo .

set /p answer=Yes/No? 
if /i "%answer:~,1%" EQU "n" exit /b

echo .
echo .LOG: Detect running environment ...
echo .

echo .
echo .LOG: Detect docker ...
echo .

where docker
IF %ERRORLEVEL% NEQ 0 (
  echo .
  echo .LOG: No docker found, it means you must install Docker Desktop with wsl2 or Docker Toolbox without the requirement of wsl.
  echo .
  echo .LOG: Linux Lab depends on Docker toolbox without wsl or Docker Desktop with wsl2 and Git for Windows
  echo .
  echo .LOG: Please make sure the dependencies are there, if no, try the following steps:
  echo .
  echo .     1. Get a preinstalled Linux Lab Disk from https://shop155917374.taobao.com/
  echo .
  echo .        It is able to compile and boot a new linux kernel in 5 minutes.
  echo .
  echo .     2. Docker Toolbox Download Page: https://get.daocloud.io/toolbox/
  echo .
  echo .        Install the latest one and please don't enable 'upgrade boot2docker'
  echo .        The default selected tools must be installed, such as virtualbox and git for windows
  echo .
  echo .     3. Docker Desktop with wsl2: https://docs.docker.com/desktop/windows/install/
  echo .
  echo .        The wsl2 must be enabled during the installation, otherwise, it will not work.
  echo .
  echo .     4. Git for Windows: https://git-scm.com/download/win
  echo .
  echo .        Git Bash is provided by it, we use this bash to run everything. By default, both of the above two Docker versions provide it.
  echo .

  exit /b
)

echo .
echo .LOG: Detect git-bash ...
echo .

if not exist %GIT_BASH% (
  echo .
  echo .LOG: No Git Bash found, it means Git for Windows is not installed, please install one from https://git-scm.com/download/win. 
  echo .
  exit /b
)

echo .
echo .LOG: Current workdir: %cd%
echo .

if exist cloud-lab (
  echo .
  echo .1. LOG: Found 'cloud-lab' in %cd%
  echo .
  goto run_linux_lab
)

set OLD_DIR=%cd%
cd ../
if exist cloud-lab (
  echo .
  echo .2. LOG: Found 'cloud-lab' in %cd%
  echo .
  goto run_linux_lab
)
cd %OLD_DIR%

set OLD_DIR=%cd%
cd ../../
if exist cloud-lab (
  echo .
  echo .3. LOG: Found 'cloud-lab' in %cd%
  echo .
  goto run_linux_lab
)
cd %OLD_DIR%

set OLD_DIR=%cd%
cd ../../../
if exist cloud-lab (
  echo .
  echo .1. LOG: Found 'cloud-lab' in %cd%
  echo .
  goto run_linux_lab
)
cd %OLD_DIR%

echo .
echo .LOG: Download Linux Lab Manager: Cloud Lab
echo .
echo .LOG: The default install directory is: "%cd%"
echo .LOG: If want to install to another directory, run this batch script in the target directory.
echo .
echo .     $ cd /path/to/install-directory
echo .     $ /path/to/linux-lab-installer.bat
echo .
echo .     Or copy this batch script to the target directory and run it with mouse click.
echo .
echo .=== STOP by input 'n', Press any key to CONTINUE.
echo .

set /p answer=Yes/No? 
if /i "%answer:~,1%" EQU "n" exit /b

echo .
%GIT_BASH% -c 'cd "%cd%"; git clone --progress %CLOUD_LAB%'
echo .

IF %ERRORLEVEL% EQU 0 (
  echo .
  echo .LOG: 'cloud-lab' Downloaded to %cd%
  echo .
) ELSE (
  echo .
  echo .ERR: Failed to download 'cloud-lab'.
  echo .

  pause
  exit /b
)

:run_linux_lab

echo .
echo .LOG: Download and run Linux Lab itself, please wait for a while ...
echo .
echo .    It costs some time to download the whole environment ...
echo .

echo .
%GIT_BASH% -c 'cd "%cd%"/cloud-lab; echo "LOG: Switch to work branch: %WORK_BRANCH%"; git checkout %WORK_BRANCH%; echo "LOG: Running Linux Lab ..."; BRANCH=%WORK_BRANCH% tools/docker/run linux-lab; ret=$?; if [ $ret -ne 0 ]; then sleep 5 ; fi ; exit $ret'
echo .

IF %ERRORLEVEL% EQU 0 (
  echo .
  echo .LOG: 'Linux Lab' Started successfully.
  echo .
) ELSE (
  echo .
  echo .ERR: Failed to run 'Linux Lab'.
  echo .
)

pause
