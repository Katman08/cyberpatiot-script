$ausers = @("user1", "user2", "user3")
#authorized users^^^^

$dusers = @("user4", "user5", "user6")
#all users^^^^

Disable-LocalUser -name "Guest"
Disable-LocalUser -name "Administrator"

foreach ($user in $dusers) {

if ($ausers -match $user)
    {
	foreach ($user in $ausers) {
	Set-LocalUser -name $user -Password "Password@1" -PasswordNeverExpires false -UserMayChangePassword true
	#changes passwords to "Password@1", disables passwordneverexpires, and allows changing password
	}
	
	}
else
{
Disable-LocalUser -name $user
}
}

Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
#enable Windows Firewall

Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
#disable Remote Desktop

C:\Users\USERNAME\Desktop\cp.bat
#run password policy batch
#######EDIT WITH FILE LOCATION##########
