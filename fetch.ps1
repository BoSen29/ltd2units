$headers = @{
    "x-api-key" = get-content apikey.txt
}

$baseuri = "https://apiv2.legiontd2.com/"

$data = Invoke-RestMethod -uri "$($baseuri)units/byName/harpy" -Headers $headers -Method Get
Write-Host "GAME VERSION " + $data.version

if ($data.version) {

    $units = Invoke-RestMethod -Uri "$($baseuri)units/byVersion/$($data.version)?limit=250" -Headers $headers -Method GET
    $units += Invoke-RestMethod -Uri "$($baseuri)units/byVersion/$($data.version)?limit=250&offset=250" -Headers $headers -Method GET
    
    $units | ForEach-Object {
        Set-Content -path "$($_.unitId).json" -Value ($_ | ConvertTo-Json -Depth 4)
    }
}
