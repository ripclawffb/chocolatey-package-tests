function Test-ChocoPackages {
    param (
        [String[]]$Packages
    )

    BEGIN{}

    PROCESS{
        ForEach($Package In $Packages){
            choco install $Package -dvy
        }
    }

    END {
        if ($LastExitCode -ne 0) { $host.SetShouldExit($LastExitCode)  }
    }
}

Test-ChocoPackages -Packages p4,p4v,newrelic-infra
