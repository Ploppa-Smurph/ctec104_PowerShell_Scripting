function Get-PipeLineBeginEnd {
    param (
        [string]$SomeInput
    )
    begin {
        "Begin: The input is $SomeInput"  # runs only once - at the beginning - used to 'Scaffold' the process
    }
    process {
        "The value is: $_"    # the process runs 3 times in this instance - 1x for each item that was entered 
    }
    end {
        "End: The input is $SomeInput"  # runs only once - at the end - used to 'Scaffold' the process
    }
}#Get-PipeLineBeginEnd
1,2,3 | Get-PipeLineBeginEnd -SomeInput 'Test'