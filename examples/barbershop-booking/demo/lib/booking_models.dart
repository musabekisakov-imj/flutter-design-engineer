import 'package:flutter/foundation.dart';

@immutable
class BookingService {
  const BookingService({
    required this.id,
    required this.name,
    required this.description,
    required this.durationMinutes,
    required this.price,
  });

  final String id;
  final String name;
  final String description;
  final int durationMinutes;
  final int price;
}

@immutable
class Barber {
  const Barber({
    required this.id,
    required this.name,
    required this.specialties,
    required this.availabilityHint,
    required this.portraitAlignment,
  });

  final String id;
  final String name;
  final String specialties;
  final String availabilityHint;
  final double portraitAlignment;
}

@immutable
class BookingDay {
  const BookingDay({required this.date, required this.slots});

  final DateTime date;
  final List<BookingSlot> slots;
}

@immutable
class BookingSlot {
  const BookingSlot({required this.label, this.isAvailable = true});

  final String label;
  final bool isAvailable;
}

@immutable
class CustomerDetails {
  const CustomerDetails({this.name = '', this.phone = '', this.note = ''});

  final String name;
  final String phone;
  final String note;

  CustomerDetails copyWith({String? name, String? phone, String? note}) {
    return CustomerDetails(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      note: note ?? this.note,
    );
  }
}

enum BookingStep { service, barber, availability, review, confirmation }

enum AvailabilityState { ready, loading, empty, error, invalidated }

@immutable
class BookingFormErrors {
  const BookingFormErrors({this.name, this.phone});

  final String? name;
  final String? phone;

  bool get hasErrors => name != null || phone != null;
}
