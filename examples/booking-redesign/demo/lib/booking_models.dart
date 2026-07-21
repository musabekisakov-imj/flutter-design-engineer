class ServiceOption {
  const ServiceOption(this.name, this.duration, this.price);

  final String name;
  final String duration;
  final String price;
}

class BarberOption {
  const BarberOption(this.initials, this.name, this.detail);

  final String initials;
  final String name;
  final String detail;
}

const services = <ServiceOption>[
  ServiceOption('Classic haircut', '30 min', r'$35'),
  ServiceOption('Beard trim', '20 min', r'$20'),
  ServiceOption('Haircut & beard', '45 min', r'$50'),
];

const barbers = <BarberOption>[
  BarberOption('EC', 'Ethan Cole', '10+ years · 5.0'),
  BarberOption('MR', 'Marcus Reed', '7+ years · 4.9'),
  BarberOption('NB', 'Noah Bennett', '5+ years · 4.8'),
];

const times = <String>[
  '9:00 AM',
  '9:30 AM',
  '10:00 AM',
  '10:30 AM',
  '11:00 AM',
  '11:30 AM',
  '12:00 PM',
  '12:30 PM',
  '1:00 PM',
  '1:30 PM',
  '2:00 PM',
  '2:30 PM',
];
