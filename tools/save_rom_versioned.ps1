# Copy built polishedcrystal ROM to Desktop with version suffix 3.2.3.001, .002, ...
# Usage (from project root or anywhere):
#   powershell -File tools/save_rom_versioned.ps1
# Optional: -Source path\to.gbc

param(
    [string]$Source = ""
)

$ErrorActionPreference = "Stop"
$ProjectRoot = Split-Path $PSScriptRoot -Parent
$CounterFile = Join-Path $PSScriptRoot "_rom_build_version.txt"
$Desktop = [Environment]::GetFolderPath("Desktop")
$VersionBase = "3.2.3"

if (-not $Source) {
    $Source = Join-Path $ProjectRoot "polishedcrystal-3.2.3.gbc"
}
if (-not (Test-Path $Source)) {
    Write-Error "ROM not found: $Source"
}

$n = 0
if (Test-Path $CounterFile) {
    $raw = (Get-Content $CounterFile -Raw).Trim()
    [int]::TryParse($raw, [ref]$n) | Out-Null
}
$n++
$num = "{0:D3}" -f $n
$destName = "polishedcrystal-$VersionBase.$num.gbc"
$dest = Join-Path $Desktop $destName

Copy-Item -Force $Source $dest
Set-Content -Path $CounterFile -Value "$n" -NoNewline

$hash = (Get-FileHash $dest -Algorithm MD5).Hash
Write-Host "Saved: $dest"
Write-Host "Build: $VersionBase.$num"
Write-Host "MD5:   $hash"

# Also keep a stable "latest" pointer copy (overwrite)
$latest = Join-Path $Desktop "polishedcrystal-$VersionBase-latest.gbc"
try {
    Copy-Item -Force $Source $latest
    Write-Host "Latest: $latest"
} catch {
    Write-Host "Latest copy skipped (file locked?): $_"
}
