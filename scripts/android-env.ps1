#########################################################
#                                                       #
#         Android Windows Environment setup             #
#                                                       #
#########################################################

""

Write-Host "=== Android Environment Setup ===" -Foreground Yellow

# Check if the environment variable is already defined
if (-not $ENV:ANDROID_HOME)
{
    $ENV:ANDROID_HOME="$ENV:LOCALAPPDATA\Android\Sdk"

    ""
    Write-Host "Environment variable ANDROID_HOME was not defined. Using default path: ${ENV:ANDROID_HOME}" -Foreground Cyan
    Write-Host "To change, run the following commands or add the ANDROID_HOME environment variable in Windows."
    Write-Host "    [Environment]::SetEnvironmentVariable('ANDROID_HOME', 'C:\Path\to\Sdk', 'User')"
    Write-Host '    $ENV:ANDROID_HOME=C:\Path\to\Sdk'
    ""
}

# Set NDK location
$ENV:ANDROID_NDK_HOME="${ENV:ANDROID_HOME}\ndk-bundle"

Write-Host "ENV:ANDROID_HOME=${ENV:ANDROID_HOME}"
Write-Host "ENV:ANDROID_NDK_HOME=${ENV:ANDROID_NDK_HOME}"

# Setup required paths
# IMPORTANT: emulator must come after tools to receive higher path precendence
$ANDROID_PATHS = @("", "tools", "tools\bin", "emulator", "emulator\bin", "platform-tools")

ForEach ($p in $ANDROID_PATHS)
{
    # Check if path exists
    if (-not (Test-Path "${ENV:ANDROID_HOME}\${p}"))
    {
        ""
        Write-Host "${RED}=== Error ===${NC}" -Foreground Red
        Write-Host "Required path: ${ENV:ANDROID_HOME}\${p} did not exist."
        ""
        exit 1
    }

    # Add to path
    $ENV:PATH="${ENV:ANDROID_HOME}\${p};$ENV:PATH"

    Write-Host "Added ${ENV:ANDROID_HOME}\${p} to PATH."
}

""