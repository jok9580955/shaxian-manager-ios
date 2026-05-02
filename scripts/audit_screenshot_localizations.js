const fs = require("fs");

const file = "沙县出餐管家/Localizable.xcstrings";
const catalog = JSON.parse(fs.readFileSync(file, "utf8"));

const requiredLocales = [
  "ar-SA", "ca", "cs", "da", "de-DE", "el", "en", "en-AU", "en-CA", "en-GB", "en-US",
  "es-ES", "es-MX", "fi", "fr-CA", "fr-FR", "he", "hi", "hr", "hu", "id", "it",
  "ja", "ko", "ms", "nl-NL", "nb", "pl", "pt-BR", "pt-PT", "ro", "ru", "sk",
  "sv", "th", "tr", "uk", "vi", "zh-Hans", "zh-Hant",
];

const screenshotKeys = [
  "材料成本",
  "老陈",
  "附近工地",
  "小林",
  "拌面 2 份、扁肉 1 碗",
  "团餐 12 份",
  "炖罐套餐",
  "冻蒸饺",
  "8 袋",
  "低于 6 袋提醒",
  "城西冻品",
  "花生酱",
  "2 桶",
  "低于 3 桶提醒",
  "三明调料行",
  "炖罐汤料包",
  "42 包",
  "低于 20 包提醒",
  "老汤供应",
  "午市流水",
  "冻品进货",
  "外卖平台服务费",
  "库存成本",
  "费用",
  "3号桌",
  "外卖 A18",
  "7号桌",
  "莲子排骨炖罐",
  "花生酱拌面",
];

const englishLocales = new Set(["en", "en-US", "en-GB", "en-AU", "en-CA"]);
const issues = [];

for (const key of screenshotKeys) {
  const item = catalog.strings?.[key];
  if (!item) {
    issues.push(`missing key: ${key}`);
    continue;
  }
  const localizations = item.localizations || {};
  const english = localizations.en?.stringUnit?.value;
  for (const locale of requiredLocales) {
    const value = localizations[locale]?.stringUnit?.value;
    if (!value) {
      issues.push(`${locale}: missing "${key}"`);
      continue;
    }
    if (english && !englishLocales.has(locale) && locale !== "zh-Hans" && locale !== "zh-Hant" && value === english) {
      issues.push(`${locale}: same_as_en "${key}"`);
    }
  }
}

console.log(`screenshot_keys=${screenshotKeys.length}`);
console.log(`required_locales=${requiredLocales.length}`);

if (issues.length > 0) {
  console.error("screenshot_localization_audit=failed");
  for (const issue of issues.slice(0, 160)) console.error(issue);
  if (issues.length > 160) console.error(`... ${issues.length - 160} more`);
  process.exit(1);
}

console.log("screenshot_localization_audit=passed");
