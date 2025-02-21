function Assert-MatchTests {
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline)] $TestResult
    )

    if ($TestResult) {
        Write-Error "Output does not match expected results."
    }
}

$Error.clear()
koka -v0 -e "$PSScriptRoot\clockhands.kk" |
    Compare-Object (Get-Content "$PSScriptRoot\..\test\clockhands_expected") |
    Assert-MatchTests &&
koka -v0 -e "$PSScriptRoot\hello.kk" &&
ForEach-Object 'foo'

if ($Error -or !$?) { 
    "*** KOKA TESTS FAILED ***" 
}
else { 
    "KOKA TESTS PASSED" 
} 