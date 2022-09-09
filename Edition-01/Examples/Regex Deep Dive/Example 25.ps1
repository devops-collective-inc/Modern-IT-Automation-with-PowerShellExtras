$MyPattern = '^(\{)?[a-f0-9]{8}-[a-f0-9]{4}-[0-4][a-f0-9]{3}-' +
    '[ab89][a-f0-9]{3}-[a-f0-9]{12}(?(1)\})$'

'96d30676-14d2-411c-b3f7-78f1708221e2' -imatch $MyPattern
'{96d30676-14d2-411c-b3f7-78f1708221e2' -imatch $MyPattern
'96d30676-14d2-411c-b3f7-78f1708221e2}' -imatch $MyPattern
'{96d30676-14d2-411c-b3f7-78f1708221e2}' -imatch $MyPattern
