$jsonPath = "C:\Users\dudoncy\.gemini\antigravity\brain\6c95011d-09c9-4c71-94d7-09200512fd2b\.system_generated\steps\12\output.txt"
$outDir = "C:\Users\dudoncy\Documents\chamdx\stitch_screens"

if (-Not (Test-Path $outDir)) {
    New-Item -ItemType Directory -Path $outDir | Out-Null
}

$json = Get-Content -Raw -Path $jsonPath | ConvertFrom-Json

foreach ($screen in $json.screens) {
    if ($screen.htmlCode -and $screen.htmlCode.downloadUrl) {
        $title = $screen.title -replace '[<>:"/\\|?*]', '_'
        $outFile = Join-Path $outDir "$title.html"
        Write-Host "Downloading $title to $outFile"
        Invoke-WebRequest -Uri $screen.htmlCode.downloadUrl -OutFile $outFile
    }
}

Write-Host "Done downloading screens."
