$syslog = get-eventlog System

$err = 0
$inf = 0
$fla = 0
$sca = 0
$wrn = 0

foreach ($e in $syslog) {
   if ($e.EntryType -eq "Error") {
       $err = $err + 1
   }
   elseif ($e.EntryType -eq "Information") {
       $inf = $inf + 1
   }
   elseif ($e.EntryType -eq "FailureAudit") {
       $inf = $inf + 1
   }
   elseif ($e.EntryType -eq "SuccessAudit") {
       $sca = $sca + 1
   }
   elseif ($e.EntryType -eq "Warning") {
       $wrn = $wrn + 1
   }
}

write-host "Error events: $err"
write-host "Information events: $inf"
write-host "Failure Audit events: $fla"
write-host "Success Audit events: $sca"
write-host "Warning events: $wrn"
