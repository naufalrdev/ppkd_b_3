import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ppkd_b_3/app_color.dart';

class Tugas5Flutter extends StatefulWidget {
  const Tugas5Flutter({super.key});

  @override
  State<Tugas5Flutter> createState() => _Tugas5Flutter();
}

class _Tugas5Flutter extends State<Tugas5Flutter> {
  bool showNama = false;
  bool isLiked = false;
  bool showDeskripsi = false;
  int count = 0;
  bool showInkWell = false;
  bool showBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Halaman Interaksi",
          style: TextStyle(fontFamily: "Lobster", fontSize: 30),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count++;
          });
        },
        child: Icon(FontAwesomeIcons.plus),
      ),

      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      AppColor.mintGreen,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      showNama = !showNama;
                    });
                  },
                  child: Text(
                    showNama ? 'Sembunyikan ' : 'Tampilkan ',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Delius",
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                if (showNama)
                  Text(
                    "Nama Saya: Naufal Rifky Dwi Putra",
                    style: TextStyle(fontFamily: "DM_Serif_Text", fontSize: 18),
                  ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isLiked = !isLiked;
                  });
                },
                icon: Icon(
                  Icons.favorite,
                  color: isLiked ? Colors.red : Colors.grey,
                  size: 40,
                ),
              ),
              SizedBox(width: 20),
              if (isLiked)
                Text(
                  "Aku Cinta Kamu",
                  style: TextStyle(fontFamily: "DM_Serif_Text", fontSize: 18),
                ),
            ],
          ),
          SizedBox(height: 20),

          Center(
            child: Column(
              children: [
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      AppColor.pinkPastel,
                    ),
                  ),

                  onPressed: () {
                    setState(() {
                      showDeskripsi = !showDeskripsi;
                    });
                  },
                  child: Text(
                    showDeskripsi ? "Sembunyikan" : "Lihat Selengkapnya",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Delius",
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                if (showDeskripsi)
                  Text(
                    "Warna merah adalah cinta",
                    style: TextStyle(fontFamily: "DM_Serif_Text", fontSize: 18),
                  ),
              ],
            ),
          ),

          SizedBox(height: 30),

          Column(
            children: [
              Padding(
                padding: EdgeInsetsGeometry.all(16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                        AppColor.merahMudaLembut,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        count++;
                      });
                      print(count);
                    },
                    child: Text("Tambah"),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(count.toString(), style: TextStyle(fontSize: 60)),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {});
                      count--;
                      print(count);
                    },
                    icon: Icon(Icons.minimize),
                  ),
                  SizedBox(width: 20),

                  IconButton(
                    onPressed: () {
                      setState(() {});
                      count++;
                      print(count);
                    },
                    icon: Icon(Icons.add),
                  ),
                ],
              ),

              SizedBox(height: 30),

              InkWell(
                onTap: () {
                  print('Kotak disentuh');
                  setState(() {
                    showBox = !showBox;
                  });
                },

                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: AppColor.pastelBlue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text("Kotak Berhadiah")),
                  ),
                ),
              ),
              if (showBox) Text("Selamat anda mendapatkan motor!"),
            ],
          ),

          SizedBox(height: 30),
          // GestureDetector
          GestureDetector(
            onTap: () => print('Aku ditekan'),
            onDoubleTap: () => print('Kyaa aku ditekan'),
            onLongPress: () => print('Araa araa'),

            // child: Container(
            //   padding: EdgeInsets.all(12),
            //   color: Colors.orange[100],
            //   child: Text('Tekan Aku'),
            // ),
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 16,
                vertical: 4,
              ),
              child: Container(
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppColor.kuningPastel,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Text("Coba Tekan")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
