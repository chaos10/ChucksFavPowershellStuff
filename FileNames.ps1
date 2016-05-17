out-host -inputobject "-------------Getting srted here---------"

#Ask user for path
$upath = Read-Host 'What path?'

#Read file names into variable Filenamehere
$Filenamehere = Get-ChildItem $upath -name

#Write filenames to console
ForEach-Object {
    Write-Host $Filenamehere + " More Stuff "
    }
    write-host "breakline"
foreach($a in $Filenamehere)
{
    write-host $a  - MoreStuff 
}    

#Add path to output file name
$upathwithfilename = $upath + '\FileNames.txt'

#Output list to Filenames.txt in designated folder
$Filenamehere | Out-File $upathwithfilename
