import 'package:flutter/material.dart';
import 'package:multi_theme_playground/local_theme/local_theme.dart';
import 'package:multi_theme_playground/pages/change_theme/select_color_page.dart';

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
              title: const Text("Alterar cor primária"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SelectColorPage(
                      onSelectColor: (color) =>
                          localTheme.setPrimaryColor(color: color),
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Alterar cor secundária"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SelectColorPage(
                      onSelectColor: (color) =>
                          localTheme.setSecondaryColor(color: color),
                    ),
                  ),
                );
              },
            ),
            SwitchListTile(
              title: const Text("Tema escuro"),
              value: localTheme.brightnessBox.get(
                "isDarkMode",
                defaultValue: false,
              )!,
              onChanged: (value) {
                localTheme.setDarkMode(value);
                setState(() {});
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          localTheme.disposeLocalTheme();
          setState(() {});
        },
        label: const Text("Resetar configurações de tema local"),
        icon: const Icon(Icons.dangerous_outlined),
      ),
    );
  }
}
