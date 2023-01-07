import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pokemon_flutter/consts/pokeapi.dart';
import 'package:pokemon_flutter/components/poke_list_item.dart';
import 'package:pokemon_flutter/models/notifier/pokemon.dart';

class PokeList extends StatefulWidget {
  const PokeList({super.key});

  @override
  State<PokeList> createState() => _PokeListState();
}

class _PokeListState extends State<PokeList> {
  static const int more = 30;
  int pokeCount = more;

  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonNotifier>(
      builder: (context, notifier, child) => ListView.builder(
        itemBuilder: (context, index) => index != pokeCount
            ? PokeListItem(poke: notifier.byId(index + 1))
            : OutlinedButton(
                onPressed: (() => setState(() {
                      pokeCount += more;
                      if (pokeCount > pokeMaxId) pokeCount = pokeMaxId;
                    })),
                child: const Text('more'),
              ),
        itemCount: pokeCount + 1,
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      ),
    );
  }
}
