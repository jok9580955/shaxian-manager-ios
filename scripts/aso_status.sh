#!/usr/bin/env bash
set -euo pipefail

metadata_locales=0
metadata_files=0
screenshots_locales=0
metadata_extra_files=0

if [ -d fastlane/metadata ]; then
  metadata_locales=$(find fastlane/metadata -mindepth 1 -maxdepth 1 -type d | wc -l | tr -d ' ')
  metadata_files=$(find fastlane/metadata -mindepth 2 -maxdepth 2 -type f | wc -l | tr -d ' ')
  metadata_extra_files=$(find fastlane/metadata -mindepth 2 -maxdepth 2 -type f \( -name 'privacy_url.txt' -o -name 'support_url.txt' -o -name 'marketing_url.txt' -o -name 'promotional_text.txt' -o -name 'release_notes.txt' \) | wc -l | tr -d ' ')
fi

if [ -d fastlane/screenshots ]; then
  screenshots_locales=$(find fastlane/screenshots -mindepth 1 -maxdepth 1 -type d | wc -l | tr -d ' ')
fi

echo "ASO status"
echo "----------"
echo "metadata_locales=${metadata_locales}"
echo "metadata_files=${metadata_files}"
echo "metadata_extra_files=${metadata_extra_files}"
echo "screenshots_locales=${screenshots_locales}"
echo "fastlane_config=$([ -f fastlane/Fastfile ] && echo present || echo missing)"
echo "appfile=$([ -f fastlane/Appfile ] && echo present || echo missing)"
echo "localizable_xcstrings=$([ -f '沙县出餐管家/Localizable.xcstrings' ] && echo present || echo missing)"
echo "infoplist_xcstrings=$([ -f '沙县出餐管家/InfoPlist.xcstrings' ] && echo present || echo missing)"

node - <<'NODE'
const fs = require('fs');
for (const file of ['沙县出餐管家/Localizable.xcstrings', '沙县出餐管家/InfoPlist.xcstrings']) {
  if (!fs.existsSync(file)) continue;
  const catalog = JSON.parse(fs.readFileSync(file, 'utf8'));
  const locales = new Set();
  let needsReview = 0;
  for (const item of Object.values(catalog.strings || {})) {
    for (const [locale, value] of Object.entries(item.localizations || {})) {
      locales.add(locale);
      if (value.stringUnit?.state === 'needs_review') needsReview += 1;
    }
  }
  console.log(`${file}: keys=${Object.keys(catalog.strings || {}).length} locales=${locales.size} needs_review=${needsReview}`);
}
NODE
