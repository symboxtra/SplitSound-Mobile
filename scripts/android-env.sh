#!/bin/bash

#########################################################
#                                                       #
#  To use the ANDROID_HOME and path variables exported  #
#           by this script, run the script as           #
#   '. ./android-env.sh' or 'source ./anrdoid-env.sh'   #
#                                                       #
#########################################################

RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[1;96m'
NC='\033[0m' # No color
echo

echo -e "${YELLOW}=== Android Environment Setup ===${NC}"

# Check if the environment variable is already defined
if [ -z "${ANDROID_HOME}" ]; then
    export ANDROID_HOME="${HOME}/Android/Sdk"

    echo
    echo -e "${BLUE}Environment variable ANDROID_HOME was not defined. Using default path: ${ANDROID_HOME}"
    echo -e "${NC}To change, add the following line to .bashrc:${NC}"
    echo -e "    export ANDROID_HOME=/path/to/sdk"
    echo
fi

# Trim trailing slash
export ANDROID_HOME="${ANDROID_HOME%/}"
# Export NDK location
export ANDROID_NDK_HOME="${ANDROID_HOME}/ndk-bundle"

echo -e "ANDROID_HOME=${ANDROID_HOME}"
echo -e "ANDROID_NDK_HOME=${ANDROID_NDK_HOME}"

# Setup required paths
# IMPORTANT: emulator must come after tools to receive higher path precendence
ANDROID_PATHS=("" "tools" "tools/bin" "emulator" "emulator/bin" "platform-tools")

for p in "${ANDROID_PATHS[@]}"
do
    # Check if path exists
    if [ ! -d "${ANDROID_HOME}/${p}" ]; then
        echo
        echo -e "${RED}=== Error ===${NC}"
        echo -e "Required path: ${ANDROID_HOME}/${p} did not exist."
        echo
        return 1 2> /dev/null # If sourced
        exit 1 # If run as script
    fi

    # Add to path
    export PATH="${ANDROID_HOME}/${p}:$PATH"

    echo -e "Added ${ANDROID_HOME}/${p} to PATH."
done

echo