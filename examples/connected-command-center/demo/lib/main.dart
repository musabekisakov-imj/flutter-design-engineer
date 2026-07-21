import 'package:flutter/material.dart';

import 'command_center_screen.dart';
import 'theme.dart';

void main() => runApp(const CommandCenterDemoApp());

class CommandCenterDemoApp extends StatelessWidget {
  const CommandCenterDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Connected Command Center',
      theme: buildDemoTheme(),
      home: const CommandCenterShell(),
    );
  }
}
