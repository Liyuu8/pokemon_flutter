import 'package:flutter/material.dart';

import 'package:pokemon_flutter/components/poke_list_item.dart';

class PokeList extends StatelessWidget {
  const PokeList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => PokeListItem(index: index),
      itemCount: 10000,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
    );
  }
}
