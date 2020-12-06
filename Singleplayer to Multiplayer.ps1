Write-Output "Switching from Singleplayer to Multiplayer..."

$spActivePath = '.\Singleplayer - The Sims 4 (ACTIVE)'
$mpActivePath = '.\Multiplayer - The Sims 4 (ACTIVE)'
$livePath = ".\The Sims 4"
$spPath = ".\Singleplayer - The Sims 4"
$mpPath = ".\Multiplayer - The Sims 4"

$date = Get-Date
$yyyy = $date.Year.ToString();
$MM = $date.Month;
$dd = $date.Day;
$hh = $date.Hour;
$mm = $date.Minute;
$ss = $date.Second;

if($MM -lt 10) { $MM = "0" + $MM.ToString() }
if($dd -lt 10) { $dd = "0" + $dd.ToString() }
if($hh -lt 10) { $hh = "0" + $hh.ToString() }
if($mm -lt 10) { $mm = "0" + $mm.ToString() }
if($ss -lt 10) { $ss = "0" + $ss.ToString() }

$backupString = ($yyyy + "-" + $MM + "-" + $dd + " " + $hh + "_" + $mm + "_" + $ss + " SP2MP Backup")
$backupDestination = ".\" + $backupString

if(-not (Test-Path -Path $mpActivePath)) 
{
    Write-Output "Backing up active data..."
    Compress-Archive $livePath -Destination $backupDestination

    if(Test-Path -Path $spActivePath) 
    {
        Write-Output "Cleaning up before switching..."
        Remove-Item $spActivePath -Recurse
    }

    if(Test-Path -Path $spPath)
    {
        Write-Output "Cleaning up a bit more before switching (2 of 2)..."
        Remove-Item $spPath -Recurse
    }

    Write-Output "Backing up active Singleplayer save..."
    Copy-Item $livePath -Destination $spPath -Recurse

    #In case there isn't a multiplayer save to swap in
    if(-not (Test-Path -Path $mpPath))
    {
        Write-Warning "Could not find a multiplayer save to swap to. Making a copy of current active save to use as Multiplayer...`nNOTE: The saves will diverge from this point forward so any changes while set to Singleplayer will only save for Singleplayer and vice-versa."
        Copy-Item -Path $livePath -Destination $mpPath -Recurse
    }

    Write-Output "Switching from singleplayer save to multiplayer save..."
    Remove-Item -Path $livePath -Recurse
    Copy-Item -Path $mpPath -Destination $livePath -Recurse

    Write-Output "Marking Multiplayer save as active..."
    Copy-Item -Path $mpPath -Destination $mpActivePath -Recurse
    Remove-Item -Path $mpPath -Recurse

    Write-Output "Switching from singleplayer to Multiplayer is complete. Multiplayer is now active!`nEnjoy your game."
}
else {
    Write-Warning "Nothing was changed, Multiplayer is already active."
}