    $XMLString = "
    <note>
    <to>Michael</to>
    <from>George</from>
    <type>Event</type>
    <body>Meet you at the park.</body>
    </note>
    "

    $XML = [XML]$XMLString

    #
    # Example 1: Use the SelectNodes method
    $XML.SelectNodes('//note')

    #
    # Example 2: Use the SelectSingleNode method
    $XML.SelectSingleNode('//to')
