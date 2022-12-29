import 'package:flutter/material.dart';

import 'package:pokemon_flutter/page/theme_mode_selection.dart';
import 'package:pokemon_flutter/utils/theme.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Map<ThemeMode, String> themeMap = {
    ThemeMode.system: 'System',
    ThemeMode.dark: 'Dark',
    ThemeMode.light: 'Light'
  };

  ThemeMode _themeMode = ThemeMode.system;

  @override
  void initState() {
    super.initState();
    loadThemeMode().then((value) => setState(() => _themeMode = value));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.lightbulb),
          title: const Text('Theme Mode'),
          trailing: Text(themeMap[_themeMode] ?? ''),
          onTap: () async {
            final ret = (await Navigator.of(context).push<ThemeMode>(
                MaterialPageRoute(
                    builder: (context) =>
                        ThemeModeSelectionPage(themeMode: _themeMode))))!;

            setState(() => _themeMode = ret);
            await saveThemeMode(_themeMode);
          },
        )
      ],
    );
  }
}
