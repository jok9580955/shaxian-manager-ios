# 截图流程

当前多语言 UI 翻译仍有 `needs_review`，所以不能生成全量 39 语言截图。

允许的临时操作：

```bash
bash scripts/ipad_screenshot_smoke.sh
```

该脚本只生成 `zh-Hans` iPad smoke 截图，用于验证 iPad 布局和截图管线。

环境变量：

- `DEVICE_NAME`：默认 `iPad Pro 13-inch (M5)`
- `LOCALE`：默认 `zh-Hans`
- `APP_PATH`：默认 `/private/tmp/shaxian-derived/Build/Products/Debug-iphonesimulator/沙县出餐管家.app`
- `OUT_DIR`：默认 `fastlane/screenshots/<LOCALE>`

全量截图前必须：

1. 完成 `Localizable.xcstrings` 翻译审核。
2. 写入真实隐私/支持 URL。
3. 视觉 smoke test `zh-Hans,en-US,ja,ar-SA`。
4. 再批量生成每个 locale 的 iPhone 和 iPad 截图。
