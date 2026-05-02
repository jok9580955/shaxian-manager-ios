#!/usr/bin/env bash
set -euo pipefail

APP_PATH="${APP_PATH:-/private/tmp/shaxian-derived/Build/Products/Debug-iphonesimulator/沙县出餐管家.app}"
BUNDLE_ID="${BUNDLE_ID:-com.liulei.shaxian.kitchenmanager}"
DEVICE_NAME="${DEVICE_NAME:-iPad Pro 13-inch (M5)}"
LOCALE="${LOCALE:-zh-Hans}"
OUT_DIR="${OUT_DIR:-fastlane/screenshots/${LOCALE}}"

mkdir -p "${OUT_DIR}"

device_id="$(xcrun simctl list devices available \
  | grep -F "${DEVICE_NAME}" \
  | grep -E "Shutdown|Booted" \
  | head -n 1 \
  | sed -E "s/.*\\(([0-9A-F-]+)\\).*/\\1/")"

if [[ -z "${device_id}" ]]; then
  echo "Could not find simulator: ${DEVICE_NAME}" >&2
  xcrun simctl list devices available >&2
  exit 1
fi

xcrun simctl boot "${device_id}" >/dev/null 2>&1 || true
xcrun simctl bootstatus "${device_id}" -b
xcrun simctl uninstall "${device_id}" "${BUNDLE_ID}" >/dev/null 2>&1 || true
xcrun simctl install "${device_id}" "${APP_PATH}"

capture_mode() {
  local mode="$1"
  local name="$2"
  xcrun simctl terminate "${device_id}" "${BUNDLE_ID}" >/dev/null 2>&1 || true
  xcrun simctl launch "${device_id}" "${BUNDLE_ID}" \
    -FASTLANE_SNAPSHOT YES \
    -ScreenshotMode "${mode}" \
    -AppleLanguages "(${LOCALE})" \
    -AppleLocale "${LOCALE}" >/dev/null
  sleep 3
  xcrun simctl io "${device_id}" screenshot "${OUT_DIR}/iPad_${DEVICE_NAME// /_}-${name}.png"
}

capture_mode 1 "01-report"
capture_mode 2 "02-kitchen"

echo "Generated iPad smoke screenshots in ${OUT_DIR}"
