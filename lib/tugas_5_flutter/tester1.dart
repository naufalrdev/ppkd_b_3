import 'package:flutter/material.dart';
import 'package:ppkd_b_3/colors.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
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
          style: TextStyle(fontFamily: "Lobster"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count++;
          });
        },
        child: Icon(Icons.add),
      ),

      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      Colors.tealAccent,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      showNama = !showNama;
                    });
                  },
                  child: Text(showNama ? 'Sembunyikan ' : 'Tampilkan '),
                ),
                SizedBox(height: 20),
                if (showNama) Text("Nama Saya: Naufal Rifky Dwi Putra"),
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
                ),
              ),
              if (isLiked) Text("Aku Cinta Kamu"),
            ],
          ),

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
                  ),
                ),
                SizedBox(height: 10),
                if (showDeskripsi) Text("Warna merah adalah cinta"),
              ],
            ),
          ),

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
              SizedBox(height: 20),
              Text(count.toString(), style: TextStyle(fontSize: 40)),

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

              InkWell(
                onTap: () {
                  print('Kotak disentuh');
                  setState(() {
                    showBox = !showBox;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  // width: double.infinity,
                  // height: 50,
                  color: Colors.blue[200],
                  alignment: Alignment.center,
                  child: Text(
                    'Tekan kotak ini',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              if (showBox) Text('Kotak telah disentuh!'),
            ],
          ),

          SizedBox(height: 30),
          // GestureDetector
          GestureDetector(
            onTap: () => print('Ditekan sekali'),
            onDoubleTap: () => print('Ditekan dua kali'),
            onLongPress: () => print('Tahan lama'),
            child: Container(
              padding: EdgeInsets.all(12),
              color: Colors.orange[100],
              child: Text('Tekan Aku'),
            ),
          ),
        ],
      ),
    );
  }
}
