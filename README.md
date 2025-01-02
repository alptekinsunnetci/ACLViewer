# ACLViewer

This PowerShell script scans the specified directory for folder permissions and generates a detailed table of access rights for each folder.

## Features

- Checks if the specified directory exists.
- Retrieves all folders within the specified directory.
- Scans folder permissions using the Access Control List (ACL).
- Displays a formatted table with:
  - Folder Name
  - User/Group
  - Access Rights
  - Access Type

## Requirements

- Windows PowerShell 5.1 or later.
- Administrator privileges may be required to access certain folder permissions.

## Parameters

| Parameter | Description                       | Default Value                |
|-----------|-----------------------------------|------------------------------|
| `Path`    | The directory to scan for folders | `C:\Your\Directory\Path`    |

## How to Use

1. Save the script as `ACLViewer.ps1`.
2. Open PowerShell with appropriate permissions.
3. Run the script using the following command:

   ```powershell
   .\ACLViewer.ps1 -Path "C:\Your\Directory\Path"
   ```

   Replace `"C:\Your\Directory\Path"` with the directory you want to scan.

## Output

- If the directory does not exist:
  ```
  The path [specified path] does not exist.
  ```

- If no permissions are found:
  ```
  No permissions found for the specified folders.
  ```

- If permissions are found, the script displays a formatted table with details:

  ```plaintext
  Permission Details:
  
  Folder Name       User/Group              Access Rights         Access Type
  ------------      ---------------------   -------------------   ------------
  Folder1           DOMAIN\User             ReadAndExecute        Allow
  Folder2           BUILTIN\Administrators  FullControl           Allow
  ```

## Notes

- The script utilizes `Get-Acl` to retrieve folder permissions.
- The output is sorted by folder name for better readability.
- Ensure you have sufficient permissions to access the target directory and its subfolders.

## License

This script is provided "as-is" without any warranty. Use it at your own risk.

