const fs = require("fs");
const path = require("path");

const root = path.join(process.cwd(), "fastlane", "metadata");
const requiredFiles = ["name.txt", "subtitle.txt", "keywords.txt", "description.txt", "promotional_text.txt", "privacy_url.txt", "support_url.txt"];
const limits = {
  "name.txt": 30,
  "subtitle.txt": 30,
  "keywords.txt": 100,
  "description.txt": 4000,
  "promotional_text.txt": 170,
};
const englishLocales = new Set(["en-US", "en-GB", "en-AU", "en-CA"]);

function readTrimmed(file) {
  return fs.readFileSync(file, "utf8").trim();
}

if (!fs.existsSync(root)) {
  console.error("missing fastlane/metadata");
  process.exit(1);
}

const locales = fs.readdirSync(root)
  .filter((entry) => fs.statSync(path.join(root, entry)).isDirectory())
  .sort();

const englishDescriptionPath = path.join(root, "en-US", "description.txt");
const englishDescription = fs.existsSync(englishDescriptionPath) ? readTrimmed(englishDescriptionPath) : "";
const issues = [];

for (const locale of locales) {
  const dir = path.join(root, locale);
  for (const file of requiredFiles) {
    const target = path.join(dir, file);
    if (!fs.existsSync(target)) {
      issues.push(`${locale}: missing ${file}`);
      continue;
    }
    const value = readTrimmed(target);
    if (!value) {
      issues.push(`${locale}: empty ${file}`);
    }
    const limit = limits[file];
    if (limit && [...value].length > limit) {
      issues.push(`${locale}: ${file} length ${[...value].length} > ${limit}`);
    }
    if (file === "keywords.txt" && Buffer.byteLength(value, "utf8") > 100) {
      issues.push(`${locale}: keywords.txt utf8 bytes ${Buffer.byteLength(value, "utf8")} > 100`);
    }
  }

  const descriptionPath = path.join(dir, "description.txt");
  if (fs.existsSync(descriptionPath) && englishDescription && !englishLocales.has(locale)) {
    const description = readTrimmed(descriptionPath);
    if (description === englishDescription) {
      issues.push(`${locale}: description.txt is identical to en-US`);
    }
  }
}

console.log(`metadata_locales=${locales.length}`);
console.log(`checked_files=${locales.length * requiredFiles.length}`);

if (issues.length > 0) {
  console.error("metadata_audit=failed");
  for (const issue of issues) {
    console.error(issue);
  }
  process.exit(1);
}

console.log("metadata_audit=passed");
