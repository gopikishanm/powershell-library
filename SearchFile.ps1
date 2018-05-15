# This command let is for searching a given directory for specific file type
# The results provides the file name, along with last modified date and size
Function Search-Dir {
    [cmdletbinding()]
    Param(
    [string]$directoryPath,
    [string]$fileType
    )
    Process{
       #Get-ChildItem -Path $directoryPath -Filter $fileType -Recurse | % { Write-Host $_.FullName}
       $printArray=@()
       Get-ChildItem -Path $directoryPath -Filter $fileType -Recurse | ForEach-Object { 
       $item = New-Object -TypeName PSObject
       $item | Add-Member -Name FileName -Value $_.Name -MemberType NoteProperty
       $item | Add-Member -Name Directory -Value $_.Directory -MemberType NoteProperty
       $item | Add-Member -Name LastModified -Value $_.LastAccessTime -MemberType NoteProperty
       $item | Add-Member -Name Size -Value $_.Length -MemberType NoteProperty
       #Write-Host $item
       $printArray+=$item
      }
      $printArray | Format-Table
    }
}