$Template = "$PSScriptRoot\template"
$Problemset = "D:\competitive\problemset"
# $Contests = "D:\competitive\codeforces"
$Backup = "D:\projects\codeforces"

# function Edit([string]$Folder) {
# 	Enter-VsDevShell 721d6c03
# 	code $Folder
# 	Stop-Process $PID
# }

function New-Problem {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]
		[ValidatePattern('^[0-9]*[A-Z][12]?$')]
		[string]$Id
	)

	Set-Location $Problemset 

	if (-Not (Test-Path $Id)) {
		New-Item $Id -ItemType Directory 
		Copy-Item $Template\* $Id -Recurse
		Rename-Item $Id\main.cpp "$Id.cpp"
	}

	Enter-VsDevShell 721d6c03
	code $Id
	Stop-Process $PID
}


function Backup-Problems {
	[CmdletBinding()]
	param ()

	# TODO: copy only changed files
	Get-ChildItem $Problemset\*\*.cpp | Copy-Item -Destination "$Backup\$($_.Name)"

	Set-Location $Backup 
	git add .
	git commit -m "$(Get-Date)"
	git push origin main

	Stop-Process $PID
}

# function New-Contest {
# 	[CmdletBinding()]
# 	param (
# 		[Parameter(Mandatory = $true)]
# 		[ValidateSet('Round', 'Educational', 'Global', 'Test', 'April-Fools')]
# 		[string]$Type,

# 		[Parameter(Mandatory = $true)]
# 		[uint32]$Id,

# 		[uint16]$Problems = 6 
# 	)

# 	Set-Location $Contests 
# 	$Contest = "$($Type.ToLower())-$Id"

# 	if (-Not (Test-Path $Contest)) {
# 		New-Item $Contest -ItemType Directory
# 		(1..$Problems).ForEach( { Copy-Item $Template\main.cpp $Contest\$([char]($_ + 64)).cpp } )
# 		Copy-Item $Template\.vscode $Contest -Recurse
# 	}

# 	Edit $Contest
# }

Export-ModuleMember -Function New-Problem, Backup-Problems