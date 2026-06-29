# deploy.ps1 — sync local site files to the Lightsail server
# Usage: .\deploy.ps1

$KEY     = "D:\LightSailSSHKeys\LightsailDefaultKey-ap-south-1.pem"
$SERVER  = "ubuntu@65.0.157.6"
$REMOTE  = "/var/www/zappoevcharging.com/"

Write-Host "Deploying to ${SERVER}:${REMOTE} ..." -ForegroundColor Cyan

scp -i $KEY -o StrictHostKeyChecking=no "$PSScriptRoot\index.html" "${SERVER}:${REMOTE}"
scp -i $KEY -o StrictHostKeyChecking=no -r "$PSScriptRoot\images" "${SERVER}:${REMOTE}"

if ($LASTEXITCODE -eq 0) {
    Write-Host "Deploy complete. Visit https://zappoevcharging.com" -ForegroundColor Green
} else {
    Write-Host "Deploy FAILED (exit $LASTEXITCODE)." -ForegroundColor Red
}