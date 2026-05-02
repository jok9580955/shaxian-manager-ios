import AppKit
import CoreGraphics
import Foundation

let size = 1024
let outputPath = CommandLine.arguments.dropFirst().first ?? "沙县出餐管家/Assets.xcassets/AppIcon.appiconset/AppIcon-1024.png"
let bitmap = NSBitmapImageRep(
    bitmapDataPlanes: nil,
    pixelsWide: size,
    pixelsHigh: size,
    bitsPerSample: 8,
    samplesPerPixel: 4,
    hasAlpha: true,
    isPlanar: false,
    colorSpaceName: .deviceRGB,
    bytesPerRow: 0,
    bitsPerPixel: 0
)!
bitmap.size = NSSize(width: size, height: size)
let context = NSGraphicsContext(bitmapImageRep: bitmap)!

func color(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat = 1) -> NSColor {
    NSColor(calibratedRed: red / 255, green: green / 255, blue: blue / 255, alpha: alpha)
}

func drawText(_ text: String, in rect: NSRect, size: CGFloat, weight: NSFont.Weight, color: NSColor, alignment: NSTextAlignment = .center) {
    let paragraph = NSMutableParagraphStyle()
    paragraph.alignment = alignment
    let attrs: [NSAttributedString.Key: Any] = [
        .font: NSFont.systemFont(ofSize: size, weight: weight),
        .foregroundColor: color,
        .paragraphStyle: paragraph
    ]
    NSString(string: text).draw(in: rect, withAttributes: attrs)
}

func roundedRect(_ rect: NSRect, radius: CGFloat, fill: NSColor) {
    let path = NSBezierPath(roundedRect: rect, xRadius: radius, yRadius: radius)
    fill.setFill()
    path.fill()
}

NSGraphicsContext.saveGraphicsState()
NSGraphicsContext.current = context

let rect = NSRect(x: 0, y: 0, width: size, height: size)
let background = NSGradient(colors: [
    color(156, 21, 20),
    color(231, 72, 24),
    color(255, 178, 50)
])!
background.draw(in: rect, angle: 35)

let glow = NSBezierPath(ovalIn: NSRect(x: -130, y: 610, width: 520, height: 420))
color(255, 233, 139, 0.28).setFill()
glow.fill()

let shadow = NSShadow()
shadow.shadowColor = NSColor.black.withAlphaComponent(0.22)
shadow.shadowBlurRadius = 34
shadow.shadowOffset = NSSize(width: 0, height: -14)
shadow.set()

roundedRect(NSRect(x: 142, y: 156, width: 740, height: 706), radius: 92, fill: color(255, 249, 230))

NSGraphicsContext.current?.cgContext.setShadow(offset: .zero, blur: 0, color: nil)

drawText("沙", in: NSRect(x: 204, y: 590, width: 190, height: 210), size: 170, weight: .heavy, color: color(174, 28, 22))
drawText("店铺", in: NSRect(x: 420, y: 690, width: 260, height: 84), size: 68, weight: .heavy, color: color(105, 42, 22), alignment: .left)
drawText("管家", in: NSRect(x: 420, y: 610, width: 260, height: 84), size: 68, weight: .heavy, color: color(105, 42, 22), alignment: .left)

roundedRect(NSRect(x: 214, y: 292, width: 596, height: 232), radius: 46, fill: color(255, 229, 173))

let report = NSBezierPath(roundedRect: NSRect(x: 260, y: 336, width: 176, height: 148), xRadius: 26, yRadius: 26)
color(255, 255, 247).setFill()
report.fill()
color(220, 45, 34).setStroke()
report.lineWidth = 10
report.stroke()

drawText("日", in: NSRect(x: 296, y: 390, width: 104, height: 72), size: 62, weight: .heavy, color: color(173, 28, 22))
for y in stride(from: 366, through: 342, by: -24) {
    let line = NSBezierPath(roundedRect: NSRect(x: 302, y: CGFloat(y), width: 92, height: 9), xRadius: 4, yRadius: 4)
    color(244, 120, 32).setFill()
    line.fill()
}

let crateRect = NSRect(x: 474, y: 340, width: 130, height: 130)
roundedRect(crateRect, radius: 22, fill: color(244, 120, 32))
let crateLineColor = color(255, 243, 203, 0.95)
crateLineColor.setStroke()
for x in [515, 562] {
    let line = NSBezierPath()
    line.move(to: NSPoint(x: CGFloat(x), y: 350))
    line.line(to: NSPoint(x: CGFloat(x), y: 460))
    line.lineWidth = 8
    line.stroke()
}
for y in [382, 426] {
    let line = NSBezierPath()
    line.move(to: NSPoint(x: 486, y: CGFloat(y)))
    line.line(to: NSPoint(x: 592, y: CGFloat(y)))
    line.lineWidth = 8
    line.stroke()
}
drawText("库", in: NSRect(x: 492, y: 374, width: 94, height: 76), size: 58, weight: .heavy, color: NSColor.white)

let coin = NSBezierPath(ovalIn: NSRect(x: 644, y: 348, width: 116, height: 116))
color(31, 151, 82).setFill()
coin.fill()
drawText("¥", in: NSRect(x: 660, y: 374, width: 84, height: 76), size: 64, weight: .heavy, color: NSColor.white)

let steamColor = color(255, 249, 230, 0.82)
for x in stride(from: 272, through: 752, by: 120) {
    let steam = NSBezierPath()
    steam.move(to: NSPoint(x: x, y: 876))
    steam.curve(to: NSPoint(x: x + 24, y: 952), controlPoint1: NSPoint(x: x - 28, y: 906), controlPoint2: NSPoint(x: x + 54, y: 920))
    steam.lineWidth = 18
    steam.lineCapStyle = .round
    steamColor.setStroke()
    steam.stroke()
}

NSGraphicsContext.restoreGraphicsState()

guard let data = bitmap.representation(using: .png, properties: [:]) else {
    fatalError("Failed to render app icon")
}

try FileManager.default.createDirectory(
    at: URL(fileURLWithPath: outputPath).deletingLastPathComponent(),
    withIntermediateDirectories: true
)
try data.write(to: URL(fileURLWithPath: outputPath))
