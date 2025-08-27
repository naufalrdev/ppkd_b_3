import 'package:flutter/material.dart';
import 'package:ppkd_b_3/tugas_14flutter/api/get_pokemon.dart';
import 'package:ppkd_b_3/tugas_14flutter/model/detail_model.dart';
import 'package:ppkd_b_3/tugas_14flutter/utils/get_color.dart';

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
    final primaryType = data?.types.isNotEmpty == true
        ? data!.types[0].type.name
        : "normal";

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
                    color: getTypeColor(primaryType),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 30, left: 16, right: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.transparent,
                          child: Image.network(
                            data?.sprites.frontDefault ?? "",
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              data?.name.toUpperCase() ?? "",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 6),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: (data?.types ?? []).map((type) {
                                final typeName = type.type.name;
                                return Container(
                                  margin: EdgeInsets.only(bottom: 4),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: getTypeColor(typeName),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    typeName.toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ],
                    ),
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
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: data!.stats.map((stat) {
                    return Container(
                      width: MediaQuery.of(context).size.width / 3 - 24,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            stat.baseStat.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.pinkAccent,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            stat.stat.name.replaceAll('-', ' ').toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
    );
  }
}
