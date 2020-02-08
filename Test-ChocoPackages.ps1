function Test-ChocoPackages {
    [CmdletBinding()]
    param (
        [String[]]$Packages
    )

    BEGIN{}

    PROCESS{
        ForEach($Package In $Packages){
            choco install $Package -dvy
        }

        # This will let appveyor fail the build if a non-zero exit code is
        # returned by any chocolatey package
        #
        # Reference: https://www.appveyor.com/docs/build-configuration/
        if ($LastExitCode -ne 0) { 
            Write-Verbose "Non Zero Exit Code Encountered: $($LastExitCode)"
            $host.SetShouldExit($LastExitCode)
        }
    }

    END {}
}

Test-ChocoPackages -Packages p4,p4v,newrelic-infra -Verbose -ErrorAction "Stop"
