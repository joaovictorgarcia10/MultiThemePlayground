import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 200,
              color: Theme.of(context).colorScheme.primary,
              child: const Center(
                child: Text("Primary Color"),
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              height: 100,
              width: 200,
              color: Theme.of(context).colorScheme.secondary,
              child: const Center(
                child: Text("Secondary Color"),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, "/change_theme"),
        child: const Icon(Icons.format_paint_outlined),
      ),
    );
  }
}
