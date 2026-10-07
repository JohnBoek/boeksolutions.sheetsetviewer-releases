#requires -Version 7.0
[CmdletBinding()]
param(
    [Parameter(Mandatory)][ValidatePattern('^(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)$')][string]$BaseVersion,
    [Parameter(Mandatory)][ValidateRange(1,[long]::MaxValue)][long]$PullRequest,
    [Parameter(Mandatory)][ValidateRange(1,[long]::MaxValue)][long]$BuildId,
    [ValidateRange(1,[int]::MaxValue)][int]$Attempt = 1,
    [ValidatePattern('^[0-9a-fA-F]{7,40}$')][string]$Commit
)
Set-StrictMode -Version Latest
# Pure calculation: no file writes, Git commands, network or stable version bump.
$review = "$BaseVersion-pr.$PullRequest.$BuildId.$Attempt"
$informational = if ($Commit) { "$review+g$($Commit.ToLowerInvariant())" } else { $review }
[pscustomobject]@{
    BaseVersion = $BaseVersion
    ReviewVersion = $review
    InformationalVersion = $informational
    ArtifactLabel = "review-pr-$PullRequest-build-$BuildId-attempt-$Attempt"
    Channel = 'review'
}
