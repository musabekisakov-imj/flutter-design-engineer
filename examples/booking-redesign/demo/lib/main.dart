import 'package:flutter/material.dart';

import 'booking_screen.dart';
import 'theme.dart';

void main() => runApp(const BookingDemoApp());

class BookingDemoApp extends StatelessWidget {
  const BookingDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Design Engineer Demo',
      theme: buildDemoTheme(),
      home: const BookingDemoShell(),
    );
  }
}
