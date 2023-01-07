import 'package:flutter/material.dart';

import 'package:pokemon_flutter/consts/pokeapi.dart';
import 'package:pokemon_flutter/models/pokemon.dart';
import 'package:pokemon_flutter/page/poke_detail.dart';

class PokeListItem extends StatelessWidget {
  const PokeListItem({super.key, required this.poke});
  final Pokemon? poke;

  @override
  Widget build(BuildContext context) {
    return poke != null
        ? ListTile(
            leading: Container(
              width: 80,
              decoration: BoxDecoration(
                color: (pokeTypeColors[poke!.types.first] ?? Colors.grey[100])
                    ?.withOpacity(.3),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(poke!.imageUrl),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            title: Text(
              poke!.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(poke!.types.first),
            trailing: const Icon(Icons.navigate_next),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => PokeDetailPage(poke: poke!),
              ),
            ),
          )
        : const ListTile(title: Text('...'));
  }
}
