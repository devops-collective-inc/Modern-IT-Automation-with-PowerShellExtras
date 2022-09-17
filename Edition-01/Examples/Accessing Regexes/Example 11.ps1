# Unnamed capture ignored
'Red,Green,Blue' -split '(,)', 100, 'ExplicitCapture'

# Capture with name 'name' captures the delimiter
'Red,Green,Blue' -split '(?<name>,)', 100,
    'ExplicitCapture'
