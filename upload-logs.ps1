param(
    [string]$logAnalyticsWorkspaceId,
    [string]$logAnalyticsWorkspaceKey,
    [string]$logFilePath,
    [string]$logType = "Selenium"
)

# Function to convert log data to JSON format
function Convert-LogToJSON {
    param(
        [string]$logData
    )

    $logLines = $logData -split "`n"
    $logEntries = @()

    foreach ($line in $logLines) {
        if (-not [string]::IsNullOrEmpty($line)) {
            $logEntries += @{
                LogEntry = $line
                TimeGenerated = (Get-Date).ToString("o")
            }
        }
    }

    return ($logEntries | ConvertTo-Json -Compress)
}

# Read the log file
$logData = Get-Content -Path $logFilePath -Raw

# Convert log data to JSON
$logJson = Convert-LogToJSON -logData $logData

$customerId = $logAnalyticsWorkspaceId
$sharedKey = $logAnalyticsWorkspaceKey
$method = "POST"
$contentType = "application/json"
$resource = "/api/logs"
$apiVersion = "2024-07-05"
$body = $logJson
$contentLength = $body.Length
$rfc1123date = [DateTime]::UtcNow.ToString("r")
$stringToHash = "POST`n$contentLength`n$contentType`n`"x-ms-date:$rfc1123date`"`n$resource"
$bytesToHash = [Text.Encoding]::UTF8.GetBytes($stringToHash)
$keyBytes = [Convert]::FromBase64String($sharedKey)
$hash = [System.Security.Cryptography.HMACSHA256]::new($keyBytes).ComputeHash($bytesToHash)
$signature = [Convert]::ToBase64String($hash)
$authorization = "SharedKey $customerId:$signature"

$headers = @{
    "Content-Type" = $contentType
    "Authorization" = $authorization
    "Log-Type" = $logType
    "x-ms-date" = $rfc1123date
    "time-generated-field" = "TimeGenerated"
}

$response = Invoke-RestMethod -Method $method -Body $body -Uri "https://$customerId.ods.opinsights.azure.com$resource?api-version=$apiVersion" -Headers $headers

Write-Output $response