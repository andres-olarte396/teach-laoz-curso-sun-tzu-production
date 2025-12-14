Add-Type -AssemblyName System.Speech
$synthesizer = New-Object System.Speech.Synthesis.SpeechSynthesizer

# Intentar seleccionar una voz en español
$voices = $synthesizer.GetInstalledVoices()
$spanishVoice = $voices | Where-Object { $_.VoiceInfo.Culture -like "es-*" } | Select-Object -First 1

if ($spanishVoice) {
    $synthesizer.SelectVoice($spanishVoice.VoiceInfo.Name)
    Write-Host "Voz seleccionada: $($spanishVoice.VoiceInfo.Name)" -ForegroundColor Green
} else {
    Write-Warning "No se encontró voz en español nativa. Usando voz por defecto (puede sonar extraño)."
}

$rootPath = "e:\MyRepos\education\teach-laoz-courses-generator\cursos\teach-laoz-curso-sun-tzu-production\modulos"
$scripts = Get-ChildItem -Path $rootPath -Recurse -Filter "*_guion_optimizada.txt"

foreach ($script in $scripts) {
    $audioPath = $script.FullName.Replace("_guion_optimizada.txt", ".wav")
    Write-Host "Generando audio para: $($script.Name) -> $($audioPath | Split-Path -Leaf)"
    
    $text = Get-Content $script.FullName -Raw -Encoding UTF8
    
    try {
        $synthesizer.SetOutputToWaveFile($audioPath)
        $synthesizer.Speak($text)
        $synthesizer.SetOutputToNull()
    } catch {
        Write-Error "Error generando audio para $($script.Name): $_"
    }
}

Write-Host "Proceso de generación de audio completado." -ForegroundColor Cyan
