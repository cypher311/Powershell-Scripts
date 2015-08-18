# Build user input box
[void][System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') 
$userName = [Microsoft.VisualBasic.Interaction]::InputBox("Enter username: ", "Username:") 

$outfile = "c:\temp\userinfo.txt"

[datetime]$origin = '1970-01-01 00:00:00'

# If reachable, grab data
$u = Get-ADUser $userName -Properties *
$user = $null
if ($u) {
    $user += @{"Name" = $u.GivenName + ' ' + $u.Initials + ' ' +$u.Surname}
    $user += @{"DistinguishedName" = $u.DistinguishedName}
    $user += @{"AccountExpirationDate" = $u.AccountExpirationDate}
    $user += @{"AccountLockoutTime" = $u.AccountLockoutTime}
    $user += @{"BadLogonCount" = $u.BadLogonCount}
    $user += @{"ChangePasswordAtLogon" = $u.ChangePasswordAtLogon}
    $user += @{"DisplayName" = $u.DisplayName}
    $user += @{"Office" = $u.Office}
    $user += @{"Enabled" = $u.Enabled}
    $user += @{"HomeDirectory" = $u.HomeDirectory}
    $user += @{"HomeDrive" = $u.HomeDrive}
    $user += @{"LastBadPasswordAttempt" = $u.LastBadPasswordAttempt}
    $user += @{"LastLogonDate" = $u.LastLogonDate}
    $user += @{"LockedOut" = $u.LockedOut}
    $user += @{"mail" = $u.mail}
    $user += @{"Modified" = $u.Modified}
    $user += @{"PasswordExpired" = $u.PasswordExpired}
    $user += @{"PasswordLastSet" = $u.PasswordLastSet}
    $user += @{"PasswordNeverExpires" = $u.PasswordNeverExpires}
    $user += @{"PasswordNotRequired" = $u.PasswordNotRequired}
    # If you use VPN tokens
    if ($u.'vasco-LinkUserToDPToken') {
        $user += @{"vasco-LinkUserToDPToken" = $u.'vasco-LinkUserToDPToken'}
        $user += @{"vasco-CreateTime" = $origin.AddSeconds($u.'vasco-CreateTime')}
        $user += @{"vasco-Disabled" = $u.'vasco-Disabled'}
        $user += @{"vasco-Locked" = $u.'vasco-Locked'}
        $user += @{"vasco-ModifyTime" = $origin.AddSeconds($u.'vasco-ModifyTime')}
    }
    $($user.GetEnumerator() | Sort Name) | Out-String -Width 300 | Out-File $outfile

} else {
    "Could not find $userName" | Out-File $outfile
}
notepad $outfile

# Give some time for notepad to open file
Start-Sleep -s 10
Remove-Item $outfile