#!/bin/bash
# deploy.sh - A simple deployment script
# This script copies the build artifacts to the target deployment directory.

# Exit immediately if any command fails
set -e


echo "Deployment completed successfully! Wow"
# Define variables
# BUILD_DIR="build"
# TARGET_DIR="/var/www/myapp"  # Update this path to your actual deployment directory

# echo "Starting deployment process..."

# # Check if the build directory exists
# if [ ! -d "${BUILD_DIR}" ]; then
#   echo "Error: Build directory '${BUILD_DIR}' does not exist."
#   exit 1
# fi

# # Create the target directory if it does not exist
# if [ ! -d "${TARGET_DIR}" ]; then
#   echo "Target directory '${TARGET_DIR}' does not exist. Creating..."
#   mkdir -p "${TARGET_DIR}"
# fi

# # Remove old files from the target directory
# echo "Cleaning target directory '${TARGET_DIR}'..."
# rm -rf "${TARGET_DIR:?}"/*

# # Copy new build artifacts to the target directory
# echo "Deploying build from '${BUILD_DIR}' to '${TARGET_DIR}'..."
# cp -r "${BUILD_DIR}"/* "${TARGET_DIR}/"

# echo "Deployment completed successfully!"
