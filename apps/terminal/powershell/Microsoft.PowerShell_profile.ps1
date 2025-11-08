# Profile with timing
$profile_start_time = Get-Date

try {
    [Console]::InputEncoding  = [System.Text.Encoding]::UTF8
    [Console]::OutputEncoding = [System.Text.Encoding]::UTF8
    $OutputEncoding = [System.Text.UTF8Encoding]::new($false)
    chcp 65001 > $null
} catch {}

Write-Host ""
# Run Fastfetch with config
if (Get-Command fastfetch -ErrorAction SilentlyContinue) {
    fastfetch -c "$env:USERPROFILE/.config/fastfetch/config.jsonc"
}

$profile_load_time = [math]::Round(((Get-Date) - $profile_start_time).TotalMilliseconds)