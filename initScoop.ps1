$cp = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (!$cp.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Output "Please run with administrator"
    exit
}

Write-Output "Setting Scoop env..."
$env:SCOOP = 'C:\MyProgram\ScoopPrograms'
[Environment]::SetEnvironmentVariable('SCOOP', $env:SCOOP, 'User')
$env:SCOOP_GLOBAL = 'C:\MyProgram\ScoopGlobalPrograms'
[Environment]::SetEnvironmentVariable('SCOOP_GLOBAL', $env:SCOOP_GLOBAL, 'Machine')

Write-Output "Installing Scoop..."
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

Write-Output "Setting Scoop proxy..."
$proxy = Read-Host "Entry http proxy address: "
if ($proxy) {
    scoop config proxy $proxy
}

Write-Output "Installing sudo..."
scoop install -g sudo 
