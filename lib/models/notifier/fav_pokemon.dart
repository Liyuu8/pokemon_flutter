import 'package:flutter/material.dart';

import 'package:pokemon_flutter/models/fav_poke.dart';

class FavPokeNotifier extends ChangeNotifier {
  final List<FavPoke> _favList = [];

  List<FavPoke> get favList => _favList;

  void add(FavPoke fav) {
    favList.add(fav);
    notifyListeners();
  }

  void delete(int id) {
    favList.removeWhere((fav) => fav.pokeId == id);
    notifyListeners();
  }

  void toggle(FavPoke fav) {
    isExist(fav.pokeId) ? delete(fav.pokeId) : add(fav);
  }

  bool isExist(int id) {
    return !(_favList.indexWhere((fav) => fav.pokeId == id) < 0);
  }
}
