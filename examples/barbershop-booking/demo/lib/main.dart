import 'package:flutter/material.dart';

import 'booking_flow_screen.dart';
import 'booking_theme.dart';

void main() => runApp(const EditorialBookingApp());

class EditorialBookingApp extends StatelessWidget {
  const EditorialBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'North & Row Booking',
      debugShowCheckedModeBanner: false,
      theme: buildBookingTheme(),
      home: const BookingFlowScreen(),
    );
  }
}
