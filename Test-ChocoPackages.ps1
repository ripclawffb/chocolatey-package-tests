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

    END {}
}

Test-ChocoPackages -Packages p4,p4v
