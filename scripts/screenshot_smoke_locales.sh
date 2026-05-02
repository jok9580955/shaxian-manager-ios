#!/usr/bin/env bash
set -euo pipefail

APP_PATH="${APP_PATH:-/private/tmp/shaxian-derived/Build/Products/Debug-iphonesimulator/沙县出餐管家.app}"
BUNDLE_ID="${BUNDLE_ID:-com.liulei.shaxian.kitchenmanager}"
LOCALES_CSV="${LOCALES:-zh-Hans,en-US,ja,ar-SA}"
DEVICES_CSV="${DEVICES:-iPhone 17 Pro,iPad Pro 13-inch (M5)}"
OUT_ROOT="${OUT_ROOT:-fastlane/screenshots}"
WAIT_SECONDS="${WAIT_SECONDS:-3}"

if [[ ! -d "${APP_PATH}" ]]; then
  echo "App not found: ${APP_PATH}" >&2
  exit 1
fi

node scripts/audit_localizations.js

IFS=',' read -r -a locales <<< "${LOCALES_CSV}"
IFS=',' read -r -a devices <<< "${DEVICES_CSV}"

device_id_for_name() {
  local name="$1"
  xcrun simctl list devices available \
    | grep -F "${name}" \
    | grep -E "Shutdown|Booted" \
    | head -n 1 \
    | sed -E "s/.*\\(([0-9A-F-]+)\\).*/\\1/"
}

safe_device_name() {
  echo "$1" | tr ' ' '_'
}

capture_mode() {
  local device_id="$1"
  local device_name="$2"
  local locale="$3"
  local mode="$4"
  local suffix="$5"
  local family_prefix="$6"
  local out_dir="${OUT_ROOT}/${locale}"
  mkdir -p "${out_dir}"

  xcrun simctl terminate "${device_id}" "${BUNDLE_ID}" >/dev/null 2>&1 || true
  xcrun simctl launch "${device_id}" "${BUNDLE_ID}" \
    -FASTLANE_SNAPSHOT YES \
    -ScreenshotMode "${mode}" \
    -AppleLanguages "(${locale})" \
    -AppleLocale "${locale}" >/dev/null
  sleep "${WAIT_SECONDS}"
  xcrun simctl io "${device_id}" screenshot "${out_dir}/${family_prefix}_$(safe_device_name "${device_name}")-${suffix}.png"
}

for device_name in "${devices[@]}"; do
  device_id="$(device_id_for_name "${device_name}")"
  if [[ -z "${device_id}" ]]; then
    echo "Could not find simulator: ${device_name}" >&2
    xcrun simctl list devices available >&2
    exit 1
  fi

  family_prefix="iPhone"
  if [[ "${device_name}" == iPad* ]]; then
    family_prefix="iPad"
  fi

  xcrun simctl boot "${device_id}" >/dev/null 2>&1 || true
  xcrun simctl bootstatus "${device_id}" -b

  for locale in "${locales[@]}"; do
    xcrun simctl uninstall "${device_id}" "${BUNDLE_ID}" >/dev/null 2>&1 || true
    xcrun simctl install "${device_id}" "${APP_PATH}"
    capture_mode "${device_id}" "${device_name}" "${locale}" 1 "01-report" "${family_prefix}"
    capture_mode "${device_id}" "${device_name}" "${locale}" 2 "02-kitchen" "${family_prefix}"
  done
done

echo "Generated smoke screenshots for ${LOCALES_CSV} on ${DEVICES_CSV}"
