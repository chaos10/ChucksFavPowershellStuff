#.SYNOPSIS
#  Copy to archive sub folder today's file
#.DESCRIPTION
#  No idea how this will work
#.NOTES
#  Author:  Chuck Vogelbacher
#.EXAMPLE
#  .\ArchiveFileUtility

#Ask user for path
$upath = Read-Host 'What path?'

#Set source path
$upath = 'ServerLocationGoesHere'

#Output path to archive
$outputpathtoarchive = $upath + '\Archive'

#robocopy copy file older than /maxage:N
robocopy $upath $outputpathtoarchive /maxage:1



