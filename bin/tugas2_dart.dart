import 'dart:io';

void main() {
  print('================================');
  print('       PROGRAM DART');
  print('================================');

  print('\nLOGIN');

  stdout.write('Username: ');
  String username = stdin.readLineSync() ?? '';

  stdout.write('Password: ');
  String password = stdin.readLineSync() ?? '';

  if (username == 'kayana' && password == '12345678') {
    print('\nLogin berhasil!');
    menuUtama();
  } else {
    print('\nUsername atau password salah!');
  }
}

void menuUtama() {
  print('\n================================');
  print('          MENU UTAMA');
  print('================================');
  print('1. Data Kelompok');
  print('2. Penjumlahan');
  print('3. Pengurangan');
  print('4. Perkalian');
  print('5. Pembagian');
  print('6. Ganjil / Genap');
  print('7. Jumlah Total Angka');
  print('0. Keluar');
  print('================================');

  stdout.write('Pilih menu: ');
  String pilihan = stdin.readLineSync() ?? '';

  print('\nKamu memilih menu: $pilihan');
}
