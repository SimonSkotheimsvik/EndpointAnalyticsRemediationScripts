<#
Version: 1.0
Author: 
- Joey Verlinden (www.joeyverlinden.com)
- Andrew Taylor (andrewstaylor.com)
- Florian Slazmann (scloud.work)
- Jannik Reinhard (jannikreinhard.com)
Script: remediation-ODFolderOffline
Description:
Release notes:
Version 1.0: Init
#> 

$CompanyName = "scloud" # company name you habe in your OneDrive sync
$ODFolder = "Desktop"

try{

    # OneDrive Path
    $OneDrive_path = "C:\Users\$env:username\OneDrive - $CompanyName\$ODFolder"

    # Process main folder 
    attrib.exe $OneDrive_path -U +P /s /d

    # Process child items 
    Get-ChildItem $OneDrive_path -Recurse | Select-Object Fullname | ForEach-Object { attrib.exe $_.FullName -U +P }

}catch{
    Write-Error $_
}
