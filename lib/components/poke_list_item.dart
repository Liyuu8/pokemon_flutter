import 'package:flutter/material.dart';

import 'package:pokemon_flutter/page/poke_detail.dart';

class PokeListItem extends StatelessWidget {
  const PokeListItem({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 80,
        decoration: BoxDecoration(
            color: Colors.yellow.withOpacity(.5),
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
                image: NetworkImage(
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png",
                ),
                fit: BoxFit.fitWidth)),
      ),
      title: const Text(
        'Pikachu',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: const Text('⚡️electric'),
      trailing: const Icon(Icons.navigate_next),
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const PokeDetailPage())),
    );
  }
}
