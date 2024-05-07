<# :
@echo off
setlocal 
set "cmdfile=%~dp0%~n0.cmd"

title %~n0

rem Try to rerun this script as a subprocess
if "%~1" neq "--no-subprocess" (
    start /min cmd /c "call "%cmdfile%" --no-subprocess"
    goto :eof
)

rem If another Powershell instance is running this script then exit
powershell -nop -c "Get-CimInstance Win32_Process | Where-Object { $_.CommandLine -like '*powershell*i'+'ex*%~n0.cmd*' } | ForEach-Object { exit 1234 }"
if "%errorlevel%" equ "1234" (
    powershell -nop -c "for ($i = 2; $i -gt 0; $i--) { Write-Host -NoNewline \"%~n0.cmd already running... $i`r\"; Start-Sleep -Seconds 1}; Write-Host ' '"
    goto :eof
)

rem If only instance then run this in Powershell and keep alive after crashes
:loop
:loop
    powershell -nop -c iex (Get-Content '%cmdfile%' -Raw)
    timeout /t 1 /nobreak >nul
goto loop
#>

# Load necessary assembly for using Forms and drawing
Add-Type -AssemblyName System.Windows.Forms

# Interval in Milliseconds
$Interval = 5 * 60 * 1000

Write-Host "Your mouse will be wiggled every $($Interval/1000) seconds"

while ($true) {
    # Increase position
    $pos = [System.Windows.Forms.Cursor]::Position
    $newX = $pos.X + 1
    $newY = $pos.Y + 1
    [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($newX, $newY)

    Start-Sleep -Milliseconds 30

    # Decrease position
    $pos = [System.Windows.Forms.Cursor]::Position
    $newX = $pos.X - 1
    $newY = $pos.Y - 1
    [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($newX, $newY)


    # Wait for the specified interval
    Start-Sleep -Milliseconds $Interval
}
