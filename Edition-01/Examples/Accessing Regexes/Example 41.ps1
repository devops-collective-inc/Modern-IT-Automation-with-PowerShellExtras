$MyPattern = '(\d\1)+'

'NORM, 1:   ' + [regex]::Match('1', $MyPattern).Value
'ECMA, 1:   ' + [regex]::Match('1', $MyPattern, 'ECMAScript').Value

'NORM, 11:  ' + [regex]::Match('11', $MyPattern).Value
'ECMA, 11:  ' + [regex]::Match('11', $MyPattern, 'ECMAScript').Value

'NORM, 111: ' + [regex]::Match('111', $MyPattern).Value
'ECMA, 111: ' + [regex]::Match('111', $MyPattern, 'ECMAScript').Value
