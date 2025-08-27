// Fungsi helper untuk warna berdasarkan tipe
import 'package:flutter/material.dart';

Color getTypeColor(String type) {
  switch (type.toLowerCase()) {
    case 'fire':
      return Colors.redAccent;
    case 'water':
      return Colors.blueAccent;
    case 'grass':
      return Colors.green;
    case 'electric':
      return Colors.yellow.shade700;
    case 'psychic':
      return Colors.purpleAccent;
    case 'ice':
      return Colors.cyanAccent;
    case 'dragon':
      return Colors.indigo;
    case 'dark':
      return Colors.black54;
    case 'fairy':
      return Colors.pinkAccent;
    case 'normal':
      return Colors.grey;
    case 'fighting':
      return Colors.brown;
    case 'flying':
      return Colors.lightBlueAccent;
    case 'poison':
      return Colors.deepPurple;
    case 'ground':
      return Colors.brown.shade300;
    case 'rock':
      return Colors.grey.shade700;
    case 'bug':
      return Colors.lightGreen;
    case 'ghost':
      return Colors.deepPurpleAccent;
    case 'steel':
      return Colors.blueGrey;
    default:
      return Colors.grey; // default color jika tipe tidak dikenal
  }
}
