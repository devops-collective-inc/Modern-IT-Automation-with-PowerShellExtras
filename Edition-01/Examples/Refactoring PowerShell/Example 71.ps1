    $XMLString = "
    <note>
    <to>Michael</to>
    <from>George</from>
    <type>Event</type>
    <body>Meet you at the park.</body>
    </note>
    "

    $Result = Select-Xml -Content $XMLString -XPath '//to'
    #
    # Example 1: Result object
    $Result
    #
    # Example 2: Actual XML node
    $Result.Node
