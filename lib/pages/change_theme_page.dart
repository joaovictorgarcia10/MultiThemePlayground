import 'package:flutter/material.dart';
import 'package:multi_theme_playground/local_theme/local_theme.dart';

class ChangeThemePage extends StatefulWidget {
  const ChangeThemePage({Key? key}) : super(key: key);

  @override
  State<ChangeThemePage> createState() => _ChangeThemePageState();
}

class _ChangeThemePageState extends State<ChangeThemePage> {
  final LocalTheme localTheme = LocalTheme.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Theme Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              title: const Text("Clique para alterar a  Primary Color"),
              onTap: () {
                localTheme.setPrimaryColor(color: Colors.brown);
              },
            ),
            ListTile(
              title: const Text("Clique para alterar a Secondary Color"),
              onTap: () {
                localTheme.setSecondaryColor(color: Colors.pink);
              },
            ),
          ],
        ),
      ),
    );
  }
}
