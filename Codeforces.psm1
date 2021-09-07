$Template = "$PSScriptRoot\template"
$Problemset = "D:\competitive\problemset"
$Backup = "D:\projects\codeforces"

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

Export-ModuleMember -Function New-Problem, Backup-Problems