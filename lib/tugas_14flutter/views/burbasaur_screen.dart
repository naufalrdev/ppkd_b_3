import 'package:flutter/material.dart';
import 'package:ppkd_b_3/tugas_14flutter/model/pokemon_model.dart';

class PokemonDetail extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonDetail({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.network(
              pokemon.img ?? "",
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),
          Text(pokemon.height ?? ""),
          Text(pokemon.weight ?? ""),
        ],
      ),
    );
  }
}
