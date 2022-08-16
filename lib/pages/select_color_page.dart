import 'package:flutter/material.dart';

class SelectColorPage extends StatefulWidget {
  final Function(Color? color) onSelectColor;

  const SelectColorPage({
    Key? key,
    required this.onSelectColor,
  }) : super(key: key);

  @override
  State<SelectColorPage> createState() => _SelectColorPageState();
}

class _SelectColorPageState extends State<SelectColorPage> {
  final List<Color> colors = [
    Colors.purple,
    Colors.orange,
    Colors.yellow,
    Colors.red,
    Colors.brown,
    Colors.grey,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Color'),
      ),
      body: ListView.separated(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final color = colors[index];

          return ListTile(
            title: Text(color.hashCode.toString()),
            leading: CircleAvatar(backgroundColor: color),
            trailing: IconButton(
              onPressed: () {
                widget.onSelectColor(color);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}
