import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pokemon_flutter/models/theme.dart';
import 'package:pokemon_flutter/page/theme_mode_selection.dart';

Map<ThemeMode, String> themeMap = {
  ThemeMode.system: 'System',
  ThemeMode.dark: 'Dark',
  ThemeMode.light: 'Light'
};

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModeNotifier>(
      builder: ((context, notifier, child) => ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.lightbulb),
                title: const Text('Theme Mode'),
                trailing: Text(themeMap[notifier.themeMode] ?? ''),
                onTap: () async {
                  final selectedThemeMode = (await Navigator.of(context)
                      .push<ThemeMode>(MaterialPageRoute(
                          builder: (context) => ThemeModeSelectionPage(
                              themeMode: notifier.themeMode))))!;

                  notifier.update(selectedThemeMode);
                },
              )
            ],
          )),
    );
  }
}
