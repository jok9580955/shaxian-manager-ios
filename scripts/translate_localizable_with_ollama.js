const fs = require("fs");
const { execFileSync } = require("child_process");

const file = "沙县出餐管家/Localizable.xcstrings";
const model = process.env.OLLAMA_MODEL || "gemma3:4b";
const catalog = JSON.parse(fs.readFileSync(file, "utf8"));
const keys = Object.keys(catalog.strings || {}).sort();
const staticFormats = {
  "%@ x%lld": {
    default: "%@ x%lld"
  },
  "%@ · %@": {
    default: "%@ · %@"
  },
  "%lld 单": {
    "ar-SA": "%lld طلب",
    ca: "%lld comandes",
    cs: "%lld objednávek",
    da: "%lld ordrer",
    "de-DE": "%lld Bestellungen",
    el: "%lld παραγγελίες",
    "es-ES": "%lld pedidos",
    "es-MX": "%lld pedidos",
    fi: "%lld tilausta",
    "fr-CA": "%lld commandes",
    "fr-FR": "%lld commandes",
    he: "%lld הזמנות",
    hi: "%lld ऑर्डर",
    hr: "%lld narudžbi",
    hu: "%lld rendelés",
    id: "%lld pesanan",
    it: "%lld ordini",
    ja: "%lld 件",
    ko: "%lld건",
    ms: "%lld pesanan",
    nb: "%lld bestillinger",
    "nl-NL": "%lld bestellingen",
    pl: "%lld zamówień",
    "pt-BR": "%lld pedidos",
    "pt-PT": "%lld pedidos",
    ro: "%lld comenzi",
    ru: "%lld заказов",
    sk: "%lld objednávok",
    sv: "%lld beställningar",
    th: "%lld ออเดอร์",
    tr: "%lld sipariş",
    uk: "%lld замовлень",
    vi: "%lld đơn"
  },
  "%lld 单制作中": {
    "ar-SA": "%lld طلب قيد التحضير",
    ca: "%lld comandes en preparació",
    cs: "%lld objednávek se připravuje",
    da: "%lld ordrer under tilberedning",
    "de-DE": "%lld Bestellungen in Zubereitung",
    el: "%lld παραγγελίες σε προετοιμασία",
    "es-ES": "%lld pedidos en preparación",
    "es-MX": "%lld pedidos en preparación",
    fi: "%lld tilausta valmistuksessa",
    "fr-CA": "%lld commandes en préparation",
    "fr-FR": "%lld commandes en préparation",
    he: "%lld הזמנות בהכנה",
    hi: "%lld ऑर्डर बन रहे हैं",
    hr: "%lld narudžbi u pripremi",
    hu: "%lld rendelés készül",
    id: "%lld pesanan diproses",
    it: "%lld ordini in preparazione",
    ja: "%lld 件を調理中",
    ko: "%lld건 조리 중",
    ms: "%lld pesanan sedang disediakan",
    nb: "%lld bestillinger tilberedes",
    "nl-NL": "%lld bestellingen in bereiding",
    pl: "%lld zamówień w przygotowaniu",
    "pt-BR": "%lld pedidos em preparo",
    "pt-PT": "%lld pedidos em preparação",
    ro: "%lld comenzi în pregătire",
    ru: "%lld заказов готовится",
    sk: "%lld objednávok sa pripravuje",
    sv: "%lld beställningar tillagas",
    th: "%lld ออเดอร์กำลังทำ",
    tr: "%lld sipariş hazırlanıyor",
    uk: "%lld замовлень готується",
    vi: "%lld đơn đang làm"
  },
  "今日净流水 %@": {
    "ar-SA": "صافي التدفق اليوم %@",
    ca: "Flux net d'avui %@",
    cs: "Dnešní čistý tok %@",
    da: "Dagens nettoflow %@",
    "de-DE": "Heutiger Nettofluss %@",
    el: "Σημερινή καθαρή ροή %@",
    "es-ES": "Flujo neto de hoy %@",
    "es-MX": "Flujo neto de hoy %@",
    fi: "Tämän päivän nettokassa %@",
    "fr-CA": "Flux net du jour %@",
    "fr-FR": "Flux net du jour %@",
    he: "תזרים נטו היום %@",
    hi: "आज का शुद्ध नकदी प्रवाह %@",
    hr: "Današnji neto tok %@",
    hu: "Mai nettó pénzforgalom %@",
    id: "Arus kas bersih hari ini %@",
    it: "Flusso netto di oggi %@",
    ja: "本日の純売上 %@",
    ko: "오늘 순현금흐름 %@",
    ms: "Aliran tunai bersih hari ini %@",
    nb: "Dagens netto kontantstrøm %@",
    "nl-NL": "Netto kasstroom vandaag %@",
    pl: "Dzisiejszy przepływ netto %@",
    "pt-BR": "Fluxo líquido de hoje %@",
    "pt-PT": "Fluxo líquido de hoje %@",
    ro: "Flux net azi %@",
    ru: "Чистый поток сегодня %@",
    sk: "Dnešný čistý tok %@",
    sv: "Dagens nettoflöde %@",
    th: "กระแสเงินสดสุทธิวันนี้ %@",
    tr: "Bugünkü net akış %@",
    uk: "Чистий потік сьогодні %@",
    vi: "Dòng tiền ròng hôm nay %@"
  }
};

