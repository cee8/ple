function Assert-MatchTests {
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline)] $TestResult
    )

    if ($TestResult) {
        Write-Error "Output does not match expected results."
    }
}

$bin = "$PSScriptRoot\bin"

# First check if folder bin exists. If not, make a new bin folder.
if (!(Test-Path -Path $bin)) {
    New-Item -Path $bin -Type Directory
} 

$Error.clear()
nekoc -o $bin "$PSScriptRoot\clockhands.neko" && neko "$bin\clockhands.n" |
    Compare-Object (Get-Content "$PSScriptRoot\..\test\clockhands_expected") |
    Assert-MatchTests &&
nekoc -o $bin "$PSScriptRoot\hello_world.neko" && neko "$bin\hello_world.n" &&
nekoc -o $bin "$PSScriptRoot\triple.neko" && neko "$bin\triple.n" |
    Compare-Object (Get-Content "$PSScriptRoot\..\test\triple_expected") |
    Assert-MatchTests &&
ForEach-Object 'foo'

if ($Error -or !$?) { 
    "*** NEKO TESTS FAILED ***" 
}
else { 
    "NEKO TESTS PASSED" 
} 
