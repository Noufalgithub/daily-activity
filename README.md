# Daily Activity — Noufalgithub

Repo ini dibuat supaya contribution graph GitHub terisi dari kerja nyata,
bukan dari commit kosong.

Prinsipnya: tiap hari 1 topik kecil, dipecah jadi 5 commit kecil yang
masing-masing bisa dibaca orang lain:

1. `snippet` — kode / komponen baru
2. `preview` — contoh pemakaian / preview
3. `test` — unit test kecil untuk snippet itu
4. `refactor` — rapikan nama / struktur
5. `docs` — catatan di `log/YYYY-MM-DD.md`: apa yang dipelajari, apa yang masih bingung

Kenapa dipecah begitu? Karena recruiter / reviewer yang klik graph-mu
tidak cuma lihat kotak hijau — mereka buka history. 5x push 1 baris acak
per hari akan kelihatan kosong di history, dan itu justru merusak
kredibilitas dibanding graph yang agak sepi tapi isinya jelas.

## Cara pakai (di Mac)

```bash
# sekali saja
git init
git remote add origin https://github.com/Noufalgithub/daily-activity.git
# ganti nama repo di atas kalau kamu pakai nama lain

# tiap hari
cp log/TEMPLATE.md log/2026-10-29.md
# kerjakan 1 snippet di snippets/, commit per langkah di atas
git add snippets/... && git commit -m "snippet: ..."
git push origin main
```

Fokus awal yang paling nyambung sama kerja barumu di BSI (mulai 2 Nov 2026):
SwiftUI — 1 komponen kecil per hari (Button style, List row, form field, dsb).
Kalau hari itu lagi sibuk, 1 snippet + catatan 3 baris di log sudah cukup,
tidak harus selalu 5 commit.

## Struktur

- `snippets/` — kode kecil per hari, dipisah per topik
- `log/` — catatan harian, 1 file per hari
