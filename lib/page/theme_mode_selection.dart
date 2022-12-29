import 'package:flutter/material.dart';

class ThemeModeSelectionPage extends StatefulWidget {
  const ThemeModeSelectionPage({super.key, required this.themeMode});

  final ThemeMode themeMode;

  @override
  State<ThemeModeSelectionPage> createState() => _ThemeModeSelectionPageState();
}

class _ThemeModeSelectionPageState extends State<ThemeModeSelectionPage> {
  late ThemeMode _themeMode;

  List<dynamic> radioList = [
    [ThemeMode.system, 'System'],
    [ThemeMode.dark, 'Dark'],
    [ThemeMode.light, 'Light']
  ];

  @override
  void initState() {
    super.initState();
    _themeMode = widget.themeMode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          ListTile(
            leading: IconButton(
                onPressed: () => Navigator.pop<ThemeMode>(context, _themeMode),
                icon: const Icon(Icons.arrow_back)),
          ),
          ...radioList.map((value) => RadioListTile(
                value: value[0],
                groupValue: _themeMode,
                onChanged: (value) => setState(() => _themeMode = value),
                title: Text(value[1]),
              ))
        ],
      )),
    );
  }
}
