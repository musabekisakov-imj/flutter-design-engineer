import 'booking_models.dart';

const bookingServices = <BookingService>[
  BookingService(
    id: 'signature-cut',
    name: 'Signature cut',
    description: 'Consultation, tailored cut, wash and finish.',
    durationMinutes: 45,
    price: 42,
  ),
  BookingService(
    id: 'cut-beard',
    name: 'Cut & beard',
    description: 'Full haircut, beard shape and hot towel.',
    durationMinutes: 70,
    price: 64,
  ),
  BookingService(
    id: 'beard-ritual',
    name: 'Beard ritual',
    description: 'Shape, steam towel and conditioning finish.',
    durationMinutes: 30,
    price: 30,
  ),
];

const barbers = <Barber>[
  Barber(
    id: 'any',
    name: 'Any available barber',
    specialties: 'Choose the earliest suitable opening',
    availabilityHint: 'Best for flexibility',
    portraitAlignment: -1,
  ),
  Barber(
    id: 'idris',
    name: 'Idris Cole',
    specialties: 'Precision fades, textured cuts',
    availabilityHint: 'Next opening 14:30',
    portraitAlignment: -1,
  ),
  Barber(
    id: 'bek',
    name: 'Bek Nur',
    specialties: 'Classic scissor work, styling',
    availabilityHint: 'Next opening 15:15',
    portraitAlignment: 0,
  ),
  Barber(
    id: 'mara',
    name: 'Mara Rossi',
    specialties: 'Long hair, shape and texture',
    availabilityHint: 'Next opening Friday',
    portraitAlignment: 1,
  ),
];

final bookingDays = <BookingDay>[
  BookingDay(
    date: DateTime(2026, 7, 21),
    slots: const [
      BookingSlot(label: '09:30'),
      BookingSlot(label: '10:15'),
      BookingSlot(label: '11:30', isAvailable: false),
      BookingSlot(label: '13:15'),
    ],
  ),
  BookingDay(
    date: DateTime(2026, 7, 22),
    slots: const [
      BookingSlot(label: '10:00'),
      BookingSlot(label: '12:30'),
      BookingSlot(label: '15:45'),
    ],
  ),
  BookingDay(
    date: DateTime(2026, 7, 23),
    slots: const [
      BookingSlot(label: '09:30'),
      BookingSlot(label: '10:15'),
      BookingSlot(label: '11:30', isAvailable: false),
      BookingSlot(label: '13:15'),
      BookingSlot(label: '14:30'),
      BookingSlot(label: '15:15'),
      BookingSlot(label: '16:00', isAvailable: false),
    ],
  ),
  BookingDay(date: DateTime(2026, 7, 24), slots: const []),
  BookingDay(
    date: DateTime(2026, 7, 25),
    slots: const [
      BookingSlot(label: '09:15'),
      BookingSlot(label: '10:45'),
      BookingSlot(label: '12:15'),
      BookingSlot(label: '14:00'),
      BookingSlot(label: '15:30'),
      BookingSlot(label: '17:00'),
    ],
  ),
];
