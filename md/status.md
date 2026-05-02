# 上架状态

更新时间：2026-05-02

## 已完成

- App 图标已生成并接入 `Assets.xcassets/AppIcon.appiconset/AppIcon-1024.png`。
- 正式 App 名称已确定并写入中文 metadata / InfoPlist：`沙县小吃店铺管家-经营日报-材料库存`。
- App Store metadata 已生成 39 个 locale，共 234 个文件，包含隐私/支持 URL 文件。
- `Localizable.xcstrings` 已接入 App 内固定 UI 文案资源。
- `InfoPlist.xcstrings` 已接入桌面显示名本地化。
- `Localizable.xcstrings` 已补齐 40 个 locale，`needs_review=0`，但非英语 locale 仍有英文占位，截图前必须先完成真实翻译。
- `InfoPlist.xcstrings` 已补齐 40 个 locale，`needs_review=0`。
- 已生成 `zh-Hans` iPad smoke 截图 2 张。
- 已部署 GitHub Pages 隐私/支持页面：39 个 locale，共 78 个 HTML，公开地址为 `https://jok9580955.github.io/shaxian-manager-ios/`。
- 已从上一个项目复用 App Store Connect API key 配置：`JD5G4LG5XN` / `f68594d0-23a9-480d-8f1d-6c84b40bf664` / `/Users/ll/Desktop/AuthKey_JD5G4LG5XN.p8`。
- Xcode 签名团队已配置：`DEVELOPMENT_TEAM = QFZ87PFLK4`。
- Xcode 已能编译 `Localizable.xcstrings` 和 `InfoPlist.xcstrings`。
- 无签名 generic iOS Simulator build 已通过。

## 当前缺口

- `Localizable.xcstrings` 当前审计有 `same_as_english=1947`，截图脚本已加审计锁，翻译未完成时会直接停止。
- `fastlane/screenshots` 尚未生成全量 39 语言截图；刚刚误生成的临时截图已删除。
- `fastlane/Fastfile` 和 `fastlane/Appfile` 已生成，ASC API key 和开发团队已接入本机默认值，上传前仍需确认 App Store Connect 中已有对应 bundle id/App 记录。
- GitHub 远端仓库已创建并推送：`https://github.com/jok9580955/shaxian-manager-ios`。
- GitHub Pages 已开启，metadata URL 已按 `https://jok9580955.github.io/shaxian-manager-ios` 写入并验证可访问。

## 下一步建议

1. 先完成 `Localizable.xcstrings` 的真实多语言翻译，使 `same_as_english=0`。
2. 做少量 locale 视觉 smoke test，例如 `zh-Hans,en-US,ja,ar-SA`。
3. 批量生成 39 语言 iPhone 和 iPad 截图。
4. 确认 App Store Connect 中已有 bundle id/App 记录。
5. 上传 metadata、截图和二进制。

## 一键检查

运行：

```bash
bash scripts/aso_status.sh
```
