param (
    [string]$Path = "C:\\Your\\Directory\\Path"
)

# Check if the path exists
if (-Not (Test-Path $Path)) {
    Write-Host "The path $Path does not exist." -ForegroundColor Red
    exit 1
}

# Get all folders in the specified path
$Folders = Get-ChildItem -Path $Path -Directory

# Create a formatted table output
$FormattedOutput = @()

Write-Host "`nScanning folder permissions...`n" -ForegroundColor Yellow

foreach ($Folder in $Folders) {
    # Get ACL (Access Control List) for the folder
    $ACL = Get-Acl -Path $Folder.FullName

    foreach ($AccessRule in $ACL.Access) {
        $FormattedOutput += [PSCustomObject]@{
            "Folder Name"   = $Folder.Name
            "User/Group"    = $AccessRule.IdentityReference
            "Access Rights" = $AccessRule.FileSystemRights
            "Access Type"   = $AccessRule.AccessControlType
        }
    }
}

# Display the formatted table in a visually organized way
if ($FormattedOutput.Count -eq 0) {
    Write-Host "No permissions found for the specified folders." -ForegroundColor Red
} else {
    Write-Host "`nPermission Details:`n" -ForegroundColor Green
    $FormattedOutput | Sort-Object "Folder Name" | Format-Table -AutoSize -Wrap
}
