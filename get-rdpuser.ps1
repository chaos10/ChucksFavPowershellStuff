#.SYNOPSIS
#  Receive e-mail alert on RDP login at windows servers
#.DESCRIPTION
#  Finds the details of latest RDP session and send e-mail to the administrator(s).
#.NOTES
#  Author:  Sreejesh Damodaran
#.EXAMPLE
#  .\Get-RDPUser
 
 
# From e-mail address
	$FromAddress = "fromemail@something.stf"
# To e-mail address
	$ToAddress = "toemail@something.stf"
# SMTP server address
	$SMTPAddress = “smptAddressGoesHere”
 
$USERDetails = @()
 
$a = "<style>"
$a = $a + "TABLE{border-width: 1px;border-style: solid;border-color:black;}"
$a = $a + "Table{background-color:#ffffff;border-collapse: collapse;}"
$a = $a + "TH{border-width:1px;padding:0px;border-style:solid;border-color:black;}"
$a = $a + "TR{border-width:1px;padding-left:5px;border-style:solid;border-color:black;}"
$a = $a + "TD{border-width:1px;padding-left:5px;border-style:solid;border-color:black;}"
$a = $a + "</style>"
			
			$Computer = hostname 
 			quser | Select-Object -Last 1 | ForEach-Object {
			
            $CurrentLine = $_.Trim() -Replace '\s+',' ' -Split '\s'
            $HashProps = @{
                UserName = $CurrentLine[0].replace(">","")
                ComputerName = $Computer
            }
			$HashProps.SessionName = $CurrentLine[1]
            $HashProps.Id = $CurrentLine[2]
            $HashProps.State = $CurrentLine[3]
            $HashProps.LogonTime = $CurrentLine[5..7] -join ' '
 
            $USERDetails = New-Object -TypeName PSCustomObject -Property $HashProps |
            Select-Object -Property UserName,ComputerName,State,LogonTime,SessionName
			$User = $USERDetails | Select -ExpandProperty  UserName
			
			$messageParameters = @{
			Subject = "[vCenter RDP Event] $User LoggedIn to $Computer "
    		Body = ( $USERDetails | ConvertTo-Html -Head $a |
        	Out-String -Width ([int]::MaxValue))
   			From = $FromAddress
   			To = $ToAddress
   		 	SmtpServer = $SMTPAddress
		}
	Send-MailMessage @messageParameters -BodyAsHtml
	}