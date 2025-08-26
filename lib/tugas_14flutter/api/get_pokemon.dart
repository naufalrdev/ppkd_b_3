import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ppkd_b_3/tugas_14flutter/model/pokemon_model.dart';

Future<List<Pokemon>> getPokemon() async {
  final response = await http.get(
    Uri.parse(
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json",
    ),
  );
  print(response.body);
  if (response.statusCode == 200) {
    final List<dynamic> pokemonJson = json.decode(response.body)["pokemon"];
    return pokemonJson.map((json) => Pokemon.fromJson(json)).toList();
  } else {
    throw Exception("Failed To Load Data");
  }
}
