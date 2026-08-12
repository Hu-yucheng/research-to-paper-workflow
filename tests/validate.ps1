$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot
$failures = [System.Collections.Generic.List[string]]::new()

function Add-Failure([string]$Message) {
    $failures.Add($Message)
}

$required = @(
    'SKILL.md',
    'agents/openai.yaml',
    'assets/research-dossier-template.md',
    'references/research-choice.md',
    'references/evidence-and-claims.md',
    'references/imrad-functions.md',
    'references/scientific-english.md',
    'references/audit-rubric.md',
    'references/source-map.md'
)

foreach ($relative in $required) {
    $full = Join-Path $repoRoot $relative
    if (-not (Test-Path -LiteralPath $full -PathType Leaf)) {
        Add-Failure "Missing required file: $relative"
    }
}

$textExtensions = @('.md', '.yaml', '.yml', '.ps1', '.gitignore', '')
$textFiles = Get-ChildItem -LiteralPath $repoRoot -Recurse -File |
    Where-Object {
        $_.FullName -notmatch '[\\/]\.git[\\/]' -and
        $_.Extension -in $textExtensions
    }
$strictUtf8 = [System.Text.UTF8Encoding]::new($false, $true)
$allText = [System.Collections.Generic.List[string]]::new()
$runtimeText = [System.Collections.Generic.List[string]]::new()

foreach ($file in $textFiles) {
    if ($file.Length -eq 0) {
        Add-Failure "Empty file: $($file.FullName.Substring($repoRoot.Length + 1))"
        continue
    }
    try {
        $decoded = $strictUtf8.GetString([System.IO.File]::ReadAllBytes($file.FullName))
        $allText.Add($decoded)
        $relativePath = $file.FullName.Substring($repoRoot.Length + 1)
        if ($relativePath -eq 'SKILL.md' -or $relativePath -match '^(agents|assets|references)[\\/]') {
            $runtimeText.Add($decoded)
        }
    } catch {
        Add-Failure "Invalid UTF-8: $($file.FullName.Substring($repoRoot.Length + 1))"
    }
}

$imageFiles = Get-ChildItem -LiteralPath $repoRoot -Recurse -File -Filter '*.png' |
    Where-Object { $_.FullName -notmatch '[\\/]\.git[\\/]' }
foreach ($file in $imageFiles) {
    $bytes = [System.IO.File]::ReadAllBytes($file.FullName)
    $signature = if ($bytes.Length -ge 8) {
        [System.BitConverter]::ToString($bytes[0..7])
    } else {
        ''
    }
    if ($signature -ne '89-50-4E-47-0D-0A-1A-0A') {
        Add-Failure "Invalid PNG signature: $($file.FullName.Substring($repoRoot.Length + 1))"
    }
}

$skillPath = Join-Path $repoRoot 'SKILL.md'
$skill = Get-Content -Raw -Encoding UTF8 $skillPath
$frontmatterMatch = [regex]::Match($skill, '\A---\r?\n(?<yaml>.*?)\r?\n---\r?\n', 'Singleline')
if (-not $frontmatterMatch.Success) {
    Add-Failure 'SKILL.md frontmatter is missing or malformed.'
} else {
    $keys = [regex]::Matches($frontmatterMatch.Groups['yaml'].Value, '(?m)^([A-Za-z0-9_-]+):') |
        ForEach-Object { $_.Groups[1].Value }
    if (($keys -join ',') -ne 'name,description') {
        Add-Failure "Frontmatter keys must be exactly name,description; got $($keys -join ',')."
    }
}

if ($skill -notmatch '(?m)^name: research-to-paper-workflow$') {
    Add-Failure 'Skill name is incorrect.'
}
if ($skill -notmatch '(?m)^description: Use when') {
    Add-Failure 'Description must start with Use when.'
}

$routes = @(
    'A. Research Choice',
    'B. Evidence and Claim',
    'C. IMRaD Construction',
    'D. Scientific English',
    'E. Pre-Submission Audit'
)
foreach ($route in $routes) {
    if (-not $skill.Contains($route)) { Add-Failure "Missing route: $route" }
}

