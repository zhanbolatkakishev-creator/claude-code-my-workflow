param([string]$Docx, [string]$Xml, [string]$Pdf, [string]$Fn)
Add-Type -AssemblyName System.IO.Compression, System.IO.Compression.FileSystem
$zip = [System.IO.Compression.ZipFile]::Open($Docx, 'Update')
try {
  foreach ($pair in @(@("word/document.xml", $Xml), @("word/footnotes.xml", $Fn))) {
    if ($pair[1] -and (Test-Path $pair[1])) {
      $e = $zip.GetEntry($pair[0]); if ($e) { $e.Delete() }
      $n = $zip.CreateEntry($pair[0])
      $bytes = [System.IO.File]::ReadAllBytes($pair[1])
      $s = $n.Open(); $s.Write($bytes, 0, $bytes.Length); $s.Close()
    }
  }
} finally { $zip.Dispose() }
"injected"
if ($Pdf) {
  $word = New-Object -ComObject Word.Application
  $word.Visible = $false
  $word.DisplayAlerts = 0
  try {
    $tmp = $Docx + ".open.docx"
    Copy-Item $Docx $tmp -Force
    $doc = $word.Documents.Open($tmp, $false, $true)
    $doc.ExportAsFixedFormat($Pdf, 17)
    "PAGES: " + $doc.ComputeStatistics(2) + " TABLES: " + $doc.Tables.Count + " FOOTNOTES: " + $doc.Footnotes.Count
    $doc.Close($false)
    Remove-Item $tmp -Force
    "SUCCESS"
  } catch { "ERROR: " + $_.Exception.Message } finally { $word.Quit() }
}
