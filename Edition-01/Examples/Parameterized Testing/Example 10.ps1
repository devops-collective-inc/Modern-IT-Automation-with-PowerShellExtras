Describe 'Building' {
    It '<_> should not be null or empty' -ForEach @(
        'Post', 'B2F1', 'B2F2', 'Contoso', 'Fabrikam'
    ) {
        $_ | Should -Not -BeNullorempty
    }
}
