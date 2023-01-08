import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import 'package:pokemon_flutter/models/notifier/fav_pokemon.dart';
import 'package:pokemon_flutter/models/notifier/pokemon.dart';
import 'package:pokemon_flutter/models/notifier/theme.dart';
import 'package:pokemon_flutter/page/top.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeModeNotifier(pref)),
      ChangeNotifierProvider(create: (_) => PokemonNotifier()),
      ChangeNotifierProvider(create: (_) => FavPokeNotifier()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModeNotifier>(
      builder: (context, notifier, child) => MaterialApp(
        title: 'Pokemon Flutter',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: notifier.themeMode,
        home: const TopPage(),
      ),
    );
  }
}
