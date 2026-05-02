# 截图流程

当前多语言 UI 翻译已完成，隐私/支持 URL 已公开可访问。全量 39 语言截图前，先做代表性语言视觉 smoke test。

代表性 smoke test：

```bash
bash scripts/screenshot_smoke_locales.sh
```

脚本会先运行：

```bash
node scripts/audit_localizations.js
```

如果非英语 locale 仍然等于英文占位，截图会直接停止。

默认生成：

- locales：`zh-Hans,en-US,ja,ar-SA`
- devices：`iPhone 17 Pro,iPad Pro 13-inch (M5)`
- screens：`01-report,02-kitchen`

单 iPad smoke：

```bash
bash scripts/ipad_screenshot_smoke.sh
```

该脚本只生成 `zh-Hans` iPad smoke 截图，用于快速验证 iPad 布局和截图管线。

环境变量：

- `DEVICE_NAME`：默认 `iPad Pro 13-inch (M5)`
- `LOCALE`：默认 `zh-Hans`
- `APP_PATH`：默认 `/private/tmp/shaxian-derived/Build/Products/Debug-iphonesimulator/沙县出餐管家.app`
- `OUT_DIR`：默认 `fastlane/screenshots/<LOCALE>`

全量截图前必须：

1. 确认 `Localizable.xcstrings` 和 metadata 检查通过。
2. 确认隐私/支持 URL 可访问。
3. 视觉 smoke test `zh-Hans,en-US,ja,ar-SA`。
4. 再批量生成每个 locale 的 iPhone 和 iPad 截图。
