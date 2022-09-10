$MyArray = @(
    'Monday'
    'Tuesday'
    'Wednesday'
    'yesterday'
)

$MyArray -creplace '[A-Z]\w+(day)', 'to$1'
