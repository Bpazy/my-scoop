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
$proxy = Read-Host "Entry http proxy address, Such as 'http://127.0.0.1:10809': "

if ($proxy) {
    # If you want to use a proxy that isn't already configured in Internet Options
    [net.webrequest]::defaultwebproxy = new-object net.webproxy $proxy

    # If you want to use the Windows credentials of the logged-in user to authenticate with your proxy
    # [net.webrequest]::defaultwebproxy.credentials = [net.credentialcache]::defaultcredentials
    # If you want to use other credentials (replace 'username' and 'password')
    # [net.webrequest]::defaultwebproxy.credentials = new-object net.networkcredential 'username', 'password'
}
Write-Output "Installing Scoop..."
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

Write-Output "Setting Scoop proxy..."
if ($proxy) {
    # 如果发生了类似于: ERROR Download failed! (Error 19) Name resolution failed
    # 则移除代理: scoop config rm proxy
    scoop config proxy $proxy
}
