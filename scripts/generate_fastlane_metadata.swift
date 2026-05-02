import Foundation

struct LocaleMetadata {
    let locale: String
    let name: String
    let subtitle: String
    let keywords: String
    let description: String
}

let baseDescription = """
Shaxian Store Manager is a lightweight business tool for owner-operated snack shops and small food businesses.

Track daily revenue, material costs, net cashflow, customer records, ingredient inventory, supplier notes, low-stock alerts, and simple ledger entries in one place.

The app is designed for fast daily use: open the daily report, add sales or expenses, update material inventory, and keep a clear record of repeat customers and group orders.

All current records are stored locally on the device. No account is required for the first version.
"""

let metadata: [LocaleMetadata] = [
    LocaleMetadata(locale: "ar-SA", name: "Shaxian Manager", subtitle: "Daily sales and stock", keywords: "shop,inventory,ledger,sales,customers,food,business,erp", description: baseDescription),
    LocaleMetadata(locale: "ca", name: "Shaxian Manager", subtitle: "Vendes i inventari diari", keywords: "botiga,inventari,caixa,vendes,clients,menjar,negoci,erp", description: baseDescription),
    LocaleMetadata(locale: "cs", name: "Shaxian Manager", subtitle: "Denní tržby a sklad", keywords: "obchod,sklad,účetnictví,tržby,zákazníci,jídlo,podnik,erp", description: baseDescription),
    LocaleMetadata(locale: "da", name: "Shaxian Manager", subtitle: "Dagligt salg og lager", keywords: "butik,lager,kasse,salg,kunder,mad,forretning,erp", description: baseDescription),
    LocaleMetadata(locale: "de-DE", name: "Shaxian Manager", subtitle: "Umsatz, Lager, Kasse", keywords: "laden,lager,kasse,umsatz,kunden,essen,business,erp", description: baseDescription),
    LocaleMetadata(locale: "el", name: "Shaxian Manager", subtitle: "Sales, stock and ledger", keywords: "shop,inventory,ledger,sales,customers,food,business,erp", description: baseDescription),
    LocaleMetadata(locale: "en-AU", name: "Shaxian Manager", subtitle: "Sales, stock and ledger", keywords: "shop,inventory,ledger,sales,customers,food,business,erp", description: baseDescription),
    LocaleMetadata(locale: "en-CA", name: "Shaxian Manager", subtitle: "Sales, stock and ledger", keywords: "shop,inventory,ledger,sales,customers,food,business,erp", description: baseDescription),
    LocaleMetadata(locale: "en-GB", name: "Shaxian Manager", subtitle: "Sales, stock and ledger", keywords: "shop,inventory,ledger,sales,customers,food,business,erp", description: baseDescription),
    LocaleMetadata(locale: "en-US", name: "Shaxian Manager", subtitle: "Sales, stock and ledger", keywords: "shop,inventory,ledger,sales,customers,food,business,erp", description: baseDescription),
    LocaleMetadata(locale: "es-ES", name: "Shaxian Manager", subtitle: "Ventas, stock y caja", keywords: "tienda,inventario,caja,ventas,clientes,comida,negocio,erp", description: baseDescription),
    LocaleMetadata(locale: "es-MX", name: "Shaxian Manager", subtitle: "Ventas, stock y caja", keywords: "tienda,inventario,caja,ventas,clientes,comida,negocio,erp", description: baseDescription),
    LocaleMetadata(locale: "fi", name: "Shaxian Manager", subtitle: "Myynti, varasto, kassa", keywords: "kauppa,varasto,kassa,myynti,asiakkaat,ruoka,bisnes,erp", description: baseDescription),
    LocaleMetadata(locale: "fr-CA", name: "Shaxian Manager", subtitle: "Ventes, stock et caisse", keywords: "boutique,inventaire,caisse,ventes,clients,restaurant,erp", description: baseDescription),
    LocaleMetadata(locale: "fr-FR", name: "Shaxian Manager", subtitle: "Ventes, stock et caisse", keywords: "boutique,inventaire,caisse,ventes,clients,restaurant,erp", description: baseDescription),
    LocaleMetadata(locale: "he", name: "Shaxian Manager", subtitle: "Sales, stock and ledger", keywords: "shop,inventory,ledger,sales,customers,food,business,erp", description: baseDescription),
    LocaleMetadata(locale: "hi", name: "Shaxian Manager", subtitle: "Sales, stock and ledger", keywords: "shop,inventory,ledger,sales,customers,food,business,erp", description: baseDescription),
    LocaleMetadata(locale: "hr", name: "Shaxian Manager", subtitle: "Prodaja, zalihe, blagajna", keywords: "trgovina,zalihe,blagajna,prodaja,kupci,hrana,posao,erp", description: baseDescription),
    LocaleMetadata(locale: "hu", name: "Shaxian Manager", subtitle: "Eladás, készlet, kassza", keywords: "bolt,készlet,kassza,eladás,vevők,étel,üzlet,erp", description: baseDescription),
    LocaleMetadata(locale: "id", name: "Shaxian Manager", subtitle: "Penjualan, stok, kas", keywords: "toko,inventaris,kas,penjualan,pelanggan,makanan,bisnis,erp", description: baseDescription),
    LocaleMetadata(locale: "it", name: "Shaxian Manager", subtitle: "Vendite, scorte e cassa", keywords: "negozio,inventario,cassa,vendite,clienti,cibo,business,erp", description: baseDescription),
    LocaleMetadata(locale: "ja", name: "沙県店舗マネージャー", subtitle: "売上、在庫、台帳を管理", keywords: "店舗,在庫,台帳,売上,顧客,飲食,経営,erp", description: baseDescription),
    LocaleMetadata(locale: "ko", name: "샤셴 매장 관리자", subtitle: "매출, 재고, 장부 관리", keywords: "매장,재고,장부,매출,고객,음식,사업,erp", description: baseDescription),
    LocaleMetadata(locale: "ms", name: "Shaxian Manager", subtitle: "Jualan, stok dan lejar", keywords: "kedai,inventori,lejar,jualan,pelanggan,makanan,bisnes,erp", description: baseDescription),
    LocaleMetadata(locale: "nl-NL", name: "Shaxian Manager", subtitle: "Omzet, voorraad, kasboek", keywords: "winkel,voorraad,kasboek,omzet,klanten,eten,bedrijf,erp", description: baseDescription),
    LocaleMetadata(locale: "no", name: "Shaxian Manager", subtitle: "Salg, lager og kasse", keywords: "butikk,lager,kasse,salg,kunder,mat,bedrift,erp", description: baseDescription),
    LocaleMetadata(locale: "pl", name: "Shaxian Manager", subtitle: "Sprzedaż, zapasy, kasa", keywords: "sklep,magazyn,kasa,sprzedaż,klienci,jedzenie,biznes,erp", description: baseDescription),
    LocaleMetadata(locale: "pt-BR", name: "Shaxian Manager", subtitle: "Vendas, estoque e caixa", keywords: "loja,estoque,caixa,vendas,clientes,comida,negócio,erp", description: baseDescription),
    LocaleMetadata(locale: "pt-PT", name: "Shaxian Manager", subtitle: "Vendas, stock e caixa", keywords: "loja,stock,caixa,vendas,clientes,comida,negócio,erp", description: baseDescription),
    LocaleMetadata(locale: "ro", name: "Shaxian Manager", subtitle: "Vânzări, stoc și registru", keywords: "magazin,stoc,registru,vânzări,clienți,mâncare,afacere,erp", description: baseDescription),
    LocaleMetadata(locale: "ru", name: "Shaxian Manager", subtitle: "Продажи, склад и касса", keywords: "магазин,склад,касса,продажи,клиенты,еда,бизнес,erp", description: baseDescription),
    LocaleMetadata(locale: "sk", name: "Shaxian Manager", subtitle: "Predaj, sklad a pokladňa", keywords: "obchod,sklad,pokladňa,predaj,zákazníci,jedlo,podnik,erp", description: baseDescription),
    LocaleMetadata(locale: "sv", name: "Shaxian Manager", subtitle: "Försäljning, lager, kassa", keywords: "butik,lager,kassa,försäljning,kunder,mat,företag,erp", description: baseDescription),
    LocaleMetadata(locale: "th", name: "Shaxian Manager", subtitle: "ยอดขาย สต็อก บัญชี", keywords: "ร้าน,สต็อก,บัญชี,ยอดขาย,ลูกค้า,อาหาร,ธุรกิจ,erp", description: baseDescription),
    LocaleMetadata(locale: "tr", name: "Shaxian Manager", subtitle: "Satış, stok ve kasa", keywords: "dükkan,stok,kasa,satış,müşteri,yemek,iş,erp", description: baseDescription),
    LocaleMetadata(locale: "uk", name: "Shaxian Manager", subtitle: "Продажі, склад і каса", keywords: "магазин,склад,каса,продажі,клієнти,їжа,бізнес,erp", description: baseDescription),
    LocaleMetadata(locale: "vi", name: "Shaxian Manager", subtitle: "Doanh thu, kho, sổ quỹ", keywords: "cửa hàng,kho,sổ quỹ,doanh thu,khách hàng,đồ ăn,kinh doanh,erp", description: baseDescription),
    LocaleMetadata(locale: "zh-Hans", name: "沙县小吃店铺管家-经营日报-材料库存", subtitle: "经营日报、材料库存、流水账", keywords: "沙县小吃,店铺管理,库存,流水,客户,进货,成本,ERP", description: """
沙县小吃店铺管家-经营日报-材料库存是一款面向沙县小吃、小吃档口、夫妻店和小型餐饮店的轻量经营工具。

你可以在一个地方记录每日收入、材料成本、净流水、客户资料、材料库存、供应商、低库存预警和简单财务流水。

第一版专注店主每天真正会用的高频场景：打开经营日报、记一笔收入或支出、更新材料余量、标记需要补货的原料、沉淀回头客和团餐客户。

当前数据保存在本机，无需登录账号。
"""),
    LocaleMetadata(locale: "zh-Hant", name: "沙縣小吃店鋪管家-經營日報-材料庫存", subtitle: "經營日報、材料庫存、流水帳", keywords: "沙縣小吃,店鋪管理,庫存,流水,客戶,進貨,成本,ERP", description: """
沙縣小吃店鋪管家-經營日報-材料庫存是一款面向沙縣小吃、小吃檔口、夫妻店和小型餐飲店的輕量經營工具。

你可以在一個地方記錄每日收入、材料成本、淨流水、客戶資料、材料庫存、供應商、低庫存預警和簡單財務流水。

第一版專注店主每天真正會用的高頻場景：打開經營日報、記一筆收入或支出、更新材料餘量、標記需要補貨的原料、沉澱回頭客和團餐客戶。

目前資料保存在本機，無需登入帳號。
""")
]

let root = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let metadataRoot = root.appendingPathComponent("fastlane/metadata")
let fileManager = FileManager.default

for item in metadata {
    let dir = metadataRoot.appendingPathComponent(item.locale)
    try fileManager.createDirectory(at: dir, withIntermediateDirectories: true)
    try item.name.write(to: dir.appendingPathComponent("name.txt"), atomically: true, encoding: .utf8)
    try item.subtitle.write(to: dir.appendingPathComponent("subtitle.txt"), atomically: true, encoding: .utf8)
    try item.keywords.write(to: dir.appendingPathComponent("keywords.txt"), atomically: true, encoding: .utf8)
    try item.description.write(to: dir.appendingPathComponent("description.txt"), atomically: true, encoding: .utf8)
}

print("Generated metadata for \(metadata.count) locales at \(metadataRoot.path)")
