// import 'package:flutter/material.dart';
// import 'package:ppkd_b_3/tugas_14flutter/api/get_pokemon.dart';
// import 'package:ppkd_b_3/tugas_14flutter/model/burbasaur_model.dart';

// class DetailPokemon extends StatefulWidget {
//   const DetailPokemon({super.key, required this.url});
//   final String url;

//   @override
//   State<DetailPokemon> createState() => _DetailPokemonState();
// }

// class _DetailPokemonState extends State<DetailPokemon> {
//   BurbasaurDataResponse? data;
//   @override
//   void initState() {
//     loadData();

//     super.initState();
//   }

//   loadData() async {
//     final response = await getDetailPokemon(widget.url);
//     data = response;
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: data == null
//           ? CircularProgressIndicator()
//           : Center(child: Text(data?.name ?? "")),
//     );
//   }
// }
