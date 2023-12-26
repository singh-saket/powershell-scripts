function Create-DockerConfig {
    param (
        [string]$folderName = "config",
        [string]$parentDirectory = "C:\ProgramData\docker",
        [string]$jsonFileName = "daemon.json"
    )

    # Combine paths
    $folderPath = Join-Path -Path $parentDirectory -ChildPath $folderName
    $jsonFilePath = Join-Path -Path $folderPath -ChildPath $jsonFileName

    # Check for Docker installation
    if (Test-Path $parentDirectory -PathType Container) {
        Write-Host -ForegroundColor Green "Docker engine is installed, checking for '$folderName'."

        # Check if config folder exists
        if (-not (Test-Path $folderPath)) {
            New-Item -ItemType Directory -Path $folderPath | Out-Null
            Write-Host -ForegroundColor Green "Folder '$folderName' created successfully at $folderPath"
        } else {
            Write-Host -ForegroundColor Yellow "Folder '$folderName' already exists at $folderPath"
        }

        # Check and create JSON file
        if (-not (Test-Path $jsonFilePath)) {
            $jsonData = @{
                "debug" = $true
                "dns" = @("8.8.8.8")
                "experimental" = $false
            }
            $jsonData | ConvertTo-Json | Out-File -FilePath $jsonFilePath
            Write-Host -ForegroundColor Green "File '$jsonFileName' created successfully at $jsonFilePath"
        } else {
            Write-Host -ForegroundColor Yellow "File '$jsonFileName' already exists at $jsonFilePath"
        }
    } else {
        Write-Host -ForegroundColor Yellow "Docker engine is not installed, please install it first."
    }
}

# Example usage
Create-DockerConfig -folderName "config" -parentDirectory "C:\ProgramData\docker" -jsonFileName "daemon.json"
