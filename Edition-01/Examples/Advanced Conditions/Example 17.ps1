# Example 1: Using -as for type conversion to cast a string to a URI
"https://example.com" -as [URI] | Format-Table

# Example 2: Using typecasting to cast a string to a URI
[URI]"https://example.com" | Format-Table
