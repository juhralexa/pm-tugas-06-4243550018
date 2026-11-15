import 'package:material_ui/material_ui.dart';

/// Model data satu destinasi wisata.
class Destinasi {
  const Destinasi({
    required this.id,
    required this.nama,
    required this.lokasi,
    required this.kategori,
    required this.deskripsi,
    required this.harga, // 0 = gratis
    required this.gambar,
    required this.ikon,
    required this.warna,
  });

  final int id;
  final String nama;
  final String lokasi; // kabupaten/kota
  final String kategori;
  final String deskripsi;
  final int harga;
  final String gambar; // path foto di assets
  final IconData ikon; // cadangan bila foto gagal dimuat
  final Color warna;

  /// Teks harga tiket: "Gratis" atau "Rp15.000".
  String get tiket => harga == 0 ? 'Gratis' : harga.rupiah;
}

const daftarDestinasi = <Destinasi>[
  Destinasi(
    id: 1, nama: 'Danau Toba', lokasi: 'Kab. Samosir',
    kategori: 'Wisata Alam', harga: 0,
    gambar: 'assets/images/danau_toba.jpg',
    deskripsi: 'Danau vulkanik terbesar di Asia Tenggara dengan Pulau Samosir di tengahnya.',
    ikon: Icons.water, warna: Color(0xFF0277BD),
  ),
  Destinasi(
    id: 2, nama: 'Bukit Lawang', lokasi: 'Kab. Langkat',
    kategori: 'Wisata Alam', harga: 20000,
    gambar: 'assets/images/bukit_lawang.jpg',
    deskripsi: 'Pintu masuk Taman Nasional Gunung Leuser, terkenal dengan orangutan Sumatera.',
    ikon: Icons.park, warna: Color(0xFF2E7D32),
  ),
  Destinasi(
    id: 3, nama: 'Gunung Sibayak', lokasi: 'Kab. Karo',
    kategori: 'Pendakian', harga: 10000,
    gambar: 'assets/images/gunung_sibayak.jpg',
    deskripsi: 'Gunung berapi aktif dekat Berastagi dengan kawah belerang dan jalur pendakian.',
    ikon: Icons.terrain, warna: Color(0xFFEF6C00),
  ),
  Destinasi(
    id: 4, nama: 'Istana Maimun', lokasi: 'Kota Medan',
    kategori: 'Sejarah', harga: 5000,
    gambar: 'assets/images/istana_maimun.jpg',
    deskripsi: 'Istana Kesultanan Deli bergaya Melayu, Mughal, dan Eropa.',
    ikon: Icons.account_balance, warna: Color(0xFFF9A825),
  ),
  Destinasi(
    id: 5, nama: 'Air Terjun Efrata', lokasi: 'Kab. Samosir',
    kategori: 'Wisata Alam', harga: 10000,
    gambar: 'assets/images/air_terjun_efrata.jpg',
    deskripsi: 'Air terjun bertingkat dengan suasana sejuk di kawasan Samosir.',
    ikon: Icons.waterfall_chart, warna: Color(0xFF00838F),
  ),
  Destinasi(
    id: 6, nama: 'Kebun Teh Damanik', lokasi: 'Kab. Simalungun',
    kategori: 'Perkebunan', harga: 0,
    gambar: 'assets/images/kebun_teh_damanik.jpg',
    deskripsi: 'Hamparan kebun teh hijau yang sejuk dan cocok untuk berfoto.',
    ikon: Icons.grass, warna: Color(0xFF558B2F),
  ),
  Destinasi(
    id: 7, nama: 'Pulau Kalimantung', lokasi: 'Kab. Tapanuli Tengah',
    kategori: 'Pantai', harga: 50000,
    gambar: 'assets/images/pulau_kalimantung.jpg',
    deskripsi: 'Pulau dengan air laut jernih berwarna toska, cocok untuk snorkeling.',
    ikon: Icons.beach_access, warna: Color(0xFF00ACC1),
  ),
];

/// Cari destinasi berdasarkan id; null jika tidak ada.
Destinasi? cariDestinasi(int id) {
  for (final d in daftarDestinasi) {
    if (d.id == id) return d;
  }
  return null;
}

extension Rupiah on int {
  String get rupiah {
    final pola = RegExp(r'\B(?=(\d{3})+(?!\d))');
    return 'Rp${toString().replaceAllMapped(pola, (m) => '.')}';
  }
}