// To parse this JSON data, do
//
//     final pokemonDataResponse = pokemonDataResponseFromJson(jsonString);

import 'dart:convert';

PokemonDataResponse pokemonDataResponseFromJson(String str) =>
    PokemonDataResponse.fromJson(json.decode(str));

String pokemonDataResponseToJson(PokemonDataResponse data) =>
    json.encode(data.toJson());

class PokemonDataResponse {
  List<Pokemon> pokemon;

  PokemonDataResponse({required this.pokemon});

  factory PokemonDataResponse.fromJson(Map<String, dynamic> json) =>
      PokemonDataResponse(
        pokemon: List<Pokemon>.from(
          json["pokemon"].map((x) => Pokemon.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
    "pokemon": List<dynamic>.from(pokemon.map((x) => x.toJson())),
  };
}

class Pokemon {
  int id;
  String num;
  String name;
  String img;
  List<String> type;
  String height;
  String weight;
  String candy;
  int? candyCount;
  String egg;
  double spawnChance;
  double avgSpawns;
  String spawnTime;
  List<double>? multipliers;
  List<String> weaknesses;
  List<Evolution>? nextEvolution;
  List<Evolution>? prevEvolution;

  Pokemon({
    required this.id,
    required this.num,
    required this.name,
    required this.img,
    required this.type,
    required this.height,
    required this.weight,
    required this.candy,
    this.candyCount,
    required this.egg,
    required this.spawnChance,
    required this.avgSpawns,
    required this.spawnTime,
    required this.multipliers,
    required this.weaknesses,
    this.nextEvolution,
    this.prevEvolution,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
    id: json["id"],
    num: json["num"],
    name: json["name"],
    img: json["img"],
    type: List<String>.from(json["type"].map((x) => x)),
    height: json["height"],
    weight: json["weight"],
    candy: json["candy"],
    candyCount: json["candy_count"],
    egg: json["egg"],
    spawnChance: json["spawn_chance"]?.toDouble(),
    avgSpawns: json["avg_spawns"]?.toDouble(),
    spawnTime: json["spawn_time"],
    multipliers: json["multipliers"] == null
        ? []
        : List<double>.from(json["multipliers"]!.map((x) => x?.toDouble())),
    weaknesses: List<String>.from(json["weaknesses"].map((x) => x)),
    nextEvolution: json["next_evolution"] == null
        ? []
        : List<Evolution>.from(
            json["next_evolution"]!.map((x) => Evolution.fromJson(x)),
          ),
    prevEvolution: json["prev_evolution"] == null
        ? []
        : List<Evolution>.from(
            json["prev_evolution"]!.map((x) => Evolution.fromJson(x)),
          ),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "num": num,
    "name": name,
    "img": img,
    "type": List<dynamic>.from(type.map((x) => x)),
    "height": height,
    "weight": weight,
    "candy": candy,
    "candy_count": candyCount,
    "egg": egg,
    "spawn_chance": spawnChance,
    "avg_spawns": avgSpawns,
    "spawn_time": spawnTime,
    "multipliers": multipliers == null
        ? []
        : List<dynamic>.from(multipliers!.map((x) => x)),
    "weaknesses": List<dynamic>.from(weaknesses.map((x) => x)),
    "next_evolution": nextEvolution == null
        ? []
        : List<dynamic>.from(nextEvolution!.map((x) => x.toJson())),
    "prev_evolution": prevEvolution == null
        ? []
        : List<dynamic>.from(prevEvolution!.map((x) => x.toJson())),
  };
}

class Evolution {
  String num;
  String name;

  Evolution({required this.num, required this.name});

  factory Evolution.fromJson(Map<String, dynamic> json) =>
      Evolution(num: json["num"], name: json["name"]);

  Map<String, dynamic> toJson() => {"num": num, "name": name};
}
