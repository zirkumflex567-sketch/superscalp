# Synchronizes all compiled EAs and .set files to all MT5 Terminal directories on the machine
$terminals = Get-ChildItem -Path "$env:APPDATA\MetaQuotes\Terminal" -Directory
$sourceDir = "$PSScriptRoot"
$setFiles = Get-ChildItem -Path "$sourceDir\*.set", "$env:USERPROFILE\Downloads\*.set" -ErrorAction SilentlyContinue

Write-Host "Synchronizing $($terminals.Count) MT5 Terminal installations..."

foreach ($t in $terminals) {
    $expertsPath = Join-Path $t.FullName "MQL5\Experts"
    $testerPath = Join-Path $t.FullName "MQL5\Profiles\Tester"
    
    if (Test-Path $expertsPath) {
        Copy-Item -Path "$sourceDir\XAU_Titan_*.*" -Destination $expertsPath -Force -ErrorAction SilentlyContinue
        foreach ($s in $setFiles) {
            Copy-Item -Path $s.FullName -Destination $expertsPath -Force -ErrorAction SilentlyContinue
        }
    }
    
    if (Test-Path $testerPath) {
        foreach ($s in $setFiles) {
            Copy-Item -Path $s.FullName -Destination $testerPath -Force -ErrorAction SilentlyContinue
        }
    }
}

Copy-Item -Path "$sourceDir\XAU_Titan_*.*" -Destination "$env:USERPROFILE\Downloads\" -Force -ErrorAction SilentlyContinue
Copy-Item -Path "$sourceDir\XAU_Titan_*.*" -Destination "$env:USERPROFILE\Downloads\testing\" -Force -ErrorAction SilentlyContinue

Write-Host "Done! All MT5 instances are up to date."
