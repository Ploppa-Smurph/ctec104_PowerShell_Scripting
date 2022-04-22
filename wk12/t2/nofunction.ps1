
$af = get-childitem "C:\windows" 
$a = $af | Where {$_.mode -like "d*r*"} 
write-output $a