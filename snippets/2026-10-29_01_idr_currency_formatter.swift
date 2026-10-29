import Foundation

// 2026-10-29 — 01: Format mata uang Rupiah untuk tampilan saldo.
// Dipakai di aplikasi perbankan: angka mentah dari API tidak pernah
// ditampilkan apa adanya, selalu lewat formatter yang sama supaya
// konsisten di semua layar (saldo, mutasi, nominal transfer).

enum IDRFormatter {

    /// Formatter tunggal yang dipakai ulang, bukan dibuat per panggilan.
    /// Locale id_ID menghasilkan pemisah ribuan titik dan simbol "Rp".
    static let currency: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "id_ID")
        formatter.numberStyle = .currency
        formatter.currencyCode = "IDR"
        formatter.currencySymbol = "Rp"
        formatter.maximumFractionDigits = 0
        formatter.minimumFractionDigits = 0
        return formatter
    }()

    /// "Rp1.250.000" dari 1250000. Mengembalikan "-" bila gagal diformat,
    /// supaya UI tidak pernah menampilkan angka mentah yang ambigu.
    static func string(from amount: Decimal) -> String {
        currency.string(from: amount as NSDecimalNumber) ?? "-"
    }

    /// Versi ringkas untuk ruang sempit, mis. kartu ringkasan:
    /// 1.250.000 -> "Rp1,25 jt", 850.000.000 -> "Rp850 jt".
    /// Ambang dipilih supaya angka tetap terbaca sekilas.
    static func compactString(from amount: Decimal) -> String {
        let value = (amount as NSDecimalNumber).doubleValue
        switch value {
        case 1_000_000_000...:
            return String(format: "Rp%.2f M", value / 1_000_000_000)
        case 1_000_000...:
            return String(format: "Rp%.2f jt", value / 1_000_000)
        case 1_000...:
            return String(format: "Rp%.0f rb", value / 1_000)
        default:
            return string(from: amount)
        }
    }
}

// Contoh pemakaian:
// IDRFormatter.string(from: 1250000)        // "Rp1.250.000"
// IDRFormatter.compactString(from: 2500000) // "Rp2.50 jt"
//
// Catatan: jangan memformat dengan string interpolation manual
// ("Rp\(amount)") — pemisah ribuan dan pembulatan jadi tidak konsisten.
