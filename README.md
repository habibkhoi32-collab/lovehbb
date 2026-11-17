# Love × Universe — Deploy ke Vercel + Supabase

## 1. Supabase (gratis)
1. Buat project di https://supabase.com.
2. SQL Editor → tempel isi `supabase.sql` → Run (membuat tabel + bucket publik `media`).
3. Project Settings → API: catat **Project URL**, **anon key**, **service_role key**.

## 2. Vercel (gratis)
1. Upload folder ini ke repo GitHub baru, lalu di https://vercel.com → Add New → Project → pilih repo.
   (Framework Preset: **Other**. Tanpa build command.)
2. Settings → Environment Variables, isi semua dari `.env.example`:
   SUPABASE_URL, SUPABASE_ANON_KEY, SUPABASE_SERVICE_KEY, SESSION_SECRET (string acak ≥32 karakter),
   INITIAL_VISITOR_CODE (4 angka), INITIAL_ADMIN_CODE (min 6 karakter).
3. Deploy. Buka URL-nya, ketik kode pengunjung.
   Alternatif via terminal: `npm i -g vercel && vercel --prod`.

## 3. Domain sendiri
Vercel → Project → Settings → Domains → Add → ikuti instruksi DNS (CNAME/A) di penyedia domain Anda.

## 4. Pemakaian
- Admin: ketuk logo kiri atas 3x → kode admin. Ubah kode di tab `security` (disimpan sebagai hash di database).
- Teks, foto/video (maks 50 MB), musik (Spotify / unggah M4A-MP4-MP3), tema: semua tersimpan di Supabase dan sama di semua device (sinkron tiap ±10 detik).
- QR code: tempel URL ke generator QR (mis. qr-code-generator) lalu unduh PNG.

## Keamanan
- Kode diverifikasi di server (scrypt), sesi memakai cookie HttpOnly. 5x salah per IP → terkunci 10 menit.
- Jangan commit `.env`. Service key hanya ada di environment Vercel.
- Bucket `media` publik dengan nama file acak (UUID); siapa pun yang punya URL file bisa membukanya.
