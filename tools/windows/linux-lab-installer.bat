@ECHO OFF

SET GIT_BASH="%ProgramFiles%/Git/git-bash.exe"
SET CLOUD_LAB="https://gitee.com/tinylab/cloud-lab.git"
SET WORK_BRANCH=next

ECHO .................................................................................................
ECHO ........................... Linux Lab for Windows Installer .....................................
ECHO .................................................................................................
ECHO .......... Copyright © 2016-2022 Wu Zhangjin, falcon@tinylab.org, All Right Reserved. ...........
ECHO .................................................................................................

ECHO .
ECHO .Note: Please don't run me in the cloud-lab source code, this is only for the first fresh install
ECHO .      If you have downloaded cloud-lab, please open git-bash.exe and run those commands instead:
ECHO .
ECHO .      $ cd /path/to/cloud-lab
ECHO .      $ tools/docker/run
ECHO .
ECHO .==== STOP by input 'n', Press any key to CONTINUE.
ECHO .

SET /p answer=Yes/No? 
IF /i "%answer:~,1%" EQU "n" EXIT /b

ECHO .
ECHO .LOG: Detect running environment ...
ECHO .

ECHO .
ECHO .LOG: Detect docker ...
ECHO .

where docker
IF %ERRORLEVEL% NEQ 0 (
  ECHO .
  ECHO .LOG: No docker found, it means you must install Docker Desktop with wsl2 or Docker Toolbox without the requirement of wsl.
  ECHO .
  ECHO .LOG: Linux Lab depends on Docker toolbox without wsl or Docker Desktop with wsl2 and Git for Windows
  ECHO .
  ECHO .LOG: Please make sure the dependencies are there, if no, try the following steps:
  ECHO .
  ECHO .     1. Get a preinstalled Linux Lab Disk from https://shop155917374.taobao.com/
  ECHO .
  ECHO .        It is able to compile and boot a new linux kernel in 5 minutes.
  ECHO .
  ECHO .     2. Docker Toolbox Download Page: https://get.daocloud.io/toolbox/
  ECHO .
  ECHO .        Install the latest one and please don't enable 'upgrade boot2docker'
  ECHO .        The default selected tools must be installed, such as virtualbox and git for windows
  ECHO .
  ECHO .     3. Docker Desktop with wsl2: https://docs.docker.com/desktop/windows/install/
  ECHO .
  ECHO .        The wsl2 must be enabled during the installation, otherwise, it will not work.
  ECHO .
  ECHO .     4. Git for Windows: https://git-scm.com/download/win
  ECHO .
  ECHO .        Git Bash is provided by it, we use this bash to run everything. By default, both of the above two Docker versions provide it.
  ECHO .

  EXIT /b 1
)

ECHO .
ECHO .LOG: Detect git-bash ...
ECHO .

IF NOT EXIST %GIT_BASH% (
  ECHO .
  ECHO .LOG: No Git Bash found, it means Git for Windows is not installed, please install one from https://git-scm.com/download/win.
  ECHO .
  ECHO .     If you did install one, please edit this batch script and change GIT_BASH to the right path to git-bash.exe
  ECHO .

  EXIT /b 2
)

ECHO .
ECHO .LOG: Current workdir: %CD%
ECHO .

IF EXIST cloud-lab (
  ECHO .
  ECHO .1. LOG: Found 'cloud-lab' in %CD%
  ECHO .
  GOTO run_linux_lab
)

SET OLD_DIR=%CD%
CD ../
if exist cloud-lab (
  ECHO .
  ECHO .2. LOG: Found 'cloud-lab' in %CD%
  ECHO .
  GOTO run_linux_lab
)
CD %OLD_DIR%

SET OLD_DIR=%CD%
CD ../../
IF EXIST cloud-lab (
  ECHO .
  ECHO .3. LOG: Found 'cloud-lab' in %CD%
  ECHO .
  GOTO run_linux_lab
)
CD %OLD_DIR%

SET OLD_DIR=%CD%
CD ../../../
IF EXIST cloud-lab (
  ECHO .
  ECHO .4. LOG: Found 'cloud-lab' in %CD%
  ECHO .
  GOTO run_linux_lab
)
CD %OLD_DIR%

ECHO .
ECHO .LOG: Download Linux Lab Manager: Cloud Lab
ECHO .
ECHO .LOG: The default install directory is: "%CD%"
ECHO .LOG: If want to install to another directory, run this batch script in the target directory.
ECHO .
ECHO .     $ cd /path/to/install-directory
ECHO .     $ /path/to/linux-lab-installer.bat
ECHO .
ECHO .     Or copy this batch script to the target directory and run it with mouse click.
ECHO .
ECHO .=== STOP by input 'n', Press any key to CONTINUE.
ECHO .

SET /p answer=Yes/No? 
IF /i "%answer:~,1%" EQU "n" EXIT /b

ECHO .
%GIT_BASH% -c 'cd "%CD%"; git clone --progress %CLOUD_LAB%'
ECHO .

IF %ERRORLEVEL% EQU 0 (
  ECHO .
  ECHO .LOG: 'cloud-lab' Downloaded to %CD%
  ECHO .
) ELSE (
  ECHO .
  ECHO .ERR: Failed to download 'cloud-lab'.
  ECHO .

  PAUSE
  EXIT /b 3
)

:run_linux_lab

ECHO .
ECHO .LOG: Download and run Linux Lab itself, please wait for a while ...
ECHO .
ECHO .    A new terminal will launch, please wait for it finish.
ECHO .
ECHO .    It costs some time to download the whole environment, please wait a while.
ECHO .

ECHO .
%GIT_BASH% -c 'cd "%CD%"/cloud-lab; ECHO "LOG: Switch to work branch: %WORK_BRANCH%"; git checkout %WORK_BRANCH%; ECHO "LOG: Running Linux Lab ..."; BRANCH=%WORK_BRANCH% tools/docker/run linux-lab; ret=$?; if [ $ret -ne 0 ]; then sleep 5 ; fi ; exit $ret'
ECHO .

IF %ERRORLEVEL% EQU 0 (
  ECHO .
  ECHO .LOG: 'Linux Lab' Started successfully.
  ECHO .
) ELSE (
  ECHO .
  ECHO .ERR: Failed to run 'Linux Lab'.
  ECHO .
)

PAUSE
