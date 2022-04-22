
function get-afiles {
    [CmdletBinding()]
 	   param(
 	      [parameter(Mandatory=$true,
 	      ValueFromPipeline=$true)]
 	      $af
 	   )
 	   process {
 	      $a = $af | Where {$_.mode -like "*a*"}
	      write-output $a
	   }
	}
