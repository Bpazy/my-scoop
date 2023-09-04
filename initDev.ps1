# Append your buckets here
$buckets = @(
    @{ Alias = 'dorado'; Url = 'https://github.com/chawyehsu/dorado' }
    # @{ Alias = 'bpazyForked'; Url = 'https://github.com/Bpazy/Main' }
    @{ Alias = 'java' }
    @{ Alias = 'versions' }
)

# Append your apps here
$apps = @(
    'git'
    'busybox'
    'aria2'
    'go'
    'sudo'
    'openjdk17'
    'openjdk8-redhat'
    'python27'
    'python38'
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
    'helm'
    'gh'
    'iperf3'
    'youtube-dl'
)

# Commands will be invoking lastly
$commands = @(
    'scoop config aria2-enabled true'
    'scoop reset openjdk8-redhat'
    'scoop reset python'
    'scoop reset nodejs12'
    "Write-Output 'You should install Rust by rustup from https://www.rust-lang.org/tools/install'"
    # Install httpie
    'python -m pip install --upgrade pip wheel'
    'python -m pip install httpie'
)

foreach ($bucket in $buckets) {
    if ( $bucket.ContainsKey('Url')) {
        scoop bucket add $bucket.Alias $bucket.Url
    }
    else {
        scoop bucket add $bucket.Alias
    }
}

foreach ($app in $apps) {
    Write-Output 'Installing ' + $app
    scoop install $app
}

foreach ($command in $commands) {
    Invoke-Expression $command
}

