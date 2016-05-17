#.SYNOPSIS
#  Delete backup files older than 2 weeks
#.DESCRIPTION
#  No idea how this will work
#.NOTES
#  Author:  Chuck Vogelbacher
#.EXAMPLE
#  .\BackupFileMaintenanceUtility

#Ask user for path
$upath = Read-Host 'What path?'

#Set source path
$upath = 'ServerLocationGoesHere'

#Set max age
$limit = (Get-Date).AddDays(-14)
#$path = "C:\Some\Path"

# Delete files older than the $limit.
Get-ChildItem -Path $upath  -Recurse | Where-Object { !$_.PSIsContainer -and $_.lastwritetime  -lt $limit } | Remove-Item 


