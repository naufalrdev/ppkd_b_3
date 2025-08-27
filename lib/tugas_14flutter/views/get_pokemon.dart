import 'package:flutter/material.dart';
import 'package:ppkd_b_3/extensions/navigations.dart';
import 'package:ppkd_b_3/tugas_14flutter/api/get_pokemon.dart';
import 'package:ppkd_b_3/tugas_14flutter/model/pokemon_model.dart';
import 'package:ppkd_b_3/tugas_14flutter/views/burbasaur_screen.dart';

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
              FutureBuilder<List<Pokemon>>(
                future: getPokemon(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    final pokemon = snapshot.data as List<Pokemon>;
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: pokemon.length,
                      itemBuilder: (BuildContext context, int index) {
                        final dataPokemons = pokemon[index];
                        return ListTile(
                          onTap: () {
                            context.push(PokemonDetail(pokemon: dataPokemons));
                          },
                          leading: Image.network(dataPokemons.img ?? ""),
                          title: Text(dataPokemons.num ?? ""),
                          subtitle: Text(dataPokemons.name ?? ""),
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
