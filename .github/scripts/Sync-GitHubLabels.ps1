#requires -Version 7.0
[CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'Low')]
param(
    [Parameter(Mandatory)][ValidatePattern('^[A-Za-z0-9][A-Za-z0-9-]*/[A-Za-z0-9_.-]+$')][string]$Repository,
    [switch]$Apply
)
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$manifest = Get-Content -LiteralPath (Join-Path $PSScriptRoot '../labels.json') -Raw | ConvertFrom-Json -AsHashtable
$known = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
foreach ($label in $manifest.labels) {
    if ($label.name -notmatch '^[a-z][a-z0-9:-]{0,49}$' -or $label.color -notmatch '^[0-9a-fA-F]{6}$' -or $label.description -isnot [string] -or $label.description.Length -gt 100) { throw 'Invalid label definition.' }
    if (-not $known.Add($label.name)) { throw 'Duplicate label definition.' }
}
function Invoke-Gh([string[]]$Arguments) {
    $result = & gh @Arguments
    if ($LASTEXITCODE -ne 0) { throw 'GitHub operation failed. Check remote state before retrying; existing labels were not overwritten.' }
    return $result
}
$actual = (Invoke-Gh @('repo','view',$Repository,'--json','nameWithOwner','--jq','.nameWithOwner')).Trim()
if (-not $actual.Equals($Repository,[StringComparison]::OrdinalIgnoreCase)) { throw 'Repository identity differs from the requested target.' }
$existing = @(Invoke-Gh @('api','--paginate',"repos/$Repository/labels?per_page=100",'--jq','.[].name'))
$missing = @($manifest.labels | Where-Object { $_.name -notin $existing })
$created = [Collections.Generic.List[string]]::new()
if ($Apply -and $missing.Count -gt 0 -and $PSCmdlet.ShouldProcess($Repository,"Create $($missing.Count) missing labels; retain all existing labels and descriptions")) {
    foreach ($label in $missing) {
        # No --force, deletion, renaming, recoloring or modification of existing labels.
        $null = Invoke-Gh @('label','create',$label.name,'--repo',$Repository,'--color',$label.color,'--description',$label.description)
        $created.Add($label.name)
    }
    $verified = @(Invoke-Gh @('api','--paginate',"repos/$Repository/labels?per_page=100",'--jq','.[].name'))
    if (@($manifest.labels | Where-Object { $_.name -notin $verified }).Count -gt 0) { throw 'Not all requested labels were confirmed on GitHub.' }
}
[pscustomobject]@{Repository=$actual;Missing=@($missing | ForEach-Object { $_.name });Created=@($created);ExistingLabelsPreserved=$true}
