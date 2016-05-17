#simple script to list members of a windows domain group

#Ask user for domain group name
$grpName = Read-Host 'What group?'


dsquery group domainroot -name $grpName | dsget group -members | dsget user -samid -fn -ln -disabled