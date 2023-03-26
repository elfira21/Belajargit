//Nama: Dimas Aditya
/*NIM : 6701213003
Kelas: D3 Sistem Informasi 02
*/

import 'dart:collection';

class KardusMieInstan {
  String merek;
  DateTime tanggalKadaluwarsa;
  DateTime tanggalDatang;

  KardusMieInstan(this.merek, this.tanggalKadaluwarsa, this.tanggalDatang);
}

class GudangMieInstan {
  List<List<Queue<KardusMieInstan>>> stok = List.generate(
      3, (_) => List.generate(4, (_) => Queue<KardusMieInstan>()));

  void tambah(int jumlah) {
    for (int i = 0; i < jumlah; i++) {
      KardusMieInstan kardus = KardusMieInstan(
          "Mie Instan", DateTime.now().add(Duration(days: 90)), DateTime.now());
      bool kardusDitambahkan = false;
      for (int r = 0; r < stok.length && !kardusDitambahkan; r++) {
        for (int c = 0; c < stok[r].length && !kardusDitambahkan; c++) {
          if (stok[r][c].length < 5) {
            stok[r][c].add(kardus);
            kardusDitambahkan = true;
          }
        }
      }
      if (!kardusDitambahkan) {
        print("Gudang sudah penuh, gudang tidak bisa diisi kembali");
        return;
      }
    }
    print("$jumlah kardus berhasil ditambahkan ke dalam stok");
  }

  void ambil(int jumlah) {
    int kardusDihapus = 0;
    for (int r = 0; r < stok.length && kardusDihapus < jumlah; r++) {
      for (int c = 0; c < stok[r].length && kardusDihapus < jumlah; c++) {
        while (stok[r][c].isNotEmpty && kardusDihapus < jumlah) {
          stok[r][c].removeLast();
          kardusDihapus++;
        }
      }
    }
    print("$kardusDihapus kardus berhasil diambil dari stok");
  }

  int hitungJumlah() {
    int jumlahKardus = 0;
    for (int r = 0; r < stok.length; r++) {
      for (int c = 0; c < stok[r].length; c++) {
        jumlahKardus += stok[r][c].length;
      }
    }
    return jumlahKardus;
  }
}

void main() {
  GudangMieInstan gudang = GudangMieInstan();
  gudang.tambah(40);
  print(gudang.hitungJumlah());
  gudang.ambil(5);
  print(gudang.hitungJumlah());
}
