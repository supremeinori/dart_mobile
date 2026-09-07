import 'dart:io';

/// Fungsi utama program
void main() {
  print('========================================');
  print('           PROGRAM DART TERMINAL        ');
  print('========================================');

  // Menjalankan proses login terlebih dahulu
  login();

  // Setelah login berhasil, masuk ke menu utama
  menuUtama();
}

/// 1. LOGIN
/// Fungsi untuk menangani otentikasi user dengan akun demo
void login() {
  const String usernameBenar = 'admin';
  const String passwordBenar = '12345678';
  bool isLogin = false;

  print('\n----------------------------------------');
  print('                 LOGIN                  ');
  print('----------------------------------------');

  while (!isLogin) {
    stdout.write('Username: ');
    String username = stdin.readLineSync()?.trim() ?? '';

    stdout.write('Password: ');
    String password = stdin.readLineSync()?.trim() ?? '';

    if (username == usernameBenar && password == passwordBenar) {
      print('\nLogin berhasil!');
      isLogin = true;
    } else {
      print('\nUsername atau password salah. Silakan coba lagi.\n');
    }
  }
}

/// MENU UTAMA
/// Mengontrol alur program dan pemanggilan fitur berdasarkan pilihan user
void menuUtama() {
  bool berjalan = true;

  while (berjalan) {
    print('\n========================================');
    print('              MENU UTAMA                ');
    print('========================================');
    print('1. Data Kelompok');
    print('2. Penjumlahan');
    print('3. Pengurangan');
    print('4. Perkalian');
    print('5. Pembagian');
    print('6. Ganjil / Genap');
    print('7. Jumlah Total Angka');
    print('0. Keluar');
    print('========================================');

    stdout.write('Pilih menu: ');
    String pilihan = stdin.readLineSync()?.trim() ?? '';

    switch (pilihan) {
      case '1':
        dataKelompok();
        break;
      case '2':
        penjumlahan();
        break;
      case '3':
        pengurangan();
        break;
      case '4':
        perkalian();
        break;
      case '5':
        pembagian();
        break;
      case '6':
        cekGanjilGenap();
        break;
      case '7':
        totalAngka();
        break;
      case '0':
        print('\nProgram selesai. Terima kasih!');
        berjalan = false;
        break;
      default:
        print('\nPilihan menu tidak valid. Silakan masukkan opsi 0-7.');
        break;
    }
  }
}

/// 2. DATA KELOMPOK
/// Menampilkan daftar anggota kelompok beserta NIM
void dataKelompok() {
  print('\n========================================');
  print('             DATA KELOMPOK              ');
  print('========================================');
  print('1. Michael Aldo Tri Cahya');
  print('   NIM: 124230124\n');
  print('2. Bintang Dirgantoro Gien');
  print('   NIM: 124240088\n');
  print('3. Pinto Mande Mantofani');
  print('   NIM: 124240118');
  print('========================================');
}

/// 3. PENJUMLAHAN
/// Menghitung penjumlahan dari dua angka
void penjumlahan() {
  print('\n----------------------------------------');
  print('              PENJUMLAHAN               ');
  print('----------------------------------------');
  double a = bacaAngka('Angka pertama: ');
  double b = bacaAngka('Angka kedua  : ');

  double hasil = a + b;
  print('\nHasil:');
  print('${formatAngka(a)} + ${formatAngka(b)} = ${formatAngka(hasil)}');
}

/// 4. PENGURANGAN
/// Menghitung pengurangan dari dua angka
void pengurangan() {
  print('\n----------------------------------------');
  print('              PENGURANGAN               ');
  print('----------------------------------------');
  double a = bacaAngka('Angka pertama: ');
  double b = bacaAngka('Angka kedua  : ');

  double hasil = a - b;
  print('\nHasil:');
  print('${formatAngka(a)} - ${formatAngka(b)} = ${formatAngka(hasil)}');
}

/// 5. PERKALIAN
/// Menghitung perkalian dari dua angka
void perkalian() {
  print('\n----------------------------------------');
  print('               PERKALIAN                ');
  print('----------------------------------------');
  double a = bacaAngka('Angka pertama: ');
  double b = bacaAngka('Angka kedua  : ');

  double hasil = a * b;
  print('\nHasil:');
  print('${formatAngka(a)} × ${formatAngka(b)} = ${formatAngka(hasil)}');
}

/// 6. PEMBAGIAN
/// Menghitung pembagian dua angka dengan penanganan pembagian dengan 0
void pembagian() {
  print('\n----------------------------------------');
  print('               PEMBAGIAN                ');
  print('----------------------------------------');
  double a = bacaAngka('Angka pertama: ');
  double b = bacaAngka('Angka kedua  : ');

  print('\nHasil:');
  if (b == 0) {
    print('Tidak dapat melakukan pembagian dengan 0.');
  } else {
    double hasil = a / b;
    print('${formatAngka(a)} / ${formatAngka(b)} = ${formatAngka(hasil)}');
  }
}

/// 7. GANJIL / GENAP
/// Menentukan apakah sebuah bilangan bulat bernilai ganjil atau genap
void cekGanjilGenap() {
  print('\n----------------------------------------');
  print('            GANJIL / GENAP              ');
  print('----------------------------------------');
  int angka = bacaInt('Masukkan bilangan: ');

  print('\nHasil:');
  if (angka % 2 == 0) {
    print('$angka adalah bilangan genap.');
  } else {
    print('$angka adalah bilangan ganjil.');
  }
}

/// 8. JUMLAH TOTAL ANGKA
/// Menghitung jumlah total dari beberapa angka yang dimasukkan user
void totalAngka() {
  print('\n----------------------------------------');
  print('          JUMLAH TOTAL ANGKA            ');
  print('----------------------------------------');
  int banyak = bacaInt('Berapa banyak angka yang ingin dimasukkan: ', harusPositif: true);

  double total = 0;
  for (int i = 1; i <= banyak; i++) {
    double angka = bacaAngka('Angka ke-$i: ');
    total += angka;
  }

  print('\nHasil:');
  print('Total = ${formatAngka(total)}');
}

// ==================================================
// FUNGSI PEMBANTU (HELPER) UNTUK VALIDASI INPUT
// ==================================================

/// Membaca input desimal/angka dengan validasi tryParse
double bacaAngka(String prompt) {
  while (true) {
    stdout.write(prompt);
    String input = stdin.readLineSync()?.trim() ?? '';
    double? angka = double.tryParse(input);

    if (angka != null) {
      return angka;
    } else {
      print('Input tidak valid. Silakan masukkan angka.');
    }
  }
}

/// Membaca input bilangan bulat (int) dengan validasi tryParse
int bacaInt(String prompt, {bool harusPositif = false}) {
  while (true) {
    stdout.write(prompt);
    String input = stdin.readLineSync()?.trim() ?? '';
    int? angka = int.tryParse(input);

    if (angka != null) {
      if (harusPositif && angka <= 0) {
        print('Input tidak valid. Masukkan angka bulat lebih dari 0.');
      } else {
        return angka;
      }
    } else {
      print('Input tidak valid. Silakan masukkan angka.');
    }
  }
}

/// Memformat angka agar tampilan .0 dihilangkan jika berupa bilangan bulat
String formatAngka(double angka) {
  if (angka == angka.toInt()) {
    return angka.toInt().toString();
  }
  return angka.toString();
}
