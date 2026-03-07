$dockerPath = "C:\Program Files\Docker\Docker\Docker Desktop.exe"
Start-Process $dockerPath

Write-Host "Waiting for Docker to start..."
while ($true) {
    $output = docker ps 2>&1
    if ($output -notmatch "failed to connect") {
        Write-Host "Docker is ready!" -ForegroundColor Green
        break
    }
    Start-Sleep -Seconds 3
}

$composeDir = "D:\GitRepos\local-aiostreams"
Set-Location $composeDir

docker compose up -d

Start-Process "C:\Users\Admin\AppData\Local\Programs\StremioService\stremio-service.exe" --skip-updater
