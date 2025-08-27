import 'package:flutter/material.dart';
import 'package:ppkd_b_3/tugas_14flutter/api/get_pokemon.dart';
import 'package:ppkd_b_3/tugas_14flutter/model/detail_model.dart';

class PokemonDetail extends StatefulWidget {
  final String url;
  const PokemonDetail({super.key, required this.url});

  @override
  State<PokemonDetail> createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {
  PokeDetail? data;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final response = await getDetailPokemon(widget.url);
    data = response;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: data == null
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 176,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.redAccent,
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsetsGeometry.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 55,
                              backgroundColor: Colors.transparent,
                              child: Image.network(
                                data?.sprites.frontDefault ?? "",
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              data?.name.toUpperCase() ?? "",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "DETAIL INFORMATION",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ID:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      data?.id.toString() ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Height:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      data?.height.toString() ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Weight:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      data?.weight.toString() ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Base Experience:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      data?.baseExperience.toString() ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  "Statistic",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),

                ListView.builder(
                  shrinkWrap: true,
                  itemCount: data?.stats.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    final stat = data!.stats[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          stat.stat.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          stat.baseStat.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
    );
  }
}
