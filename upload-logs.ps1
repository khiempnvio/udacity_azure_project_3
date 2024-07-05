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

$customerId = $logAnalyticsWorkspaceId
$sharedKey = $logAnalyticsWorkspaceKey

# Read the log file
$logData = Get-Content -Path $logFilePath -Raw

# Convert log data to JSON
$logJson = Convert-LogToJSON -logData $logData


# Create the function to create the authorization signature
Function Build-Signature ($customerId, $sharedKey, $date, $contentLength, $method, $contentType, $resource)
{
    $xHeaders = "x-ms-date:" + $date
    $stringToHash = $method + "`n" + $contentLength + "`n" + $contentType + "`n" + $xHeaders + "`n" + $resource

    $bytesToHash = [Text.Encoding]::UTF8.GetBytes($stringToHash)
    $keyBytes = [Convert]::FromBase64String($sharedKey)

    $sha256 = New-Object System.Security.Cryptography.HMACSHA256
    $sha256.Key = $keyBytes
    $calculatedHash = $sha256.ComputeHash($bytesToHash)
    $encodedHash = [Convert]::ToBase64String($calculatedHash)
    $authorization = 'SharedKey {0}:{1}' -f $customerId,$encodedHash
    return $authorization
}

# Create the function to create and post the request
Function Post-LogAnalyticsData($customerId, $sharedKey, $body, $logType)
{
    $method = "POST"
    $contentType = "application/json"
    $resource = "/api/logs"
    $rfc1123date = [DateTime]::UtcNow.ToString("r")
    $contentLength = $body.Length
    $signature = Build-Signature `
        -customerId $customerId `
        -sharedKey $sharedKey `
        -date $rfc1123date `
        -contentLength $contentLength `
        -method $method `
        -contentType $contentType `
        -resource $resource
    $uri = "https://" + $customerId + ".ods.opinsights.azure.com" + $resource + "?api-version=2016-04-01"

    $headers = @{
        "Authorization" = $signature;
        "Log-Type" = $logType;
        "x-ms-date" = $rfc1123date;
        "time-generated-field" = $TimeStampField;
    }

    $response = Invoke-WebRequest -Uri $uri -Method $method -ContentType $contentType -Headers $headers -Body $body -UseBasicParsing
    return $response.StatusCode

}

# Submit the data to the API endpoint
Post-LogAnalyticsData -customerId $customerId -sharedKey $sharedKey -body ([System.Text.Encoding]::UTF8.GetBytes($logJson)) -logType $logType  

# $customerId = $logAnalyticsWorkspaceId
# $sharedKey = $logAnalyticsWorkspaceKey
# $method = "POST"
# $contentType = "application/json"
# $resource = "/api/logs"
# $apiVersion = "2024-07-05"
# $body = $logJson
# $contentLength = $body.Length
# $rfc1123date = [DateTime]::UtcNow.ToString("r")
# $stringToHash = $method + "`n" + $contentLength + "`n" + $contentType + "`n" + $rfc1123date + "`n" + $resource
# $bytesToHash = [Text.Encoding]::UTF8.GetBytes($stringToHash)
# $keyBytes = [Convert]::FromBase64String($sharedKey)
# $hash = [System.Security.Cryptography.HMACSHA256]::new($keyBytes).ComputeHash($bytesToHash)
# $signature = [Convert]::ToBase64String($hash)
# $authorization = "SharedKey $customerId:$signature"

# $headers = @{
#     "Content-Type" = $contentType
#     "Authorization" = $authorization
#     "Log-Type" = $logType
#     "x-ms-date" = $rfc1123date
#     "time-generated-field" = "TimeGenerated"
# }

# $response = Invoke-RestMethod -Method $method -Body $body -Uri "https://$customerId.ods.opinsights.azure.com$resource?api-version=$apiVersion" -Headers $headers

# Write-Output $response