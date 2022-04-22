# function get-afiles block 
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

#function get-afiles is called here 
$af = get-childitem "c:\windows" 
 get-afiles $af 