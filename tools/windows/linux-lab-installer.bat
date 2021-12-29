@echo off

set GIT_BASH="C:/Program Files (x86)/Git/git-bash.exe"
set CLOUD_LAB="https://gitee.com/tinylab/cloud-lab.git"

echo .................................................................................................
echo ........................... Linux Lab for Windows Installer .....................................
echo .................................................................................................
echo .......... Copyright © 2016-2022 Wu Zhangjin, falcon@tinylab.org, All Right Reserved. ...........
echo .................................................................................................


echo .
echo .Note: Please don't run me in the cloud-lab source code, this is only for the first fresh install
echo .      If you has downloaded cloud-lab, please open git-bash.exe and run those commands instead:
echo .
echo .      $ cd /path/to/cloud-lab
echo .      $ tools/docker/run
echo .
echo .==== STOP by input 'n', Press any key to CONTINUE.
echo .

set /p answer=Yes/No?
if /i "%answer:~,1%" EQU "n" exit /b

@echo off
echo .
echo .LOG: Linux Lab depends on Docker toolbox or Docker Desktop with wsl and Git for Windows
echo .
echo .LOG: Please make answer the dependencies are there, otherwise, input 'n' to stop installation
echo .
echo .     1. Docker Toolbox Download Page: https://get.daocloud.io/toolbox/
echo .
echo .        Install the latest one and please don't enable 'upgrade boot2docker'
echo .        The default selected tools must be installed, such as virtualbox and git for windows
echo .
echo .     2. Docker Desktop with wsl2: https://hub.docker.com/editions/community/docker-ce-desktop-windows
echo .
echo .        The wsl2 must be enabled during the installation, otherwise, it will not work.
echo .
echo .     3. Git for Windows: https://git-scm.com/download/win
echo .
echo .        Git Bash is provided by it, we use this bash to run everything. By default, both of them provide it.
echo .
echo .
echo .=== STOP by input 'n', Press any key to CONTINUE.
echo .

set /p answer=Yes/No?
if /i "%answer:~,1%" EQU "n" exit /b

if exist %cd%\cloud-lab (
  echo .
  echo LOG: Found 'cloud-lab' in %cd%
  echo .
  goto run_linux_lab
)
if exist %cd%\..\cloud-lab (
  cd ../
  echo .
  echo LOG: Found 'cloud-lab' in %cd%
  echo .
  goto run_linux_lab
)

if exist %cd%\..\..\cloud-lab (
  cd ../../
  echo .
  echo LOG: Found 'cloud-lab' in %cd%
  echo .
  goto run_linux_lab
)

if exist %cd%\..\..\..\cloud-lab (
  cd ../../../
  echo .
  echo LOG: Found 'cloud-lab' in %cd%
  echo .
  goto run_linux_lab
)

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
%GIT_BASH% -c 'cd "%cd%"; tools/docker/run linux-lab'
echo .

IF %ERRORLEVEL% EQU 0 (
  echo .
  echo .LOG: 'Linux Lab' Started successfully.
  echo .
) ELSE (
  echo .
  echo .ERR Failed to run 'Linux Lab'.
  echo .
)

pause
