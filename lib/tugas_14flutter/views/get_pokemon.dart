import 'package:flutter/material.dart';
import 'package:ppkd_b_3/tugas_14flutter/api/get_pokemon.dart';
import 'package:ppkd_b_3/tugas_14flutter/model/pokemon_model.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});
  static const id = "/get_pokemon";

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder<List<Result>>(
                future: getPokemon(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    final pokemons = snapshot.data as List<Result>;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: pokemons.length,
                      itemBuilder: (BuildContext context, int index) {
                        final dataPokemons = pokemons[index];
                        return ListTile(
                          leading: Image.network(dataPokemons.url ?? ""),
                          title: Text(dataPokemons.name ?? ""),
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
    );
  }
}
