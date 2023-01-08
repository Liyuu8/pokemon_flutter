import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pokemon_flutter/consts/pokeapi.dart';
import 'package:pokemon_flutter/models/fav_poke.dart';
import 'package:pokemon_flutter/models/notifier/fav_pokemon.dart';
import '../models/pokemon.dart';

class PokeDetailPage extends StatelessWidget {
  const PokeDetailPage({super.key, required this.poke});
  final Pokemon poke;

  @override
  Widget build(BuildContext context) {
    return Consumer<FavPokeNotifier>(
      builder: (context, notifier, child) => Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                trailing: IconButton(
                  onPressed: () => notifier.toggle(FavPoke(pokeId: poke.id)),
                  icon: notifier.isExist(poke.id)
                      ? const Icon(Icons.star, color: Colors.orangeAccent)
                      : const Icon(Icons.star_outline),
                ),
              ),
              const Spacer(),
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(32),
                    child:
                        Image.network(poke.imageUrl, height: 100, width: 100),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'No.${poke.id}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Text(
                poke.name,
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: poke.types
                    .map(
                      (type) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Chip(
                          label: Text(
                            type,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ((pokeTypeColors[type] ?? Colors.grey)
                                          .computeLuminance() >
                                      0.5)
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                          backgroundColor: pokeTypeColors[type] ?? Colors.grey,
                        ),
                      ),
                    )
                    .toList(),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
