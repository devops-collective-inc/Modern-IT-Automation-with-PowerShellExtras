'$12.00 ($12.99 inc. tax)' -match '\($(\d+\.\d{2}) inc. tax'
#                                    ^
# Mistake: Literal dollar sign should be escaped: \$

'$12.00 ($12.99 inc. tax)' -match '\(\$(\d+\.\d{2}) inc. tax'
$Matches[1]
