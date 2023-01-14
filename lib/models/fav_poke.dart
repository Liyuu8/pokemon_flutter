class FavPoke {
  final int pokeId;

  FavPoke({required this.pokeId});

  Map<String, dynamic> toMap() {
    return {'id': pokeId};
  }
}
