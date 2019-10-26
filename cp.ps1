$ausers = @(user1,user2,user3)
#authorized users^^^^

$dusers = @(user4, user5, user6)
#all users^^^^

foreach $user in $dusers {

if ($ausers -match $user)
    {
	foreach $user in $ausers {
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




