import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'custom_color.g.dart';

@HiveType(typeId: 1)
class CustomColor {
  @HiveField(0)
  String name;

  @HiveField(1)
  int color;

  CustomColor({
    required this.name,
    required this.color,
  });
}
