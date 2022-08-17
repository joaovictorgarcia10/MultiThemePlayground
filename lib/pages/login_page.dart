import 'package:flutter/material.dart';
import 'package:multi_theme_playground/local_theme/local_theme.dart';
import 'package:multi_theme_playground/local_theme/models/custom_color.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LocalTheme localTheme = LocalTheme.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("LOGIN STANDARD"),
              onPressed: () {
                Navigator.pushNamed(context, "/home");
              },
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              child: const Text("LOGIN COM PARCEIRO 1"),
              onPressed: () async {
                // Seta as cores do tema do parceiro
                await localTheme.setPrimaryColor(
                    color: CustomColor(
                        name: "Cor Primária Parceiro", color: 0xFFA63EF0));

                await localTheme.setSecondaryColor(
                    color: CustomColor(
                        name: "Cor Secundária Parceiro", color: 0xFFA63EF0));

                // ignore: use_build_context_synchronously
                Navigator.pushNamed(context, "/home");
              },
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              child: const Text("LOGIN COM PARCEIRO 2"),
              onPressed: () async {
                // Seta as cores do tema do parceiro 2
                await localTheme.setPrimaryColor(
                    color: CustomColor(
                        name: "Cor Primária Parceiro", color: 0xFF3EF080));

                await localTheme.setSecondaryColor(
                    color: CustomColor(
                        name: "Cor Secundária Parceiro", color: 0xFF3EF080));

                // ignore: use_build_context_synchronously
                Navigator.pushNamed(context, "/home");
              },
            ),
          ],
        ),
      ),
    );
  }
}
