import 'package:flutter/material.dart';
import 'package:multi_theme_playground/local_theme/models/custom_color.dart';

class SelectColorPage extends StatefulWidget {
  final Function(CustomColor? color) onSelectColor;

  const SelectColorPage({
    Key? key,
    required this.onSelectColor,
  }) : super(key: key);

  @override
  State<SelectColorPage> createState() => _SelectColorPageState();
}

class _SelectColorPageState extends State<SelectColorPage> {
  final List<CustomColor> colors = [
    CustomColor(name: "purple", color: 0xFF9C27B0),
    CustomColor(name: "orange", color: 0xFFFF9800),
    CustomColor(name: "yellow", color: 0xFFFFEB3B),
    CustomColor(name: "red", color: 0xFFF44336),
    CustomColor(name: "brown", color: 0xFF795548),
    CustomColor(name: "grey", color: 0xFF9E9E9E),
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
            title: Text(color.name),
            leading: CircleAvatar(backgroundColor: Color(color.color)),
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