const targets = {
  "ar-SA": "Arabic (Saudi Arabia)",
  ca: "Catalan",
  cs: "Czech",
  da: "Danish",
  "de-DE": "German (Germany)",
  el: "Greek",
  "es-ES": "Spanish (Spain)",
  "es-MX": "Spanish (Mexico)",
  fi: "Finnish",
  "fr-CA": "French (Canada)",
  "fr-FR": "French (France)",
  he: "Hebrew",
  hi: "Hindi",
  hr: "Croatian",
  hu: "Hungarian",
  id: "Indonesian",
  it: "Italian",
  ja: "Japanese",
  ko: "Korean",
  ms: "Malay",
  nb: "Norwegian Bokmal",
  "nl-NL": "Dutch",
  pl: "Polish",
  "pt-BR": "Portuguese (Brazil)",
  "pt-PT": "Portuguese (Portugal)",
  ro: "Romanian",
  ru: "Russian",
  sk: "Slovak",
  sv: "Swedish",
  th: "Thai",
  tr: "Turkish",
  uk: "Ukrainian",
  vi: "Vietnamese"
};

function placeholders(text) {
  return (text.match(/%@|%lld/g) || []).sort().join("|");
}

function extractJson(raw) {
  const cleaned = raw.replace(/\u001b\[[0-9;?]*[A-Za-z]/g, "").trim();
  try {
    return JSON.parse(cleaned);
  } catch {}
  const match = cleaned.match(/\{[\s\S]*\}/);
  if (!match) throw new Error(`No JSON object in response: ${cleaned.slice(0, 300)}`);
  return JSON.parse(match[0]);
}

function translateLocale(locale, language) {
  const result = {};
  for (const [key, values] of Object.entries(staticFormats)) {
    result[key] = values[locale] || values.default;
  }
  const modelKeys = keys.filter((key) => result[key] == null);
  for (let index = 0; index < modelKeys.length; index += 12) {
    const chunk = modelKeys.slice(index, index + 12);
    const source = {};
    for (const key of chunk) source[key] = key;
    const prompt = [
      `Translate iOS app UI strings from Simplified Chinese to ${language}.`,
      "Context: a small restaurant ERP app for Shaxian snack shops, daily business report, material inventory, customer records, simple ledger, and kitchen timer.",
      "Return ONLY valid JSON. No markdown.",
      "JSON schema: an object whose keys are exactly the original Chinese strings and whose values are translated UI strings.",
      "Rules: preserve placeholders exactly, including %@ and %lld; keep line-friendly concise UI wording; do not leave Chinese unless it is the brand name 沙县小吃; do not return English unless target language is English.",
      JSON.stringify(source)
    ].join("\n");

    const body = JSON.stringify({
      model,
      prompt,
      format: "json",
      stream: false,
      options: { temperature: 0 }
    });
    const raw = execFileSync("curl", ["-s", "http://127.0.0.1:11434/api/generate", "-d", body], {
      encoding: "utf8",
      maxBuffer: 1024 * 1024 * 8,
      timeout: 120000
    });
    const payload = JSON.parse(raw);
    const translated = extractJson(payload.response || "");
    for (const key of chunk) {
      let value = String(translated[key] || "").trim();
      if (!value) value = translateSingle(locale, language, key);
      if (!value) throw new Error(`${locale}: missing ${key}`);
      if (placeholders(value) !== placeholders(key)) {
        throw new Error(`${locale}: placeholder mismatch for ${key}: ${value}`);
      }
      result[key] = value;
    }
  }
  return result;
}

function translateSingle(locale, language, key) {
  const prompt = [
    `Translate this iOS app UI string from Simplified Chinese to ${language}.`,
    "Return ONLY valid JSON like {\"value\":\"...\"}.",
    "Preserve placeholders exactly. Keep concise UI wording.",
    key
  ].join("\n");
  const body = JSON.stringify({
    model,
    prompt,
    format: "json",
    stream: false,
    options: { temperature: 0 }
  });
  const raw = execFileSync("curl", ["-s", "http://127.0.0.1:11434/api/generate", "-d", body], {
    encoding: "utf8",
    maxBuffer: 1024 * 1024,
    timeout: 60000
  });
  const payload = JSON.parse(raw);
  const translated = extractJson(payload.response || "");
  return String(translated.value || "").trim();
}

function writeCatalog() {
  fs.writeFileSync(file, JSON.stringify(catalog, null, 2) + "\n");
}

for (const [locale, language] of Object.entries(targets)) {
  const probeKey = "日报";
  const current = catalog.strings[probeKey]?.localizations?.[locale]?.stringUnit?.value;
  if (current && current !== catalog.strings[probeKey]?.localizations?.en?.stringUnit?.value) {
    console.log(`Skipping ${locale} (already translated)`);
    continue;
  }
  console.log(`Translating ${locale} (${language})`);
  const translated = translateLocale(locale, language);
  for (const key of keys) {
    catalog.strings[key].localizations ||= {};
    catalog.strings[key].localizations[locale] = {
      stringUnit: {
        state: "translated",
        value: translated[key]
      }
    };
  }
  writeCatalog();
}

console.log(`Translated ${Object.keys(targets).length} locales in ${file}`);
