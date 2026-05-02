const fs = require("fs");

const file = "沙县出餐管家/Localizable.xcstrings";
const catalog = JSON.parse(fs.readFileSync(file, "utf8"));
const englishLocales = new Set(["en", "en-US", "en-GB", "en-AU", "en-CA"]);
let sameAsEnglish = 0;
let missing = 0;
const details = [];

for (const [key, item] of Object.entries(catalog.strings || {})) {
  const localizations = item.localizations || {};
  const english = localizations.en?.stringUnit?.value;
  for (const [locale, value] of Object.entries(localizations)) {
    const text = value.stringUnit?.value;
    if (text == null || text === "") {
      missing += 1;
      details.push(`${locale}: missing "${key}"`);
      continue;
    }
    if (english && !englishLocales.has(locale) && locale !== "zh-Hans" && locale !== "zh-Hant" && text === english) {
      sameAsEnglish += 1;
      details.push(`${locale}: same_as_en "${key}"`);
    }
  }
}

console.log(`same_as_english=${sameAsEnglish}`);
console.log(`missing=${missing}`);
if (sameAsEnglish || missing) {
  for (const line of details.slice(0, 120)) console.log(line);
  if (details.length > 120) console.log(`... ${details.length - 120} more`);
  process.exit(1);
}
