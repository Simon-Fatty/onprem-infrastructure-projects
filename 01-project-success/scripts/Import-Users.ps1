# 1. Inställningar - ÄNDRA DESSA TILL DIN DOMÄN
$domainDN = "DC=Super,DC=net"  # Exempel: DC=foretag,DC=se
$baseOU = "OU=Super,$domainDN"   # Rot-mappen där allt ska hamna

# Skapa bas-OU om den inte finns
if (!(Get-ADOrganizationalUnit -Filter "DistinguishedName -eq '$baseOU'")) {
    New-ADOrganizationalUnit -Name "Super" -Path $domainDN
}

# Startlösenordet anges vid körning i stället för att stå i klartext i skriptet.
# Användaren måste byta det vid första inloggning (ChangePasswordAtLogon).
$securePass = Read-Host -AsSecureString "Startlösenord för nya användare"

# 2. Importera CSV-filen (viktigt med semikolon)
$users = Import-Csv -Path "C:\Temp\Projekt Success Users.csv" -Delimiter ';'

foreach ($user in $users) {
    $dept = $user.Department
    $office = $user.Office

    # Skapa unik OU för avdelningen om den saknas
    $deptOU = "OU=$dept,$baseOU"
    if (!(Get-ADOrganizationalUnit -Filter "DistinguishedName -eq '$deptOU'")) {
        New-ADOrganizationalUnit -Name $dept -Path $baseOU
        Write-Host "Skapade OU: $dept" -ForegroundColor Cyan
    }

    # Skapa grupp för avdelningen om den saknas
    if (!(Get-ADGroup -Filter "Name -eq '$dept'")) {
        New-ADGroup -Name $dept -GroupCategory Security -GroupScope Global -Path $deptOU
        Write-Host "Skapade gruppen: $dept" -ForegroundColor Blue
    }

    # Skapa användarnamn (t.ex. 1072_Simon) för att garantera att det är unikt
    $sAMAccountName = "$($user.EmployeeID)_$($user.FirstName)".ToLower()

    # Kontrollera om användaren finns
    if (!(Get-ADUser -Filter "SamAccountName -eq '$sAMAccountName'")) {
        # Skapa användaren
        $userParams = @{
            Name              = $user.FullName
            GivenName         = $user.FirstName
            Surname           = $user.LastName
            SamAccountName    = $sAMAccountName
            UserPrincipalName = "$sAMAccountName@super.net" # Ändra domän här
            Path              = $deptOU
            Department        = $dept
            Office            = $office
            Description       = "Anställd nr $($user.EmployeeID)"
            Enabled           = $true
            ChangePasswordAtLogon = $true
            PasswordNeverExpires = $false
        }

        New-ADUser @userParams -AccountPassword $securePass

        # Lägg till användaren i avdelningens grupp
        Add-ADGroupMember -Identity $dept -Members $sAMAccountName

        Write-Host "Klar: $($user.FullName) tillagd i $dept" -ForegroundColor Green
    }
    else {
        Write-Host "Finns redan: $sAMAccountName" -ForegroundColor Yellow
    }
}
