import 'package:flutter/material.dart';

import 'package:pokemon_flutter/api/pokeapi.dart';
import '../pokemon.dart';

class PokemonNotifier extends ChangeNotifier {
  final Map<int, Pokemon?> _pokeMap = {};

  Map<int, Pokemon?> get pokes => _pokeMap;

  void addPoke(Pokemon pokemon) {
    _pokeMap[pokemon.id] = pokemon;
    notifyListeners();
  }

  void fetchPoke(int id) async {
    _pokeMap[id] = null;
    addPoke(await fetchPokemon(id));
  }

  Pokemon? byId(int id) {
    if (!_pokeMap.containsKey(id)) fetchPoke(id);

    return _pokeMap[id];
  }
}
