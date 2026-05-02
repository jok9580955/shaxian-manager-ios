#!/usr/bin/env bash
set -euo pipefail

locales=(
  ar-SA ca cs da de-DE el en-AU en-CA en-GB en-US es-ES es-MX fi fr-CA fr-FR he hi hr hu id it
  ja ko ms nl-NL no pl pt-BR pt-PT ro ru sk sv th tr uk vi zh-Hans zh-Hant
)

base_url="${PUBLIC_BASE_URL:-}"
root="public"

mkdir -p "${root}"

write_page() {
  local locale="$1"
  local kind="$2"
  local title="$3"
  local body="$4"
  local dir="${root}/${locale}/${kind}"
  mkdir -p "${dir}"
  cat > "${dir}/index.html" <<HTML
<!doctype html>
<html lang="${locale}">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>${title}</title>
  <style>
    :root { color-scheme: light dark; }
    body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif; max-width: 760px; margin: 0 auto; padding: 32px 20px; line-height: 1.65; }
    h1 { font-size: 28px; line-height: 1.2; }
    h2 { font-size: 18px; margin-top: 28px; }
    .muted { color: #666; }
  </style>
</head>
<body>
${body}
</body>
</html>
HTML
}

privacy_en='<h1>Privacy Policy</h1>
<p class="muted">Last updated: 2026-05-02</p>
<p>Shaxian Manager is an offline-first business utility for small food shops.</p>
<h2>Data Collection</h2>
<p>The current version does not require an account and does not collect personal data on a server operated by the developer.</p>
<h2>Local Data</h2>
<p>Customer records, inventory records, and ledger entries you create are stored locally on your device.</p>
<h2>Third-Party Services</h2>
<p>The app does not include third-party analytics, advertising SDKs, or tracking features in the current version.</p>
<h2>Contact</h2>
<p>For privacy questions, contact the developer through the support page.</p>'

support_en='<h1>Support</h1>
<p class="muted">Shaxian Manager</p>
<p>If you need help with daily reports, inventory records, customers, or ledger entries, contact the developer.</p>
<h2>App Usage</h2>
<p>The app stores current records locally on your device. If you delete the app, local app data may also be removed by iOS.</p>
<h2>Contact</h2>
<p>Email: jok9580955@gmail.com</p>'

privacy_zh_hans='<h1>隐私政策</h1>
<p class="muted">最后更新：2026-05-02</p>
<p>沙县小吃店铺管家-经营日报-材料库存是一款面向小型餐饮店的离线优先经营工具。</p>
<h2>数据收集</h2>
<p>当前版本无需账号登录，也不会把个人数据收集到开发者运营的服务器。</p>
<h2>本地数据</h2>
<p>你创建的客户资料、库存记录和财务流水保存在本机设备中。</p>
<h2>第三方服务</h2>
<p>当前版本不包含第三方分析、广告 SDK 或跟踪功能。</p>
<h2>联系</h2>
<p>如有隐私问题，请通过支持页面联系开发者。</p>'

support_zh_hans='<h1>支持</h1>
<p class="muted">沙县小吃店铺管家-经营日报-材料库存</p>
<p>如果你在经营日报、材料库存、客户记录或财务流水方面需要帮助，可以联系开发者。</p>
<h2>使用说明</h2>
<p>当前记录保存在本机设备中。如果删除 App，iOS 可能同时移除本地数据。</p>
<h2>联系方式</h2>
<p>邮箱：jok9580955@gmail.com</p>'

privacy_zh_hant='<h1>隱私政策</h1>
<p class="muted">最後更新：2026-05-02</p>
<p>沙縣小吃店鋪管家-經營日報-材料庫存是一款面向小型餐飲店的離線優先經營工具。</p>
<h2>資料收集</h2>
<p>目前版本無需帳號登入，也不會把個人資料收集到開發者營運的伺服器。</p>
<h2>本機資料</h2>
<p>你建立的客戶資料、庫存記錄和財務流水保存在本機裝置中。</p>
<h2>第三方服務</h2>
<p>目前版本不包含第三方分析、廣告 SDK 或追蹤功能。</p>
<h2>聯絡</h2>
<p>如有隱私問題，請透過支援頁面聯絡開發者。</p>'

support_zh_hant='<h1>支援</h1>
<p class="muted">沙縣小吃店鋪管家-經營日報-材料庫存</p>
<p>如果你在經營日報、材料庫存、客戶記錄或財務流水方面需要協助，可以聯絡開發者。</p>
<h2>使用說明</h2>
<p>目前記錄保存在本機裝置中。如果刪除 App，iOS 可能同時移除本機資料。</p>
<h2>聯絡方式</h2>
<p>信箱：jok9580955@gmail.com</p>'

for locale in "${locales[@]}"; do
  case "${locale}" in
    zh-Hans)
      write_page "${locale}" privacy "隐私政策 - 沙县小吃店铺管家-经营日报-材料库存" "${privacy_zh_hans}"
      write_page "${locale}" support "支持 - 沙县小吃店铺管家-经营日报-材料库存" "${support_zh_hans}"
      ;;
    zh-Hant)
      write_page "${locale}" privacy "隱私政策 - 沙縣小吃店鋪管家-經營日報-材料庫存" "${privacy_zh_hant}"
      write_page "${locale}" support "支援 - 沙縣小吃店鋪管家-經營日報-材料庫存" "${support_zh_hant}"
      ;;
    *)
      write_page "${locale}" privacy "Privacy Policy - Shaxian Manager" "${privacy_en}"
      write_page "${locale}" support "Support - Shaxian Manager" "${support_en}"
      ;;
  esac

  if [[ -n "${base_url}" ]]; then
    metadata_dir="fastlane/metadata/${locale}"
    mkdir -p "${metadata_dir}"
    printf '%s/%s/privacy/\n' "${base_url%/}" "${locale}" > "${metadata_dir}/privacy_url.txt"
    printf '%s/%s/support/\n' "${base_url%/}" "${locale}" > "${metadata_dir}/support_url.txt"
  fi
done

echo "Generated privacy/support pages for ${#locales[@]} locales under ${root}/"
if [[ -n "${base_url}" ]]; then
  echo "Injected privacy_url.txt and support_url.txt using ${base_url}"
else
  echo "Skipped metadata URL injection. Set PUBLIC_BASE_URL to write metadata URL files."
fi
