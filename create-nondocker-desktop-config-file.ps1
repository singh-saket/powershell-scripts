#Declare the folder name
$folderName = "config"

#Declare the parent directory where you want to create the config folder
$parentDirectory = "C:\Projects\Powershell"

#Combine the parent directory and folder name to get the full path
$folderPath = Join-Path -Path $parentDirectory -ChildPath $folderName

#Declare Json File Name
$jsonFileName = "daemon.json"

#Combine the Json file path with the above specified config folder path, as Json file should be the children of the config folder
$jsonFilePath = Join-Path -Path $folderPath -ChildPath $jsonFileName

#Check if config folder already exists
if (-not (Test-Path $folderPath)) {
    #Create the folder if it doesn't exist
    New-Item -ItemType Directory -Path $folderPath | Out-Null
	
	Write-Host   # Empty Write-Host for a new line
    Write-Host "Folder '$folderName' created successfully at $folderPath" -ForegroundColor Green
	
	if (-not (Test-Path $jsonFilePath)) {
		#Define the JSON data
		$jsonData = @{
			"debug"        = $true
			"dns"          = @("8.8.8.8")
			"experimental" = $false
		}
		
		#Write the JSON data to the file
		$jsonData | ConvertTo-Json | Out-File -FilePath $jsonFilePath
		
		Write-Host   # Empty Write-Host for a new line
		Write-Host "File '$jsonFileName' created successfully at $jsonFilePath" -ForegroundColor Green
		Write-Host   # Empty Write-Host for a new line
	}
	else
	{
		Write-Host   # Empty Write-Host for a new line
		Write-Host "File '$jsonFileName' already exists at $jsonFilePath" -ForegroundColor Yellow
		Write-Host   # Empty Write-Host for a new line
	}
	
} else {
	Write-Host   # Empty Write-Host for a new line
    Write-Host "Folder '$folderName' already exists at $folderPath" -ForegroundColor Yellow
	
	if (-not (Test-Path $jsonFilePath)) {
		# Define the JSON data
		$jsonData = @{
			"debug"        = $true
			"dns"          = @("8.8.8.8")
			"experimental" = $false
		}
		
		# Write the JSON data to the file
		#$jsonData | Out-File -FilePath $jsonFilePathFinal
		$jsonData | ConvertTo-Json | Out-File -FilePath $jsonFilePath
		
		Write-Host   # Empty Write-Host for a new line
		Write-Host "File '$jsonFileName' created successfully at $jsonFilePath" -ForegroundColor Green
		Write-Host   # Empty Write-Host for a new line
	}
	else
	{
		Write-Host   # Empty Write-Host for a new line
		Write-Host "File '$jsonFileName' already exists at $jsonFilePath" -ForegroundColor Yellow
		Write-Host   # Empty Write-Host for a new line
	}
}