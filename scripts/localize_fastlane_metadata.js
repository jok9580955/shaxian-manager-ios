const fs = require("fs");
const path = require("path");

const root = path.join(process.cwd(), "fastlane", "metadata");

const englishDescription = `Shaxian Store Manager is a lightweight business tool for owner-operated snack shops and small food businesses.

Track daily revenue, material costs, net cashflow, customer records, ingredient inventory, supplier notes, low-stock alerts, and simple ledger entries in one place.

The app is designed for fast daily use: open the daily report, add sales or expenses, update material inventory, and keep a clear record of repeat customers and group orders.

All current records are stored locally on the device. No account is required for the first version.`;

const metadata = {
  "ar-SA": {
    name: "Shaxian Manager",
    subtitle: "المبيعات والمخزون",
    keywords: "متجر,مخزون,دفتر,مبيعات,عملاء,طعام,أعمال,erp",
    description: `Shaxian Store Manager أداة خفيفة لإدارة محلات الوجبات الخفيفة والمطاعم الصغيرة التي يديرها أصحابها.

يمكنك تسجيل الإيراد اليومي، تكلفة المواد، صافي التدفق النقدي، بيانات العملاء، مخزون المكونات، ملاحظات الموردين، تنبيهات انخفاض المخزون، وقيود الدفتر البسيطة في مكان واحد.

صمم التطبيق للاستخدام اليومي السريع: افتح تقرير التشغيل اليومي، أضف عملية بيع أو مصروفا، حدّث كمية المواد، واحتفظ بسجل واضح للعملاء المتكررين وطلبات المجموعات.

تُحفظ السجلات الحالية محليا على الجهاز. لا يلزم إنشاء حساب في الإصدار الأول.`,
  },
  ca: {
    name: "Shaxian Manager",
    subtitle: "Vendes i inventari diari",
    keywords: "botiga,inventari,caixa,vendes,clients,menjar,negoci,erp",
    description: `Shaxian Store Manager és una eina lleugera per a botigues de menjar, snacks i petits negocis de restauració gestionats pel propietari.

Permet registrar ingressos diaris, costos de materials, flux de caixa net, fitxes de clients, inventari d'ingredients, notes de proveïdors, avisos de poc estoc i apunts senzills de caixa en un sol lloc.

L'app està pensada per a l'ús ràpid de cada dia: obre l'informe diari, afegeix vendes o despeses, actualitza materials i conserva un registre clar de clients habituals i comandes de grup.

Les dades actuals es desen localment al dispositiu. A la primera versió no cal cap compte.`,
  },
  cs: {
    name: "Shaxian Manager",
    subtitle: "Denní tržby a sklad",
    keywords: "obchod,sklad,tržby,zákazníci,jídlo,kasa,erp",
    description: `Shaxian Store Manager je lehký nástroj pro malé občerstvení, snack bary a menší gastro provozy řízené přímo majitelem.

Na jednom místě sledujete denní tržby, náklady na suroviny, čistý hotovostní tok, záznamy zákazníků, zásoby ingrediencí, poznámky k dodavatelům, upozornění na nízký stav skladu a jednoduché účetní položky.

Aplikace je navržena pro rychlou každodenní práci: otevřete denní přehled, přidáte prodej nebo výdaj, upravíte stav materiálu a udržíte přehled o stálých zákaznících i skupinových objednávkách.

Aktuální záznamy se ukládají lokálně v zařízení. V první verzi není vyžadován účet.`,
  },
  da: {
    name: "Shaxian Manager",
    subtitle: "Dagligt salg og lager",
    keywords: "butik,lager,kasse,salg,kunder,mad,forretning,erp",
    description: `Shaxian Store Manager er et let forretningsværktøj til ejerledede snackbarer, små spisesteder og mindre madbutikker.

Hold styr på daglig omsætning, materialeomkostninger, netto cashflow, kundekort, ingredienslager, leverandørnoter, advarsler om lav lagerstand og enkle kasseposter samlet ét sted.

Appen er bygget til hurtig daglig brug: åbn dagsrapporten, tilføj salg eller udgifter, opdater materialelageret, og bevar et klart overblik over stamkunder og gruppeordrer.

Alle aktuelle registreringer gemmes lokalt på enheden. Der kræves ingen konto i første version.`,
  },
  "de-DE": {
    name: "Shaxian Manager",
    subtitle: "Umsatz, Lager, Kasse",
    keywords: "laden,lager,kasse,umsatz,kunden,essen,business,erp",
    description: `Shaxian Store Manager ist ein schlankes Geschäftswerkzeug für inhabergeführte Imbisse, Snackshops und kleine Gastronomiebetriebe.

Erfassen Sie Tagesumsatz, Materialkosten, Netto-Cashflow, Kundendaten, Zutatenbestand, Lieferantennotizen, Warnungen bei niedrigem Bestand und einfache Kassen- oder Buchungseinträge an einem Ort.

Die App ist für schnelle tägliche Abläufe gemacht: Tagesbericht öffnen, Verkauf oder Ausgabe eintragen, Materialbestand aktualisieren und Stammkunden sowie Gruppenbestellungen sauber dokumentieren.

Alle aktuellen Daten werden lokal auf dem Gerät gespeichert. Für die erste Version ist kein Konto erforderlich.`,
  },
  el: {
    name: "Shaxian Manager",
    subtitle: "Πωλήσεις και απόθεμα",
    keywords: "κατάστημα,απόθεμα,πωλήσεις,πελάτες,φαγητό,ταμείο,erp",
    description: `Το Shaxian Store Manager είναι ένα ελαφρύ εργαλείο διαχείρισης για μικρά καταστήματα φαγητού, σνακ μπαρ και μικρές επιχειρήσεις εστίασης που λειτουργούν από τον ιδιοκτήτη.

Παρακολουθήστε καθημερινά έσοδα, κόστος υλικών, καθαρή ταμειακή ροή, στοιχεία πελατών, απόθεμα υλικών, σημειώσεις προμηθευτών, ειδοποιήσεις χαμηλού αποθέματος και απλές εγγραφές ταμείου σε ένα σημείο.

Η εφαρμογή έχει σχεδιαστεί για γρήγορη καθημερινή χρήση: ανοίξτε την ημερήσια αναφορά, προσθέστε πωλήσεις ή έξοδα, ενημερώστε τα υλικά και κρατήστε καθαρό αρχείο επαναλαμβανόμενων πελατών και ομαδικών παραγγελιών.

Τα τρέχοντα δεδομένα αποθηκεύονται τοπικά στη συσκευή. Στην πρώτη έκδοση δεν απαιτείται λογαριασμός.`,
  },
  "en-AU": { name: "Shaxian Manager", subtitle: "Sales, stock and ledger", keywords: "shop,inventory,ledger,sales,customers,food,business,erp", description: englishDescription },
  "en-CA": { name: "Shaxian Manager", subtitle: "Sales, stock and ledger", keywords: "shop,inventory,ledger,sales,customers,food,business,erp", description: englishDescription },
  "en-GB": { name: "Shaxian Manager", subtitle: "Sales, stock and ledger", keywords: "shop,inventory,ledger,sales,customers,food,business,erp", description: englishDescription },
  "en-US": { name: "Shaxian Manager", subtitle: "Sales, stock and ledger", keywords: "shop,inventory,ledger,sales,customers,food,business,erp", description: englishDescription },
  "es-ES": {
    name: "Shaxian Manager",
    subtitle: "Ventas, stock y caja",
    keywords: "tienda,inventario,caja,ventas,clientes,comida,negocio,erp",
    description: `Shaxian Store Manager es una herramienta ligera para bares de aperitivos, tiendas de comida y pequeños negocios de restauración gestionados por sus propios dueños.

Permite registrar ingresos diarios, costes de materiales, flujo de caja neto, fichas de clientes, inventario de ingredientes, notas de proveedores, avisos de poco stock y apuntes sencillos de caja en un solo lugar.

La app está pensada para el uso rápido de cada día: abre el informe diario, añade ventas o gastos, actualiza materiales y conserva un registro claro de clientes habituales y pedidos de grupo.

Los datos actuales se guardan localmente en el dispositivo. En la primera versión no hace falta crear una cuenta.`,
  },
  "es-MX": {
    name: "Shaxian Manager",
    subtitle: "Ventas, stock y caja",
    keywords: "tienda,inventario,caja,ventas,clientes,comida,negocio,erp",
    description: `Shaxian Store Manager es una herramienta ligera para fondas, negocios de snacks y pequeños locales de comida administrados por sus propios dueños.

Registra ingresos diarios, costos de materiales, flujo neto de efectivo, datos de clientes, inventario de ingredientes, notas de proveedores, alertas de bajo inventario y movimientos sencillos de caja en un solo lugar.

La app está diseñada para el trabajo rápido de cada día: abre el reporte diario, agrega ventas o gastos, actualiza materiales y conserva un registro claro de clientes frecuentes y pedidos grupales.

Los datos actuales se guardan localmente en el dispositivo. En la primera versión no se requiere cuenta.`,
  },
  fi: {
    name: "Shaxian Manager",
    subtitle: "Myynti, varasto, kassa",
    keywords: "kauppa,varasto,kassa,myynti,asiakkaat,ruoka,erp",
    description: `Shaxian Store Manager on kevyt liiketoimintatyökalu omistajavetoisille välipalapaikoille, pienille ruokakaupoille ja ravintolayrityksille.

Seuraa päivittäisiä tuloja, materiaalikuluja, nettokassavirtaa, asiakastietoja, raaka-ainevarastoa, toimittajamuistiinpanoja, matalan varaston hälytyksiä ja yksinkertaisia kassakirjauksia yhdessä paikassa.

Sovellus on suunniteltu nopeaan päivittäiseen käyttöön: avaa päiväraportti, lisää myynti tai kulu, päivitä materiaalimäärät ja pidä selkeä kirja kanta-asiakkaista sekä ryhmätilauksista.

Nykyiset tiedot tallennetaan paikallisesti laitteelle. Ensimmäisessä versiossa tiliä ei tarvita.`,
  },
  "fr-CA": {
    name: "Shaxian Manager",
    subtitle: "Ventes, stock et caisse",
    keywords: "boutique,inventaire,caisse,ventes,clients,restaurant,erp",
    description: `Shaxian Store Manager est un outil léger pour les comptoirs de repas, casse-croûtes et petits commerces alimentaires exploités par leur propriétaire.

Suivez les revenus quotidiens, les coûts des matières, le flux de trésorerie net, les dossiers clients, l'inventaire des ingrédients, les notes fournisseurs, les alertes de stock bas et les écritures simples de caisse au même endroit.

L'app est conçue pour un usage rapide au quotidien : ouvrir le rapport du jour, ajouter une vente ou une dépense, mettre à jour les matières et garder une trace claire des clients réguliers et des commandes de groupe.

Les données actuelles sont enregistrées localement sur l'appareil. Aucun compte n'est requis dans cette première version.`,
  },
  "fr-FR": {
    name: "Shaxian Manager",
    subtitle: "Ventes, stock et caisse",
    keywords: "boutique,inventaire,caisse,ventes,clients,restaurant,erp",
    description: `Shaxian Store Manager est un outil léger pour snacks, petits restaurants et commerces alimentaires gérés directement par leur propriétaire.

Suivez les recettes quotidiennes, les coûts matières, le flux net de trésorerie, les fiches clients, le stock d'ingrédients, les notes fournisseurs, les alertes de stock bas et les écritures simples de caisse au même endroit.

L'app est conçue pour les gestes rapides du quotidien : ouvrir le rapport du jour, ajouter une vente ou une dépense, mettre à jour les matières et garder une trace claire des habitués et des commandes de groupe.

Les données actuelles sont stockées localement sur l'appareil. Aucun compte n'est requis dans cette première version.`,
  },
  he: {
    name: "Shaxian Manager",
    subtitle: "מכירות ומלאי",
    keywords: "חנות,מלאי,קופה,מכירות,לקוחות,אוכל,עסק,erp",
    description: `Shaxian Store Manager הוא כלי ניהול קל לעסקים קטנים בתחום המזון, דוכני חטיפים ומסעדות קטנות המנוהלים על ידי הבעלים.

אפשר לעקוב במקום אחד אחר הכנסות יומיות, עלויות חומרי גלם, תזרים נטו, פרטי לקוחות, מלאי מרכיבים, הערות ספקים, התראות על מלאי נמוך ורישומי קופה פשוטים.

האפליקציה מיועדת לשימוש יומי מהיר: לפתוח דוח יומי, להוסיף מכירה או הוצאה, לעדכן מלאי חומרים ולשמור רישום ברור של לקוחות חוזרים והזמנות קבוצתיות.

הנתונים הנוכחיים נשמרים מקומית במכשיר. בגרסה הראשונה אין צורך בחשבון.`,
  },
  hi: {
    name: "Shaxian Manager",
    subtitle: "बिक्री और स्टॉक",
    keywords: "दुकान,स्टॉक,बिक्री,ग्राहक,खाना,कैश,erp",
    description: `Shaxian Store Manager मालिक द्वारा चलाए जाने वाले स्नैक शॉप, छोटे भोजन व्यवसाय और छोटे रेस्तरां के लिए हल्का व्यापार प्रबंधन टूल है।

एक ही जगह दैनिक आय, सामग्री लागत, शुद्ध नकद प्रवाह, ग्राहक रिकॉर्ड, सामग्री स्टॉक, सप्लायर नोट्स, कम स्टॉक अलर्ट और सरल लेजर एंट्री दर्ज करें।

ऐप रोजमर्रा के तेज उपयोग के लिए बनाया गया है: दैनिक रिपोर्ट खोलें, बिक्री या खर्च जोड़ें, सामग्री की मात्रा अपडेट करें और नियमित ग्राहकों व समूह ऑर्डर का साफ रिकॉर्ड रखें।

मौजूदा रिकॉर्ड डिवाइस पर स्थानीय रूप से सेव होते हैं। पहले संस्करण में खाते की आवश्यकता नहीं है।`,
  },
  hr: {
    name: "Shaxian Manager",
    subtitle: "Prodaja, zalihe, blagajna",
    keywords: "trgovina,zalihe,blagajna,prodaja,kupci,hrana,erp",
    description: `Shaxian Store Manager lagan je poslovni alat za snack barove, male ugostiteljske objekte i trgovine hranom koje vodi vlasnik.

Na jednom mjestu pratite dnevni prihod, troškove materijala, neto novčani tok, podatke o kupcima, zalihe sastojaka, bilješke dobavljača, upozorenja o niskim zalihama i jednostavne blagajničke zapise.

Aplikacija je osmišljena za brzu svakodnevnu upotrebu: otvorite dnevni izvještaj, dodajte prodaju ili trošak, ažurirajte stanje materijala i vodite jasan zapis o stalnim kupcima i grupnim narudžbama.

Trenutni zapisi spremaju se lokalno na uređaju. U prvoj verziji nije potreban račun.`,
  },
  hu: {
    name: "Shaxian Manager",
    subtitle: "Eladás, készlet, kassza",
    keywords: "bolt,készlet,kassza,eladás,vevők,étel,erp",
    description: `A Shaxian Store Manager könnyű üzleti eszköz tulajdonos által vezetett snackboltok, kis étkezdék és kisebb vendéglátó vállalkozások számára.

Egy helyen követheti a napi bevételt, az alapanyagköltségeket, a nettó pénzmozgást, az ügyféladatokat, az alapanyagkészletet, a beszállítói jegyzeteket, az alacsony készlet figyelmeztetéseket és az egyszerű pénztári bejegyzéseket.

Az app gyors napi használatra készült: nyissa meg a napi jelentést, adjon hozzá eladást vagy kiadást, frissítse az alapanyagokat, és tartsa átláthatóan a visszatérő vevőket és csoportos rendeléseket.

Az aktuális adatok helyben, az eszközön tárolódnak. Az első verzióhoz nincs szükség fiókra.`,
  },
  id: {
    name: "Shaxian Manager",
    subtitle: "Penjualan, stok, kas",
    keywords: "toko,inventaris,kas,penjualan,pelanggan,makanan,erp",
    description: `Shaxian Store Manager adalah alat bisnis ringan untuk kedai makanan, toko camilan, dan usaha kuliner kecil yang dikelola langsung oleh pemilik.

Catat pendapatan harian, biaya bahan, arus kas bersih, data pelanggan, inventaris bahan, catatan pemasok, peringatan stok rendah, dan entri buku kas sederhana di satu tempat.

Aplikasi ini dirancang untuk penggunaan harian yang cepat: buka laporan harian, tambahkan penjualan atau pengeluaran, perbarui stok bahan, dan simpan catatan jelas untuk pelanggan tetap serta pesanan rombongan.

Semua data saat ini disimpan secara lokal di perangkat. Versi pertama tidak memerlukan akun.`,
  },
  it: {
    name: "Shaxian Manager",
    subtitle: "Vendite, scorte e cassa",
    keywords: "negozio,inventario,cassa,vendite,clienti,cibo,erp",
    description: `Shaxian Store Manager è uno strumento leggero per snack bar, piccoli locali e attività alimentari gestite direttamente dal proprietario.

Registra in un unico posto ricavi giornalieri, costi dei materiali, flusso di cassa netto, schede clienti, inventario degli ingredienti, note sui fornitori, avvisi di scorte basse e semplici movimenti di cassa.

L'app è pensata per l'uso rapido di ogni giorno: apri il report giornaliero, aggiungi vendite o spese, aggiorna le quantità dei materiali e mantieni un registro chiaro di clienti abituali e ordini di gruppo.

I dati attuali sono salvati localmente sul dispositivo. Nella prima versione non è richiesto alcun account.`,
  },
  ja: {
    name: "沙県店舗マネージャー",
    subtitle: "売上、在庫、台帳を管理",
    keywords: "店舗,在庫,台帳,売上,顧客,飲食,経営,erp",
    description: `沙県店舗マネージャーは、店主が自分で運営する軽食店、小規模飲食店、個人店向けの軽量な経営管理ツールです。

日々の売上、材料費、純キャッシュフロー、顧客記録、食材在庫、仕入先メモ、在庫不足アラート、簡単な帳簿入力を一か所で管理できます。

毎日の素早い作業を重視しています。営業日報を開き、売上や支出を追加し、材料の残量を更新し、常連客や団体注文の記録を整理できます。

現在のデータは端末内に保存されます。初回バージョンではアカウント登録は不要です。`,
  },
  ko: {
    name: "샤셴 매장 관리자",
    subtitle: "매출, 재고, 장부 관리",
    keywords: "매장,재고,장부,매출,고객,음식,사업,erp",
    description: `샤셴 매장 관리자는 사장님이 직접 운영하는 분식점, 작은 음식점, 소규모 식품 매장을 위한 가벼운 경영 관리 도구입니다.

하루 매출, 재료비, 순현금흐름, 고객 기록, 식재료 재고, 공급처 메모, 재고 부족 알림, 간단한 장부 입력을 한곳에서 관리할 수 있습니다.

매일 빠르게 쓰도록 설계했습니다. 영업 일보를 열고, 매출이나 지출을 추가하고, 재료 수량을 갱신하며, 단골 고객과 단체 주문 기록을 정리하세요.

현재 기록은 기기에 로컬로 저장됩니다. 첫 버전에서는 계정이 필요하지 않습니다.`,
  },
  ms: {
    name: "Shaxian Manager",
    subtitle: "Jualan, stok dan lejar",
    keywords: "kedai,inventori,lejar,jualan,pelanggan,makanan,erp",
    description: `Shaxian Store Manager ialah alat perniagaan ringan untuk kedai snek, kedai makanan kecil dan perniagaan makanan yang diurus sendiri oleh pemilik.

Rekod hasil harian, kos bahan, aliran tunai bersih, maklumat pelanggan, inventori bahan, nota pembekal, amaran stok rendah dan catatan lejar ringkas di satu tempat.

Aplikasi ini direka untuk kegunaan harian yang pantas: buka laporan harian, tambah jualan atau perbelanjaan, kemas kini stok bahan dan simpan rekod jelas untuk pelanggan tetap serta pesanan berkumpulan.

Semua rekod semasa disimpan secara setempat pada peranti. Versi pertama tidak memerlukan akaun.`,
  },
  "nl-NL": {
    name: "Shaxian Manager",
    subtitle: "Omzet, voorraad, kasboek",
    keywords: "winkel,voorraad,kasboek,omzet,klanten,eten,erp",
    description: `Shaxian Store Manager is een lichte zakelijke tool voor snackbars, kleine eetwinkels en foodzaken die door de eigenaar zelf worden gerund.

Houd dagelijkse omzet, materiaalkosten, netto kasstroom, klantgegevens, ingrediëntenvoorraad, leveranciersnotities, waarschuwingen voor lage voorraad en eenvoudige kasboekregels bij op één plek.

De app is gemaakt voor snel dagelijks gebruik: open het dagrapport, voeg verkopen of uitgaven toe, werk de materiaalvoorraad bij en bewaar een duidelijk overzicht van vaste klanten en groepsbestellingen.

Alle huidige gegevens worden lokaal op het apparaat opgeslagen. Voor de eerste versie is geen account nodig.`,
  },
  no: {
    name: "Shaxian Manager",
    subtitle: "Salg, lager og kasse",
    keywords: "butikk,lager,kasse,salg,kunder,mat,bedrift,erp",
    description: `Shaxian Store Manager er et lett forretningsverktøy for eierdrevne snackbarer, små serveringssteder og mindre matbutikker.

Følg daglige inntekter, materialkostnader, netto kontantstrøm, kundedata, ingredienslager, leverandørnotater, varsler om lav lagerbeholdning og enkle kasseposter på ett sted.

Appen er laget for rask daglig bruk: åpne dagsrapporten, legg til salg eller utgifter, oppdater materiallageret og hold en tydelig oversikt over faste kunder og gruppebestillinger.

Alle nåværende registreringer lagres lokalt på enheten. I første versjon kreves ingen konto.`,
  },
  pl: {
    name: "Shaxian Manager",
    subtitle: "Sprzedaż, zapasy, kasa",
    keywords: "sklep,magazyn,kasa,sprzedaż,klienci,jedzenie,erp",
    description: `Shaxian Store Manager to lekkie narzędzie biznesowe dla prowadzonych przez właściciela barów, małych punktów gastronomicznych i niewielkich firm spożywczych.

W jednym miejscu śledź dzienne przychody, koszty materiałów, przepływ gotówki netto, dane klientów, zapasy składników, notatki o dostawcach, alerty niskiego stanu oraz proste wpisy kasowe.

Aplikacja została zaprojektowana do szybkiej codziennej pracy: otwórz raport dnia, dodaj sprzedaż lub wydatek, zaktualizuj materiały i zachowaj czytelny zapis stałych klientów oraz zamówień grupowych.

Bieżące dane są przechowywane lokalnie na urządzeniu. W pierwszej wersji konto nie jest wymagane.`,
  },
  "pt-BR": {
    name: "Shaxian Manager",
    subtitle: "Vendas, estoque e caixa",
    keywords: "loja,estoque,caixa,vendas,clientes,comida,erp",
    description: `Shaxian Store Manager é uma ferramenta leve para lanchonetes, pequenos restaurantes e negócios de comida administrados pelo próprio dono.

Registre receita diária, custos de materiais, fluxo de caixa líquido, dados de clientes, estoque de ingredientes, notas de fornecedores, alertas de estoque baixo e lançamentos simples de caixa em um só lugar.

O app foi pensado para uso rápido no dia a dia: abra o relatório diário, adicione vendas ou despesas, atualize materiais e mantenha um registro claro de clientes recorrentes e pedidos em grupo.

Os dados atuais ficam salvos localmente no dispositivo. Na primeira versão, não é necessário criar conta.`,
  },
  "pt-PT": {
    name: "Shaxian Manager",
    subtitle: "Vendas, stock e caixa",
    keywords: "loja,stock,caixa,vendas,clientes,comida,erp",
    description: `Shaxian Store Manager é uma ferramenta leve para snack-bars, pequenos restaurantes e negócios de comida geridos pelo próprio proprietário.

Registe receitas diárias, custos de materiais, fluxo de caixa líquido, dados de clientes, inventário de ingredientes, notas de fornecedores, alertas de stock baixo e movimentos simples de caixa num só lugar.

A app foi pensada para uso rápido no dia a dia: abra o relatório diário, adicione vendas ou despesas, atualize materiais e mantenha um registo claro de clientes habituais e encomendas de grupo.

Os dados atuais são guardados localmente no dispositivo. Na primeira versão, não é necessária conta.`,
  },
  ro: {
    name: "Shaxian Manager",
    subtitle: "Vânzări, stoc și registru",
    keywords: "magazin,stoc,registru,vânzări,clienți,mâncare,erp",
    description: `Shaxian Store Manager este un instrument ușor pentru snack baruri, mici restaurante și afaceri alimentare administrate direct de proprietar.

Urmăriți într-un singur loc veniturile zilnice, costurile materialelor, fluxul net de numerar, datele clienților, stocul de ingrediente, notele furnizorilor, alertele de stoc redus și înregistrările simple de casă.

Aplicația este gândită pentru utilizare rapidă zilnică: deschideți raportul zilei, adăugați vânzări sau cheltuieli, actualizați materialele și păstrați o evidență clară a clienților fideli și a comenzilor de grup.

Datele curente sunt stocate local pe dispozitiv. În prima versiune nu este necesar niciun cont.`,
  },
  ru: {
    name: "Shaxian Manager",
    subtitle: "Продажи, склад и касса",
    keywords: "магазин,склад,касса,продажи,клиенты,еда,erp",
    description: `Shaxian Store Manager — легкий инструмент для закусочных, небольших кафе и малых предприятий питания, которыми управляет сам владелец.

В одном месте можно учитывать дневную выручку, расходы на материалы, чистый денежный поток, данные клиентов, запас ингредиентов, заметки по поставщикам, предупреждения о низком остатке и простые записи кассы.

Приложение создано для быстрого ежедневного использования: откройте дневной отчет, добавьте продажу или расход, обновите остатки материалов и ведите понятную историю постоянных клиентов и групповых заказов.

Текущие записи хранятся локально на устройстве. В первой версии учетная запись не требуется.`,
  },
  sk: {
    name: "Shaxian Manager",
    subtitle: "Predaj, sklad a pokladňa",
    keywords: "obchod,sklad,pokladňa,predaj,zákazníci,jedlo,erp",
    description: `Shaxian Store Manager je ľahký nástroj pre malé občerstvenia, snack bary a menšie gastro prevádzky vedené priamo majiteľom.

Na jednom mieste sledujte denné tržby, náklady na materiál, čistý peňažný tok, údaje o zákazníkoch, zásoby surovín, poznámky k dodávateľom, upozornenia na nízky stav a jednoduché pokladničné záznamy.

Aplikácia je navrhnutá na rýchle každodenné používanie: otvorte denný report, pridajte predaj alebo výdavok, aktualizujte materiály a udržujte jasný prehľad o stálych zákazníkoch a skupinových objednávkach.

Aktuálne záznamy sa ukladajú lokálne v zariadení. V prvej verzii nie je potrebný účet.`,
  },
  sv: {
    name: "Shaxian Manager",
    subtitle: "Försäljning, lager, kassa",
    keywords: "butik,lager,kassa,försäljning,kunder,mat,erp",
    description: `Shaxian Store Manager är ett lätt affärsverktyg för ägarledda snackbarer, små matbutiker och mindre restaurangverksamheter.

Följ dagliga intäkter, materialkostnader, nettokassaflöde, kundregister, ingredienslager, leverantörsanteckningar, varningar för lågt lager och enkla kassaboksposter på ett ställe.

Appen är gjord för snabb daglig användning: öppna dagsrapporten, lägg till försäljning eller utgifter, uppdatera materiallagret och håll tydlig ordning på återkommande kunder och gruppbeställningar.

Alla aktuella poster sparas lokalt på enheten. I första versionen krävs inget konto.`,
  },
  th: {
    name: "Shaxian Manager",
    subtitle: "ยอดขาย สต็อก บัญชี",
    keywords: "ร้าน,สต็อก,ขาย,ลูกค้า,อาหาร,erp",
    description: `Shaxian Store Manager เป็นเครื่องมือธุรกิจขนาดเบาสำหรับร้านของกินเล่น ร้านอาหารขนาดเล็ก และกิจการอาหารที่เจ้าของดูแลเอง

บันทึกรายได้รายวัน ต้นทุนวัตถุดิบ กระแสเงินสดสุทธิ ข้อมูลลูกค้า สต็อกส่วนผสม หมายเหตุซัพพลายเออร์ การแจ้งเตือนสต็อกต่ำ และรายการบัญชีง่าย ๆ ได้ในที่เดียว

แอปออกแบบมาเพื่อการใช้งานประจำวันอย่างรวดเร็ว: เปิดรายงานรายวัน เพิ่มยอดขายหรือค่าใช้จ่าย อัปเดตวัตถุดิบ และเก็บประวัติลูกค้าประจำกับออเดอร์กลุ่มให้ชัดเจน

ข้อมูลปัจจุบันจัดเก็บไว้ในเครื่อง ไม่ต้องมีบัญชีสำหรับเวอร์ชันแรก`,
  },
  tr: {
    name: "Shaxian Manager",
    subtitle: "Satış, stok ve kasa",
    keywords: "dükkan,stok,kasa,satış,müşteri,yemek,iş,erp",
    description: `Shaxian Store Manager, sahibi tarafından işletilen atıştırmalık dükkanları, küçük lokantalar ve küçük gıda işletmeleri için hafif bir iş yönetimi aracıdır.

Günlük geliri, malzeme maliyetlerini, net nakit akışını, müşteri kayıtlarını, malzeme stokunu, tedarikçi notlarını, düşük stok uyarılarını ve basit kasa kayıtlarını tek yerde takip edin.

Uygulama hızlı günlük kullanım için tasarlandı: günlük raporu açın, satış veya gider ekleyin, malzeme miktarlarını güncelleyin ve düzenli müşteriler ile grup siparişlerini net şekilde kaydedin.

Mevcut kayıtlar cihazda yerel olarak saklanır. İlk sürümde hesap gerekmez.`,
  },
  uk: {
    name: "Shaxian Manager",
    subtitle: "Продажі, склад і каса",
    keywords: "магазин,склад,каса,продажі,клієнти,їжа,erp",
    description: `Shaxian Store Manager — легкий інструмент для закусочних, невеликих кафе та малих харчових бізнесів, якими керує сам власник.

В одному місці можна вести щоденну виручку, витрати на матеріали, чистий грошовий потік, дані клієнтів, запас інгредієнтів, нотатки постачальників, попередження про низький залишок і прості касові записи.

Додаток створено для швидкого щоденного використання: відкрийте денний звіт, додайте продаж або витрату, оновіть залишки матеріалів і зберігайте зрозумілу історію постійних клієнтів та групових замовлень.

Поточні записи зберігаються локально на пристрої. У першій версії обліковий запис не потрібен.`,
  },
  vi: {
    name: "Shaxian Manager",
    subtitle: "Doanh thu, kho, sổ quỹ",
    keywords: "cửa hàng,kho,sổ quỹ,doanh thu,khách hàng,đồ ăn,erp",
    description: `Shaxian Store Manager là công cụ quản lý nhẹ cho quán ăn vặt, cửa hàng đồ ăn nhỏ và cơ sở kinh doanh ẩm thực do chủ quán tự vận hành.

Theo dõi doanh thu hằng ngày, chi phí nguyên liệu, dòng tiền ròng, hồ sơ khách hàng, tồn kho nguyên liệu, ghi chú nhà cung cấp, cảnh báo sắp hết hàng và các khoản thu chi đơn giản trong một nơi.

Ứng dụng được thiết kế để dùng nhanh mỗi ngày: mở báo cáo kinh doanh, thêm doanh thu hoặc chi phí, cập nhật lượng nguyên liệu và lưu rõ khách quen cùng đơn đặt theo nhóm.

Dữ liệu hiện tại được lưu cục bộ trên thiết bị. Phiên bản đầu tiên không yêu cầu tài khoản.`,
  },
  "zh-Hans": {
    name: "沙县小吃店铺管家-经营日报-材料库存",
    subtitle: "经营日报、材料库存、流水账",
    keywords: "沙县小吃,店铺管理,库存,流水,客户,进货,成本,ERP",
    description: `沙县小吃店铺管家-经营日报-材料库存是一款面向沙县小吃、小吃档口、夫妻店和小型餐饮店的轻量经营工具。

你可以在一个地方记录每日收入、材料成本、净流水、客户资料、材料库存、供应商、低库存预警和简单财务流水。

第一版专注店主每天真正会用的高频场景：打开经营日报、记一笔收入或支出、更新材料余量、标记需要补货的原料、沉淀回头客和团餐客户。

当前数据保存在本机，无需登录账号。`,
  },
  "zh-Hant": {
    name: "沙縣小吃店鋪管家-經營日報-材料庫存",
    subtitle: "經營日報、材料庫存、流水帳",
    keywords: "沙縣小吃,店鋪管理,庫存,流水,客戶,進貨,成本,ERP",
    description: `沙縣小吃店鋪管家-經營日報-材料庫存是一款面向沙縣小吃、小吃檔口、夫妻店和小型餐飲店的輕量經營工具。

你可以在一個地方記錄每日收入、材料成本、淨流水、客戶資料、材料庫存、供應商、低庫存預警和簡單財務流水。

第一版專注店主每天真正會用的高頻場景：打開經營日報、記一筆收入或支出、更新材料餘量、標記需要補貨的原料、沉澱回頭客和團餐客戶。

目前資料保存在本機，無需登入帳號。`,
  },
};

if (!fs.existsSync(root)) {
  throw new Error("fastlane/metadata does not exist");
}

const existingLocales = fs.readdirSync(root)
  .filter((entry) => fs.statSync(path.join(root, entry)).isDirectory())
  .sort();
const missing = existingLocales.filter((locale) => !metadata[locale]);
if (missing.length > 0) {
  throw new Error(`missing metadata translations for: ${missing.join(", ")}`);
}

for (const locale of existingLocales) {
  const dir = path.join(root, locale);
  const item = metadata[locale];
  for (const [file, value] of Object.entries({
    "name.txt": item.name,
    "subtitle.txt": item.subtitle,
    "keywords.txt": item.keywords,
    "description.txt": item.description,
  })) {
    fs.writeFileSync(path.join(dir, file), `${value.trim()}\n`, "utf8");
  }
}

console.log(`localized_metadata=${existingLocales.length}`);
