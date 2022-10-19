$buckets = @(
    @{ Alias = 'dorado'; Url = 'https://github.com/chawyehsu/dorado' }
    @{ Alias = 'bpazyForked'; Url = 'https://github.com/Bpazy/Main' }
    @{ Alias = 'java' }
    @{ Alias = 'versions' }
)

$tools = @(
    'git'
    'busybox'
    'aria2'
    'go'
    'sudo'
    'openjdk17'
    'openjdk8-redhat'
    'python27'
    'python'
    'nodejs'
    'nodejs12'
    'nuwen-mingw-gcc'
    'make'
    'vim'
    'groovy'
    'iperf3'
    'maven'
    'gcc'
)

$commands = @(
    'scoop config aria2-enabled true'
    'scoop reset openjdk8-redhat'
    'scoop reset python'
    'scoop reset nodejs12'
    "Write-Output 'You should install Rust by rustup from https://www.rust-lang.org/tools/install'"
)

foreach ($bucket in $buckets) {
    if ( $bucket.ContainsKey('Url')) {
        scoop bucket add $bucket.Alias $bucket.Url
    }
    else {
        scoop bucket add $bucket.Alias
    }
}

foreach ($tool in $tools) {
    Write-Output 'Installing ' + $tool
    scoop install $tool
}

foreach ($command in $commands) {
    Invoke-Expression $command
}

