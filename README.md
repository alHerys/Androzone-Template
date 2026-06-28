# Template Starter Flutter: Perbandingan State Management

Proyek ini adalah template dasar Flutter yang dirancang untuk membandingkan tiga pustaka (library) pengelola status (*state management*) yang populer: Provider, Riverpod, dan BLoC (Cubit). 

Tujuan utama proyek ini adalah memberikan contoh implementasi nyata berdampingan dari ketiga sistem tersebut agar Anda dapat menilai langsung kelebihan dan kekurangan masing-masing dalam kebutuhan proyek Anda.

---

## Struktur Direktori

Direktori proyek disusun menggunakan pendekatan berbasis fitur (*feature-first*) agar mudah dikembangkan dan dirapikan seiring bertambahnya modul.

- **`lib/app/`**: Konfigurasi global aplikasi seperti pengaturan rute (*routing*) menggunakan GoRouter.
- **`lib/core/`**: Bagian bersama yang mencakup desain sistem, tema warna, dan tipografi global.
- **`lib/features/`**: Folder utama fitur aplikasi yang dibagi berdasarkan domain bisnis (seperti splash screen, onboarding, serta contoh fitur counter dan autentikasi).
- **`assets/`**: Penyimpanan berkas statis gambar dan ikon aplikasi.

---

## Pembagian Branch Git

Untuk mempermudah pembandingan, repositori ini memisahkan fitur autentikasi (*auth*) ke dalam beberapa branch terpisah sesuai pustaka pengelola status yang digunakan:

1. **`main`**: Berisi demo penghitung (*Counter*) sederhana yang menggunakan ketiga pengelola status secara bersamaan di satu halaman dashboard utama. Branch ini juga berisi struktur dasar tema, splash screen, dan halaman onboarding.
2. **`feature/provider`**: Contoh implementasi fitur login dan pendaftaran pengguna menggunakan Provider.
3. **`feature/riverpod`**: Contoh implementasi fitur login dan pendaftaran pengguna menggunakan Riverpod.
4. **`feature/bloc`**: Contoh implementasi fitur login dan pendaftaran pengguna menggunakan BLoC (Cubit).

Kredensial percobaan (dummy) untuk halaman login:
- **Email**: `admin@example.com`
- **Password**: `password123`

---

## Perbandingan State Management

Berikut perbandingan objektif dari ketiga pustaka pengelola status yang diimplementasikan dalam proyek ini:

| Kriteria | Provider | Riverpod | BLoC / Cubit |
| :--- | :--- | :--- | :--- |
| **Tingkat Kesulitan** | Mudah dipelajari karena mirip dengan arsitektur bawaan Flutter. | Sedang, memerlukan pemahaman tentang konsep provider global di luar widget. | Tinggi, membutuhkan pemahaman tentang aliran data asinkron (*streams*) dan event. |
| **Kode Boilerplate** | Sangat sedikit. | Sedikit hingga sedang. | Cukup banyak karena harus mendefinisikan event, state, dan kelas BLoC. |
| **Ketergantungan Context** | Ya, membutuhkan `BuildContext` untuk membaca status. | Tidak, menggunakan objek `WidgetRef` untuk membaca status di luar *context*. | Ya, membutuhkan `BuildContext` untuk mencari provider BLoC yang sesuai. |
| **Skalabilitas** | Cocok untuk proyek kecil hingga menengah. | Sangat baik untuk proyek skala kecil hingga besar. | Sangat baik untuk proyek skala besar dengan tim yang banyak. |

---

## Panduan Penggunaan Google Fonts

Proyek ini menggunakan pustaka `google_fonts` untuk mengatur tipografi global secara dinamis.

### Penggunaan Standar (Memerlukan Koneksi Internet)
Font akan diunduh secara otomatis dari server Google saat aplikasi pertama kali dijalankan dan disimpan di dalam penyimpanan lokal perangkat:
```dart
import 'package:google_fonts/google_fonts.dart';

final TextStyle gayaTeks = GoogleFonts.inter(
  fontSize: 16,
  fontWeight: FontWeight.normal,
);
```

### Penggunaan Luring (Offline / Tanpa Internet)
Untuk menghindari kegagalan pemuatan font karena masalah koneksi internet:
1. Unduh berkas font `.ttf` (misalnya Inter-Regular.ttf) dari situs Google Fonts.
2. Letakkan berkas font tersebut di dalam direktori `assets/fonts/`.
3. Daftarkan aset font tersebut di dalam berkas `pubspec.yaml`:
   ```yaml
   flutter:
     fonts:
       - family: Inter
         fonts:
           - asset: assets/fonts/Inter-Regular.ttf
   ```
4. Tambahkan baris konfigurasi berikut di fungsi `main()` sebelum `runApp` dijalankan untuk memberi tahu library agar menggunakan berkas lokal:
   ```dart
   import 'package:flutter/services.dart';
   // Konfigurasi lisensi font jika diperlukan
   ```

---

## Panduan Pembuatan Ikon Peluncur dan Splash Screen

### Ikon Peluncur (App Icon)
Proyek ini menggunakan paket `icons_launcher` untuk memperbarui ikon aplikasi secara otomatis. 
- **Persyaratan Aset**: Gunakan gambar persegi berformat PNG dengan resolusi minimal 512x512 piksel. Pastikan tidak ada area transparan pada pinggiran gambar agar ikon tampil maksimal pada perangkat Android.
- **Cara Membuat**:
  1. Siapkan logo Anda dan simpan di `assets/images/logo.png`.
  2. Jalankan perintah berikut di terminal:
     ```bash
     dart run icons_launcher:create
     ```

### Splash Screen
Proyek ini menggunakan paket `flutter_native_splash` untuk memodifikasi splash screen bawaan perangkat.
- **Persyaratan Aset**: Siapkan logo berformat PNG dengan resolusi minimal 1024x1024 piksel untuk diletakkan di bagian tengah layar.
- **Cara Membuat**:
  1. Sesuaikan konfigurasi warna latar belakang dan letak gambar pada bagian `flutter_native_splash` di dalam berkas `pubspec.yaml`.
  2. Jalankan perintah berikut di terminal:
     ```bash
     flutter pub run flutter_native_splash:create
     ```

Tautan dokumentasi resmi untuk pengaturan ikon dan splash screen:
- [Dokumentasi Resmi Icons Launcher](https://pub.dev/packages/icons_launcher)
- [Dokumentasi Resmi Flutter Native Splash](https://pub.dev/packages/flutter_native_splash)

---

## Tautan Dokumentasi Resmi

Gunakan tautan di bawah ini untuk mempelajari dasar teori dari masing-masing pustaka pengelola status secara mendalam:
- [Dokumentasi Resmi Provider](https://pub.dev/packages/provider)
- [Dokumentasi Resmi Riverpod](https://riverpod.dev)
- [Dokumentasi Resmi BLoC](https://bloclibrary.dev)

---

## Referensi Video YouTube

*(Bagian ini dapat diisi dengan tautan video YouTube pilihan untuk referensi belajar visual bagi peserta pelatihan atau tim pengembang)*
- [Placeholder: Video Panduan Dasar State Management]()
- [Placeholder: Video Pembahasan Komparasi Arsitektur Flutter]()
