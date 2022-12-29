import 'package:flutter/material.dart';
import 'package:pokemon_flutter/components/poke_list.dart';
import 'package:pokemon_flutter/components/settings.dart';

class TopPage extends StatefulWidget {
  const TopPage({super.key});

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  int _currentBnbIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: _currentBnbIndex == 0 ? const PokeList() : const Settings()),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => setState(() => _currentBnbIndex = index),
          currentIndex: _currentBnbIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'settings'),
          ]),
    );
  }
}
