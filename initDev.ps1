Write-Output "Installing Git"
scoop install git

scoop bucket add dorado https://github.com/chawyehsu/dorado
scoop bucket add bpazyForked https://github.com/Bpazy/Main

Write-Output "Installing Busybox"
scoop install busybox

Write-Output "Installing aria2..."
scoop install aria2
scoop config aria2-enabled true

Write-Output "Intalling Go..."
scoop install bpazyForked/go 

Write-Output "Installing sudo..."
scoop install sudo 

Write-Output "Installing openjdk11..."
scoop install openjdk11

Write-Output "Installing openjdk8-redhet..."
scoop bucket add java
scoop install openjdk8-redhat
scoop reset openjdk8-redhat

Write-Output "Use scoop reset <java>[@<version>] to switch Javas"

Write-Output "Installing python27"
scoop bucket add versions
scoop install python27

Write-Output "Installing Python"
scoop install python
scoop reset python

Write-Output "Installing Nodejs"
scoop install nodejs
scoop install nodejs12
scoop reset nodejs12

Write-Output "Installing gcc"
# scoop install gcc
scoop install dorado/nuwen-mingw-gcc
scoop install make

Write-Output "Installing VIM"
scoop install vim

Write-Output "Installing groovy"
scoop install groovy

Write-Output "Installing iperf3"
scoop install iperf3

Write-Output "You should install Rust by 'rustup' from 'https://www.rust-lang.org/tools/install'"


Write-Output "Installing maven"
scoop install main/maven