$decisionCardMatch = [regex]::Match(
    $skill,
    '(?ms)## Output the Decision Card.*?```markdown\s*(?<card>.*?)```'
)
$decisionFieldCount = 0
if (-not $decisionCardMatch.Success) {
    Add-Failure 'Decision-card code block is missing.'
} else {
    $decisionFieldCount = [regex]::Matches(
        $decisionCardMatch.Groups['card'].Value,
        '(?m)^- .+\p{P}\s*$'
    ).Count
    if ($decisionFieldCount -ne 8) {
        Add-Failure "Decision card must contain 8 fields; got $decisionFieldCount."
    }
}

$combined = $runtimeText -join "`n"
if ($combined -match '(?i)\bTODO\b|\bTBD\b') {
    Add-Failure 'Unresolved drafting marker found.'
}
if (([regex]::Matches($combined, '```').Count % 2) -ne 0) {
    Add-Failure 'Unbalanced fenced code blocks.'
}

$links = [regex]::Matches($skill, '\[[^\]]+\]\((?<path>[^)]+\.md)\)')
foreach ($link in $links) {
    $target = Join-Path $repoRoot $link.Groups['path'].Value
    if (-not (Test-Path -LiteralPath $target -PathType Leaf)) {
        Add-Failure "Broken local link: $($link.Groups['path'].Value)"
    }
}

$markdownFiles = Get-ChildItem -LiteralPath $repoRoot -Recurse -File -Filter '*.md' |
    Where-Object { $_.FullName -notmatch '[\\/]\.git[\\/]' }
foreach ($markdownFile in $markdownFiles) {
    $markdown = Get-Content -Raw -Encoding UTF8 $markdownFile.FullName
    $markdownWithoutCodeFences = [regex]::Replace($markdown, '(?ms)```.*?```', '')
    $localLinks = [regex]::Matches($markdownWithoutCodeFences, '\[[^\]]+\]\((?<path>[^)#]+)\)')
    foreach ($localLink in $localLinks) {
        $relativeTarget = $localLink.Groups['path'].Value
        if ($relativeTarget -match '^[a-z]+://' -or $relativeTarget.StartsWith('<')) { continue }
        $target = Join-Path $markdownFile.DirectoryName $relativeTarget
        if (-not (Test-Path -LiteralPath $target)) {
            Add-Failure "Broken Markdown link in $($markdownFile.Name): $relativeTarget"
        }
    }
}

$audit = Get-Content -Raw -Encoding UTF8 (Join-Path $repoRoot 'references/audit-rubric.md')
foreach ($priority in @('P0', 'P1', 'P2', 'P3')) {
    if (-not $audit.Contains($priority)) { Add-Failure "Missing audit level: $priority" }
}

$openaiYaml = Get-Content -Raw -Encoding UTF8 (Join-Path $repoRoot 'agents/openai.yaml')
if (-not $openaiYaml.Contains('Research to Paper Workflow')) {
    Add-Failure 'Missing display name in agents/openai.yaml.'
}
if (-not $openaiYaml.Contains('$research-to-paper-workflow')) {
    Add-Failure 'Default prompt does not name the Skill.'
}

$unexpectedBinary = Get-ChildItem -LiteralPath $repoRoot -Recurse -File |
    Where-Object {
        $_.FullName -notmatch '[\\/]\.git[\\/]' -and
        $_.Extension -notin @('.md', '.yaml', '.yml', '.ps1', '.gitignore', '.png', '')
    }
foreach ($file in $unexpectedBinary) {
    Add-Failure "Unexpected file type: $($file.FullName.Substring($repoRoot.Length + 1))"
}

$gitCheck = & git -C $repoRoot diff --check 2>&1
if ($LASTEXITCODE -ne 0 -or $gitCheck) {
    Add-Failure "git diff --check reported: $($gitCheck -join '; ')"
}

if ($failures.Count -gt 0) {
    $failures | ForEach-Object { Write-Output "FAIL: $_" }
    Write-Output "STRUCTURAL_VALIDATION_FAILURES=$($failures.Count)"
    exit 1
}

Write-Output "STRUCTURAL_VALIDATION_OK"
Write-Output "RUNTIME_FILES=$($required.Count)"
Write-Output "TEXT_FILES_CHECKED=$($textFiles.Count)"
Write-Output "IMAGE_FILES_CHECKED=$($imageFiles.Count)"
Write-Output "ROUTES=$($routes.Count)"
Write-Output "DECISION_FIELDS=$decisionFieldCount"
Write-Output "STRUCTURAL_VALIDATION_FAILURES=0"
