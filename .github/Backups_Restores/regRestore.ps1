<#
    .SYNOPSIS
    This will restore corrupted or missing registry gives using system restore points.
    .DESCRIPTION
    This script will help you restore corrupted or missing registry hives using available system restore points on a Windows machine. It automates the process of locating the latest restore point and copying the necessary registry files back to their original locations.
    Therefore you must have system restore points enabled on your machine.

    When windows boots up it will go into automatic repair mode if it detects corrupted or missing registry hives.
    
    First Open Command Prompt in the Automatic Repair mode.
    Then run the following commands:
#>

// first we check if we have system restore points available.
// Enter diskpart
list list-volmes    // this is to identify the drive letter assigned to your Windows installation.

//exit diskpart
// then you can further check in the drive. And assuming your Windows installation is in C: drive

C:\Windows\System32\vssadmin.exe list shadows
// this will list all the available restore points on your machine along with their shadow copy IDs.
// identify the safest and latest restore point available.
// then run the following command to copy the registry hives from the restore point to your Windows installation.
C:\>copy <shadow copy volume path>\windows\system32\config\*.* C:\Windows\System32\config\Regback\
C:\Windows\System32\config\Regback>copy SYSTEM ..\  //this will copy the SYSTEM hive in Regback folder to config folder.
