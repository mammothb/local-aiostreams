$dockerPath = "C:\Program Files\Docker\Docker\Docker Desktop.exe"
Start-Process $dockerPath

Write-Host "Waiting for Docker to start..."
while (-not (docker info 2>$null)) {
    Start-Sleep -Seconds 3
}

$composeDir = "D:\GitRepos\local-aiostreams"
Set-Location $composeDir

docker compose up -d
