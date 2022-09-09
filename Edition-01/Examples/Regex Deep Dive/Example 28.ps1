$MyPattern = @'
(?x)^                          # Ignore white space. Match start of string
[^"]*                          # Text before first quotation mark (none)
(?<QuoteSpans>                 # Rest of string
    (?<StartQuotePlusContents>     # '"' and level contents BEFORE deeper level
        (?<StartQuote>                 # Group stack used to count levels
            (?=[\p{P} ]|^)"                # '"' preceded by punctuation/space
        )                              #
        [^"]*                      # Level contents BEFORE deeper level
    )+                         # One or more, to ENTER multiple levels
    (?<EndQuoteAndPostfix>       # '"' and level contents AFTER deeper level
        (?<Quotes-StartQuote>      # Captures deeper level contents
            "(?=[\p{P} ]|$)            # '"' followed by punctuation/space/end
        )                          #
        [^"]*                      # Level contents AFTER deeper level
    )+                         # One or more, to EXIT multiple levels
)*                         # Zero or more, for multi-instances of same level
(?(StartQuote)(?!))        # If "StartQuote" has leftover captures, fail match
$                          # Match end of string
'@
