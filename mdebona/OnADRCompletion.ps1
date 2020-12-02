[CmdletBinding()]
param(
    # Name of the site server returned by the Status Filter Rule
    [Parameter(Mandatory = $true)]
    [String] $SiteServer,
    # Site code returned by the Status Filter Rule
    [Parameter(Mandatory = $true)]
    [String] $SiteCode,
    # Description of the Status Message returned by the Status Filter Rule
    [Parameter(Mandatory = $true)]
    [String] $Description
)

# Import the ConfigurationManager.psd1 module
if (-not(Get-Module ConfigurationManager)) {
    try {
        Import-Module ("{0}\..\ConfigurationManager.psd1" -f $ENV:SMS_ADMIN_UI_PATH)
    }
    catch {
        Exit 1
    }
}

# Create the site's PSDrive if it has not been created automatically during the module importation
If(-not(Get-PSDrive $SiteCode)) {
    try {
        New-PSDrive -Name $SiteCode -PSProvider "AdminUI.PS.Provider\CMSite" -Root $SiteServer | Out-Null
    }
    catch {
        Exit 1
    }
}

# Set the location to the Configuration Manager PSDrive to be able to use MEMCM Powershell commands
Set-Location "$($SiteCode):"

# Regex to capture the name of the created SUG and the creation date
[regex]$Regex = "CI Assignment Manager successfully processed new CI Assignment\s+(?<Name>.*)\s(?<Date>\d{4}-\d{2}-\d{2})"

# Use the Regex on the Description variable to extract the SUG's name and creation date. Store the values in variables
$Description | Select-String -Pattern $Regex -AllMatches | ForEach-Object {
    [string]$DeploymentName = $_.Matches.Groups[$Regex.GroupNumberFromName("Name")].Value
    [string]$DeploymentDate = $_.Matches.Groups[$Regex.GroupNumberFromName("Date")].Value
}

# Check the SUG name. If it contains the word "Definition", it is a SUG containing the Windows Defender definitionsso the script stops
# Can be changeg to whatever fits best your environment
If ($DeploymentName -notlike "*Definition*") {
    # Look for a SUG with the same name and creation date. If it exists, the script continues. Otherwise, it stops.
    If ($SUG = Get-CMSoftwareUpdateGroup -Name "$($DeploymentName)*" | Where-Object {(Get-Date $_.DateCreated -Format 'yyyy-MM-dd') -eq (Get-Date $DeploymentDate -Format 'yyyy-MM-dd')}) {
        # Create a new name without the SUG's creation time, keeping only the name and creation date. Then, rename the SUG
        $NewSUGName = "$DeploymentName $DeploymentDate"
        Set-CMSoftwareUpdateGroup -InputObject $SUG -NewName $NewSUGName

        # If the SUG name matches a specific name, set the maximum execution time of each updates in the SUG to 120 minutes
        If($DeploymentName -match '^ADR_WinServ') {
            ForEach ($Update in (Get-CMSoftwareUpdate -UpdateGroupID $SUG.CI_ID -Fast)) {
                Set-CMSoftwareUpdate -InputObject $Update -MaximumExecutionMins 120
            }
        }

        # Define some CSS style that will be added to the HTML report header
        $HtmlHeader = @"
<style>
    body {
        font-size: 12px;
        font-family: Arial, Helvetica, sans-serif;
    }
    table {
        font-size: 12px;
        border: 0px;
        font-family: Arial, Helvetica, sans-serif;
    }

    td {
        padding: 4px;
        margin: 0px;
        border: 0;
    }

    th {
        background: #395870;
        background: linear-gradient(#49708f, #293f50);
        color: #fff;
        font-size: 11px;
        text-transform: uppercase;
        padding: 10px 15px;
        vertical-align: middle;
    }

    tbody tr:nth-child(even) {
        background: #f0f0f2;
}
</style>
"@

        # Define the text that will be part of the HTML report in a herestring. Be careful with "@
        $PreContent = @"
Hello, <br/><br/>

The $NewSUGName Software Update Group has been created. It contains the following updates:<br/><br/>
"@
        
        # Build an array of PS Objects each containing the KB ID, KB Name and execution time
        $Info = @()
        ForEach ($Update in (Get-CMSoftwareUpdate -UpdateGroupID $SUG.CI_ID -Fast))
            {
            $UpdateProperties = [PSCustomObject]@{
                KB = $Update.ArticleID
                Titre = $Update.LocalizedDisplayName
                # Though it's set in minutes, the execution time is stored in seconds so we need to divide it by 60 to display the value in minutes
                "Max execution time (mins)" = $Update.MaxExecutionTime / 60
            }
            $Info += $UpdateProperties
        }

        # Build an HTML table out of the previous array and add the header and precontent text
        $Info | ConvertTo-Html -As Table -PreContent $PreContent -Head $HtmlHeader | Out-File "C:\Temp\$NewSUGName.html"
    }
}