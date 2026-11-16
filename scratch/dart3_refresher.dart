// ignore_for_file: avoid_print

// 1. abstract interface class: kontrak yang HARUS diimplementasikan.
abstract interface class Penyapa {
  String sapa(String nama);
}

class PenyapaSopan implements Penyapa {
  const PenyapaSopan();

  @override
  String sapa(String nama) => 'Selamat datang di $nama';
}

class Kotak<T> {
  const Kotak(this.isi);

  final T isi;
}

sealed class Hasil<T> {
  const Hasil();
}

final class Berhasil<T> extends Hasil<T> {
  const Berhasil(this.data);

  final T data;
}

final class Gagal<T> extends Hasil<T> {
  const Gagal(this.pesan);

  final String pesan;
}

final class Memuat<T> extends Hasil<T> {}

String tampilkan(Hasil<int> hasil) {
  return switch (hasil) {
    Berhasil(:final data) => 'Berhasil, data = $data',
    Gagal(:final pesan) => 'Gagal: $pesan',
    // TODO: Handle this case.
    Memuat<int>() => throw UnimplementedError(),
  };
}

void main() {
  const kotak = Kotak<int>(5);
  const kotakStr = Kotak<String>('isi');

  print(kotak.isi);
  print(kotakStr.isi);

  print(const PenyapaSopan().sapa('Baim'));
}
