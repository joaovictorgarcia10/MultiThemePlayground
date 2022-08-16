import 'package:flutter/material.dart';

abstract class GlobalColors {
  Color get primary;
  Color get secondary;
}

class StandardColors implements GlobalColors {
  @override
  Color get primary => const Color(0xFFA20F05);

  @override
  Color get secondary => const Color.fromARGB(255, 9, 9, 9);
}

class OtherColors implements GlobalColors {
  @override
  Color get primary => const Color.fromARGB(255, 4, 134, 17);

  @override
  Color get secondary => const Color(0xFF0D0D0D);
}
