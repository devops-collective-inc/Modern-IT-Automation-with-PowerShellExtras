Get-CAAuthorityInformationAccess |
  Where-Object -FilterScript {$_.Uri -notlike ('{0}*' -f $env:SystemRoot)} |
    Remove-CAAuthorityInformationAccess -Force
