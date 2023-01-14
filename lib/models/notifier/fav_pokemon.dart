import 'package:flutter/material.dart';

import 'package:pokemon_flutter/db/favorites.dart';
import 'package:pokemon_flutter/models/fav_poke.dart';

class FavPokeNotifier extends ChangeNotifier {
  final List<FavPoke> _favList = [];

  FavPokeNotifier() {
    syncDB();
  }

  List<FavPoke> get favList => _favList;

  void syncDB() async {
    FavoritesDB.read().then(
      (value) => _favList
        ..clear()
        ..addAll(value),
    );
    notifyListeners();
  }

  void add(FavPoke fav) async {
    await FavoritesDB.create(fav);
    syncDB();
  }

  void delete(int id) async {
    await FavoritesDB.delete(id);
    syncDB();
  }

  void toggle(FavPoke fav) {
    isExist(fav.pokeId) ? delete(fav.pokeId) : add(fav);
  }

  bool isExist(int id) {
    return _favList.indexWhere((fav) => fav.pokeId == id) >= 0;
  }
}
