# 隐私与支持页面

本项目使用 `scripts/generate_privacy_support.sh` 生成本地网页：

- `public/<locale>/privacy/index.html`
- `public/<locale>/support/index.html`

默认只生成本地页面，不会把占位链接写入 App Store metadata。

## 生成本地页面

```bash
bash scripts/generate_privacy_support.sh
```

## 写入 metadata URL 文件

部署到 GitHub Pages 或自己的域名后，传入真实公开 URL：

```bash
PUBLIC_BASE_URL="https://example.com/shaxian-manager" bash scripts/generate_privacy_support.sh
```

脚本会为每个 locale 写入：

- `fastlane/metadata/<locale>/privacy_url.txt`
- `fastlane/metadata/<locale>/support_url.txt`

不要使用 `example.com` 作为正式上传链接。
