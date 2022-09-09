$XMLString = @'
<?xml version="1.0" encoding="utf-8"?>
<resources>
  <string name="app_name">$projectname$</string>
</resources>
'@

# TypeCast the FileContents as an XML.
$XMLObject = [XML]$XMLString
$XMLObject
