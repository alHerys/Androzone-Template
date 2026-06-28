# Template Starter Flutter Androzon Mobile Engineer 2026

Proyek ini adalah template dasar Flutter untuk project Androzon Mobile Engineer 2026.

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

Untuk menghindari kegagalan pemuatan font karena masalah koneksi internet pada perangkat pengguna, Anda dapat membungkus berkas font `.ttf` langsung ke dalam aset aplikasi. Ikuti langkah-langkah detail berikut:

#### Langkah 1: Unduh Berkas Font
1. Kunjungi situs resmi [Google Fonts](https://fonts.google.com).
2. Cari keluarga font yang Anda gunakan (contoh: **Inter**).
3. Unduh berkas font tersebut (format `.zip`) dan ekstrak berkas `.ttf` dari berat/gaya font yang Anda butuhkan (seperti `Inter-Regular.ttf`, `Inter-Bold.ttf`, `Inter-SemiBold.ttf`).
4. **PENTING**: Jangan ubah nama berkas `.ttf` tersebut. Paket `google_fonts` mencocokkan berkas secara presisi berdasarkan nama asli dari API Google Fonts.

#### Langkah 2: Pindahkan ke Folder Proyek
1. Buat direktori bernama `google_fonts` pada root proyek Anda (atau buat folder `assets/google_fonts/`).
2. Masukkan semua berkas `.ttf` yang telah diunduh ke dalam direktori tersebut.

#### Langkah 3: Daftarkan di `pubspec.yaml`
Daftarkan direktori tersebut di dalam bagian `assets:` pada berkas `pubspec.yaml` Anda (cukup daftarkan foldernya saja, tidak perlu mendaftarkan setiap berkas satu per satu, dan **JANGAN** menggunakan bagian `fonts:` bawaan Flutter karena akan ditangani secara otomatis oleh paket `google_fonts`):
```yaml
flutter:
  assets:
    - google_fonts/  # Jika diletakkan di root proyek
    # ATAU
    - assets/google_fonts/ # Jika diletakkan di dalam folder assets
```

#### Langkah 4: Matikan Runtime Fetching di Kode Dart
Untuk memastikan aplikasi Anda tidak pernah melakukan panggilan jaringan internet (HTTP request) dan memaksa pemuatan font dari aset lokal, tambahkan konfigurasi berikut di fungsi `main()` pada berkas `lib/main.dart` sebelum `runApp` dijalankan:
```dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Impor paket Google Fonts

void main() {
  // Tambahkan baris ini untuk mematikan pengunduhan font via internet secara dinamis
  GoogleFonts.config.allowRuntimeFetching = false;

  runApp(const MyApp());
}
```

Setelah konfigurasi di atas selesai, Anda tetap dapat memanggil font seperti biasa di kode UI Anda (misalnya `GoogleFonts.inter()`), dan paket `google_fonts` akan secara otomatis mencari berkas pencocokan lokal di dalam folder aset yang telah Anda daftarkan.

---

## Panduan Pembuatan Ikon Peluncur dan Splash Screen

### Ikon Peluncur (App Icon)
Proyek ini menggunakan paket `icons_launcher` untuk memperbarui ikon aplikasi secara otomatis. 
- **Persyaratan Aset**: Gunakan gambar persegi berformat PNG dengan resolusi minimal 512x512 piksel. Pastikan tidak ada area transparan pada pinggiran gambar agar ikon tampil maksimal pada perangkat Android.
- **Cara Membuat**:
  1. Siapkan ikon Anda dan simpan di `assets/icons/icon_launcher.png`.
  2. Jalankan perintah berikut di terminal:
     ```bash
     dart run icons_launcher:create
     ```

### Splash Screen
Proyek ini menggunakan paket `flutter_native_splash` untuk memodifikasi splash screen bawaan perangkat.
- **Persyaratan Aset**: Siapkan logo berformat PNG dengan resolusi minimal 1024x1024 piksel untuk diletakkan di bagian tengah layar.
- **Cara Membuat**:
  1. Siapkan gambar splash screen Anda dan simpan di `assets/images/splash_screen.png`.
  2. Sesuaikan konfigurasi warna latar belakang dan letak gambar pada bagian `flutter_native_splash` di dalam berkas `pubspec.yaml`.
  3. Jalankan perintah berikut di terminal:
     ```bash
     flutter pub run flutter_native_splash:create
     ```

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
