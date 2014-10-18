#!/bin/sh

# http://www.raizlabs.com/dev/2014/03/specifying-the-build-configuration-for-xcode-project-dependencies/

xcodebuild \
    -project "External/ReactiveCocoa/External/LlamaKit/LlamaKit.xcodeproj" \
    -target "LlamaKit-iOS" \
    -configuration "${SUBPROJECT_CONFIG}" \
    -sdk "${SDK_NAME}" \
    BUILD_DIR="${BUILD_DIR}" \
    BUILD_ROOT="${BUILD_ROOT}" \
    CONFIGURATION_BUILD_DIR="${CONFIGURATION_BUILD_DIR}" \
    OBJROOT="${OBJROOT}" \
    SYMROOT="${SYMROOT}" \
    ONLY_ACTIVE_ARCH="NO" \

xcodebuild \
    -project "External/ReactiveCocoa/ReactiveCocoa.xcodeproj" \
    -target "ReactiveCocoa-iOS" \
    -configuration "${SUBPROJECT_CONFIG}" \
    -sdk "${SDK_NAME}" \
    BUILD_DIR="${BUILD_DIR}" \
    BUILD_ROOT="${BUILD_ROOT}" \
    CONFIGURATION_BUILD_DIR="${CONFIGURATION_BUILD_DIR}" \
    OBJROOT="${OBJROOT}" \
    SYMROOT="${SYMROOT}" \
    ONLY_ACTIVE_ARCH="NO" \
    IPHONEOS_DEPLOYMENT_TARGET="7.0" \

FRAMEWORKS_DIR="Frameworks"

if [ ! -d "${FRAMEWORKS_DIR}" ]; then
    mkdir "${FRAMEWORKS_DIR}"
fi

cp -r "${BUILT_PRODUCTS_DIR}/LlamaKit.framework" "${FRAMEWORKS_DIR}"
cp -r "${BUILT_PRODUCTS_DIR}/ReactiveCocoa.framework" "${FRAMEWORKS_DIR}"
