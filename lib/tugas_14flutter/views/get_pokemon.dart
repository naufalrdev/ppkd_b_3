import 'package:flutter/material.dart';
import 'package:ppkd_b_3/extensions/navigations.dart';
import 'package:ppkd_b_3/tugas_14flutter/api/get_pokemon.dart';
import 'package:ppkd_b_3/tugas_14flutter/model/pokemon_model.dart';
import 'package:ppkd_b_3/tugas_14flutter/views/pokemon_detail.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});
  static const id = "/get_pokemon";

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  TextEditingController searchController = TextEditingController();
  String searchQuery = "";

  Future<void> refreshPokemon() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   onPressed: refreshPokemon,
      //   child: Image.asset(fit: BoxFit.cover, "assets/images/pokebola.png"),
      // ),
      body: RefreshIndicator(
        onRefresh: refreshPokemon,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: "Search Pokemon...",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: searchQuery.isNotEmpty
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  searchQuery = "";
                                  searchController.clear();
                                });
                              },
                              icon: Icon(Icons.clear),
                            )
                          : null,
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value.toLowerCase();
                      });
                    },
                  ),
                ),
                FutureBuilder<List<Result>>(
                  future: getPokemon(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasData) {
                      final pokemon = snapshot.data as List<Result>;
                      final filteredPokemon = pokemon
                          .where(
                            (poke) =>
                                poke.name.toLowerCase().contains(searchQuery),
                          )
                          .toList();
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: filteredPokemon.length,
                        itemBuilder: (BuildContext context, int index) {
                          final dataPokemons = filteredPokemon[index];
                          return Card(
                            margin: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: ListTile(
                              onTap: () {
                                context.push(
                                  PokemonDetail(url: dataPokemons.url),
                                );
                              },
                              title: Text(
                                dataPokemons.name.toUpperCase(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return Text("Failed To Load Data");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
