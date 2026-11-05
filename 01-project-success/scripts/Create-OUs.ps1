# Root-OU
New-ADOrganizationalUnit -Name "Super" -Path "DC=Super,DC=net"

# Clients
New-ADOrganizationalUnit -Name "Clients" -Path "OU=Super,DC=Super,DC=net"
New-ADOrganizationalUnit -Name "Workstations" -Path "OU=Clients,OU=Super,DC=Super,DC=net"
New-ADOrganizationalUnit -Name "Servers" -Path "OU=Clients,OU=Super,DC=Super,DC=net"

# Users
New-ADOrganizationalUnit -Name "Users" -Path "OU=Super,DC=Super,DC=net"
New-ADOrganizationalUnit -Name "Standard" -Path "OU=Users,OU=Super,DC=Super,DC=net"

# Admins
New-ADOrganizationalUnit -Name "Admins" -Path "OU=Super,DC=Super,DC=net"

# Service Accounts
New-ADOrganizationalUnit -Name "ServiceAccounts" -Path "OU=Super,DC=Super,DC=net"

# Groups
New-ADOrganizationalUnit -Name "Groups" -Path "OU=Super,DC=Super,DC=net"
New-ADOrganizationalUnit -Name "Security" -Path "OU=Groups,OU=Super,DC=Super,DC=net"
New-ADOrganizationalUnit -Name "Distribution" -Path "OU=Groups,OU=Super,DC=Super,DC=net"
