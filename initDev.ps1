Write-Output "Installing Git"
scoop install git

Write-Output "Installing Busybox"
scoop install busybox

Write-Output "Installing aria2..."
scoop install aria2
scoop config aria2-enabled true

Write-Output "Intalling Go..."
scoop install go 

Write-Output "Installing sudo..."
scoop install sudo 

Write-Output "Installing openjdk8-redhet..."
scoop bucket add java
scoop install openjdk8-redhat

Write-Output "Installing openjdk11..."
scoop install openjdk11

Write-Output "Use scoop reset <java>[@<version>] to switch Javas"

Write-Output "Installing Python"
scoop install python

Write-Output "Installing Nodejs"
scoop install nodejs
