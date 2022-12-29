import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import 'package:pokemon_flutter/models/theme.dart';
import 'package:pokemon_flutter/page/top.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();

  runApp(ChangeNotifierProvider(
    create: (_) => ThemeModeNotifier(pref),
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
            ));
  }
}
