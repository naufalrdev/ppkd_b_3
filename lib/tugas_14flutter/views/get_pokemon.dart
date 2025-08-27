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
  List<Result> allPokemon = [];
  List<Result> filteredPokemon = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPokemon();
  }

  void fetchPokemon() async {
    final result = await getPokemon();
    setState(() {
      allPokemon = result;
      filteredPokemon = result;
      isLoading = false;
    });
  }

  void refreshPokemon() {
    fetchPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Colors.transparent,
        onPressed: refreshPokemon,
        child: Image.asset(fit: BoxFit.cover, "assets/images/pokebola.png"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Pokémon...',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (query) {
                    setState(() {
                      filteredPokemon = allPokemon
                          .where(
                            (pokemon) => pokemon.name.toLowerCase().contains(
                              query.toLowerCase(),
                            ),
                          )
                          .toList();
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              isLoading
                  ? CircularProgressIndicator()
                  : ListView.builder(
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
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
