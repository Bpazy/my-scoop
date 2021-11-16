# 决定不改变 scoop 默认安装目录了
# $cp = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
# if (!$cp.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
#     Write-Output "Please run with administrator"
#     exit
# }

# Write-Output "Setting Scoop env..."
# $env:SCOOP = 'C:\MyProgram\ScoopPrograms'
# [Environment]::SetEnvironmentVariable('SCOOP', $env:SCOOP, 'User')
# $env:SCOOP_GLOBAL = 'C:\MyProgram\ScoopGlobalPrograms'
# [Environment]::SetEnvironmentVariable('SCOOP_GLOBAL', $env:SCOOP_GLOBAL, 'Machine')

Write-Output "Setting proxy to install Scoop..."
$proxy = Read-Host "Entry http proxy address, Such as '127.0.0.1:10809': "

Write-Output "Installing Scoop..."
$client = New-Object System.Net.WebClient
if ($proxy) {
    $client.Proxy = New-Object System.Net.WebProxy($proxy)
}
# FIXME 从我自己的仓库下载，给 install.ps1 和 core.ps1 内部增加了代理，固定值：127.0.0.1:10809
Invoke-Expression $client.DownloadString('https://raw.githubusercontent.com/Bpazy/scoop/master/bin/install.ps1')

Write-Output "Setting Scoop proxy..."
$proxy = Read-Host "Entry http proxy address, Such as '127.0.0.1:10809': "
if ($proxy) {
    scoop config proxy $proxy
}
