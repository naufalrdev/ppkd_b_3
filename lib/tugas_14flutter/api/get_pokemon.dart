import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ppkd_b_3/tugas_14flutter/model/detail_model.dart';
import 'package:ppkd_b_3/tugas_14flutter/model/pokemon_model.dart';

Future<List<Result>> getPokemon() async {
  final response = await http.get(
    Uri.parse("https://pokeapi.co/api/v2/pokemon"),
  );
  print(response.body);
  if (response.statusCode == 200) {
    final List<dynamic> pokemonJson = json.decode(response.body)["results"];
    return pokemonJson.map((json) => Result.fromJson(json)).toList();
  } else {
    throw Exception("Failed To Load Data");
  }
}

Future<PokeDetail> getDetailPokemon(String url) async {
  final response = await http.get(Uri.parse(url));
  print(response.body);
  if (response.statusCode == 200) {
    return PokeDetail.fromJson(json.decode(response.body));
  } else {
    throw Exception("Failed To Load Data");
  }
}
