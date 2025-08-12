import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ==================== MODEL PRODUK ====================
class Produk {
  final String nama;
  final String deskripsi;
  final String gambar;

  Produk({required this.nama, required this.deskripsi, required this.gambar});
}

// ==================== APP ====================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 9 Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const KategoriPage(),
    );
  }
}

// ==================== PAGE STATEFUL ====================
class KategoriPage extends StatefulWidget {
  const KategoriPage({super.key});

  @override
  State<KategoriPage> createState() => _KategoriPageState();
}

class _KategoriPageState extends State<KategoriPage> {
  // 1️⃣ List biasa (nama kategori)
  final List<String> kategoriList = [
    "Buah-buahan",
    "Sayuran",
    "Elektronik",
    "Pakaian Pria",
    "Pakaian Wanita",
    "Alat Tulis Kantor",
  ];

  // 2️⃣ List<Map> dengan ikon
  final List<Map<String, dynamic>> kategoriMap = [
    {"nama": "Buah-buahan", "ikon": Icons.apple},
    {"nama": "Sayuran", "ikon": Icons.grass},
    {"nama": "Elektronik", "ikon": Icons.devices},
    {"nama": "Pakaian Pria", "ikon": Icons.male},
    {"nama": "Pakaian Wanita", "ikon": Icons.female},
    {"nama": "Alat Tulis Kantor", "ikon": Icons.edit},
  ];

  // 3️⃣ List Produk (model)
  final List<Produk> produkList = [
    Produk(
      nama: "Apel Fuji",
      deskripsi: "Apel segar dari Jepang",
      gambar: "https://via.placeholder.com/100",
    ),
    Produk(
      nama: "Laptop Gaming",
      deskripsi: "Laptop high-end untuk gaming",
      gambar: "https://via.placeholder.com/100",
    ),
    Produk(
      nama: "Kaos Polos",
      deskripsi: "Kaos katun nyaman dipakai",
      gambar: "https://via.placeholder.com/100",
    ),
  ];

  int selectedIndex = 0; // untuk model kategori terpilih

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        appBar: AppBar(title: const Text("Tugas 9 Flutter")),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1️⃣ List biasa
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "1. List Biasa",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  itemCount: kategoriList.length,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text(kategoriList[index]));
                  },
                ),
              ),

              const Divider(),

              // 2️⃣ List<Map>
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "2. List<Map> dengan Ikon",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  itemCount: kategoriMap.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(kategoriMap[index]["ikon"]),
                      title: Text(kategoriMap[index]["nama"]),
                    );
                  },
                ),
              ),

              const Divider(),

              // 3️⃣ Model
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "3. Model - Produk Berdasarkan Kategori",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: kategoriList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ChoiceChip(
                        label: Text(kategoriList[index]),
                        selected: selectedIndex == index,
                        onSelected: (val) {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: produkList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(produkList[index].gambar),
                    title: Text(produkList[index].nama),
                    subtitle: Text(produkList[index].deskripsi),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
