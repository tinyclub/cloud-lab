@echo off

set GIT_BASH="C:/Program Files (x86)/Git/git-bash.exe" 
set CUR_DIR="%cd%"

echo LOG: Check if wsl exists
where wsl || (echo ERR: WSL not exists && pause && exit 0)

echo LOG: Check wsl version
wsl --status

echo LOG: Check default wsl system
wsl -l

echo LOG: Check old wsl2kernel version
echo ------------------------------------------------
wsl -- uname -r
echo ------------------------------------------------

echo LOG: Check Docker is running
tasklist | grep -q docker || echo ERR: Docker is not running, please start it at first && pause && exit 0

echo LOG: Make sure the default wsl version is 2
wsl --set-default-version 2 || (echo ERR: Can not set default wsl version to 2 && pause && exit 0)

echo LOG: Make sure the default wsl system is docker desktop
wsl --set-default docker-desktop || (echo ERR: Can not set default wsl system to docker desktop && pause && exit 0)

echo LOG: Start Linux Lab
%GIT_BASH% -c 'LOGGING=0 LOGIN=none "$(cd %CUR_DIR%/../../; pwd)"/tools/docker/run "linux-lab"; sleep 3'

echo LOG: Fetch latest wsl2kernel and build it
%GIT_BASH% -c '"$(cd %CUR_DIR%/../../; pwd)"/tools/docker/cmd "//labs/linux-lab/tools/testing/wsl.sh"; sleep 3'

echo LOG: Update the ~/.wslconfig with the latest kernel image
%GIT_BASH% -c '"$(cd %CUR_DIR%/../../; pwd)"/tools/windows/wsl-config.sh; sleep 3'

echo LOG: Shutdown wsl2
wsl --shutdown

echo LOG: Make sure the default wsl system is docker desktop
wsl --set-default docker-desktop || (echo ERR: Can not set default wsl system to docker desktop && pause && exit 0)

echo LOG: Restart wsl2 with latest wsl2kernel image
echo ================================================
wsl -- uname -r || (echo ERR: new kernel has issue && pause && exit 0)
echo ================================================

echo LOG: Restart Linux Lab and Login with via webvnc
%GIT_BASH% -c 'LOGGING=0 LOGIN=webvnc "$(cd %CUR_DIR%/../../; pwd)"/tools/docker/run "linux-lab"; sleep 2'

echo LOG: Press any key to exit
pause
