Write-Output "Switching from Multiplayer to Singleplayer..."

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

$backupString = ($yyyy + "-" + $MM + "-" + $dd + " " + $hh + "_" + $mm + "_" + $ss + " MP2SP Backup")
$backupDestination = ".\" + $backupString

if(-not (Test-Path -Path $spActivePath)) 
{
    Write-Output "Backing up active data..."
    Compress-Archive $livePath -Destination $backupDestination

    if(Test-Path -Path $mpActivePath)
    {
        Write-Output "Cleaning up before switching..."
        Remove-Item -Path $mpActivePath -Recurse
    }

    if(Test-Path -Path $mpPath)
    {
        Write-Output "Cleaning up a bit more before switching..."
        Remove-Item $mpPath -Recurse
    }
    
    Write-Output "Backing up active Multiplayer save..."
    Copy-Item $livePath -Destination $mpPath -Recurse

    #In case there isn't a singleplayer save to swap in
    if(-not (Test-Path -Path $spPath))
    {
        Write-Warning "Could not find a multiplayer save to swap to. Making a copy of current active save to use as Singleplayer...`nNOTE: The saves will diverge from this point forward so any changes while set to multiplayer will only save for multiplayer and vice-versa."
        Copy-Item -Path $livePath -Destination $spPath -Recurse
    }
        
    Write-Output "Switching from Multiplayer save to Singleplayer save..."
    Remove-Item -Path $livePath -Recurse
    Copy-Item -Path $spPath -Destination $livePath -Recurse
    
    Write-Output "Marking Singleplayer save as active..."
    Copy-Item -Path $spPath -Destination $spActivePath -Recurse
    Remove-Item -Path $spPath -Recurse

    Write-Output "Switching from singleplayer to Multiplayer is complete. Multiplayer is now active!`nEnjoy your game."
}
else 
{
    Write-Warning "Nothing was changed, Singleplayer is already active."
}