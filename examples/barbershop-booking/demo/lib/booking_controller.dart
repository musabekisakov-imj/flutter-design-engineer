import 'package:flutter/foundation.dart';

import 'booking_fixtures.dart';
import 'booking_models.dart';

class BookingController extends ChangeNotifier {
  BookingController({this.submitDelay = const Duration(milliseconds: 450)});

  final Duration submitDelay;

  BookingStep step = BookingStep.service;
  BookingService? service;
  Barber? barber;
  BookingDay? day;
  BookingSlot? slot;
  CustomerDetails customer = const CustomerDetails();
  AvailabilityState availabilityState = AvailabilityState.ready;
  BookingFormErrors errors = const BookingFormErrors();
  bool isSubmitting = false;
  int submissionCount = 0;

  bool get canContinue => switch (step) {
    BookingStep.service => service != null,
    BookingStep.barber => barber != null,
    BookingStep.availability => slot != null && slot!.isAvailable,
    BookingStep.review => !isSubmitting,
    BookingStep.confirmation => true,
  };

  void selectService(BookingService value) {
    if (service?.id == value.id) return;
    service = value;
    barber = null;
    day = null;
    slot = null;
    availabilityState = AvailabilityState.ready;
    notifyListeners();
  }

  void selectBarber(Barber value) {
    if (barber?.id == value.id) return;
    barber = value;
    day = null;
    slot = null;
    availabilityState = AvailabilityState.ready;
    notifyListeners();
  }

  void selectDay(BookingDay value) {
    day = value;
    slot = null;
    availabilityState = value.slots.isEmpty
        ? AvailabilityState.empty
        : AvailabilityState.ready;
    notifyListeners();
  }

  void selectSlot(BookingSlot value) {
    if (!value.isAvailable) return;
    slot = value;
    availabilityState = AvailabilityState.ready;
    notifyListeners();
  }

  void showAvailabilityError() {
    availabilityState = AvailabilityState.error;
    notifyListeners();
  }

  void retryAvailability() {
    availabilityState = day?.slots.isEmpty ?? false
        ? AvailabilityState.empty
        : AvailabilityState.ready;
    notifyListeners();
  }

  void invalidateSelectedSlot() {
    if (slot == null) return;
    slot = null;
    availabilityState = AvailabilityState.invalidated;
    notifyListeners();
  }

  void updateCustomer({String? name, String? phone, String? note}) {
    customer = customer.copyWith(name: name, phone: phone, note: note);
  }

  BookingFormErrors validate() {
    final cleanName = customer.name.trim();
    final digits = customer.phone.replaceAll(RegExp(r'\D'), '');
    errors = BookingFormErrors(
      name: cleanName.length < 2 ? 'Enter your full name' : null,
      phone: digits.length < 9 ? 'Enter a valid mobile number' : null,
    );
    notifyListeners();
    return errors;
  }

  void continueForward() {
    if (!canContinue) return;
    step = switch (step) {
      BookingStep.service => BookingStep.barber,
      BookingStep.barber => BookingStep.availability,
      BookingStep.availability => BookingStep.review,
      BookingStep.review => BookingStep.review,
      BookingStep.confirmation => BookingStep.confirmation,
    };
    if (step == BookingStep.availability && day == null) {
      selectDay(bookingDays[2]);
      return;
    }
    notifyListeners();
  }

  void goTo(BookingStep value) {
    step = value;
    notifyListeners();
  }

  void goBack() {
    step = switch (step) {
      BookingStep.service => BookingStep.service,
      BookingStep.barber => BookingStep.service,
      BookingStep.availability => BookingStep.barber,
      BookingStep.review => BookingStep.availability,
      BookingStep.confirmation => BookingStep.confirmation,
    };
    notifyListeners();
  }

  Future<bool> submit() async {
    if (isSubmitting) return false;
    if (validate().hasErrors) return false;
    isSubmitting = true;
    submissionCount += 1;
    notifyListeners();
    await Future<void>.delayed(submitDelay);
    isSubmitting = false;
    step = BookingStep.confirmation;
    notifyListeners();
    return true;
  }
}
