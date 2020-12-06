Write-Output "Performing manual backup of currently active save..."

$livePath = ".\The Sims 4"

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

$backupString = ($yyyy + "-" + $MM + "-" + $dd + " " + $hh + "_" + $mm + "_" + $ss + " Manual Backup")
$backupDestination = ".\" + $backupString

Compress-Archive $livePath -Destination $backupDestination