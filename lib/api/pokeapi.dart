import 'dart:convert';
import 'package:http/http.dart' as http;

import '../consts/pokeapi.dart';
import '../models/pokemon.dart';

Future<Pokemon> fetchPokemon(int id) async {
  final res = await http.get(Uri.parse('$pokeApiRoute/pokemon/$id'));

  return res.statusCode == 200
      ? Pokemon.fromJson(jsonDecode(res.body))
      : throw Exception('Failed to Load Data');
}
