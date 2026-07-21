import 'package:editorial_booking/booking_controller.dart';
import 'package:editorial_booking/booking_fixtures.dart';
import 'package:editorial_booking/booking_models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('upstream changes clear only dependent booking choices', () {
    final controller = BookingController();
    controller.selectService(bookingServices.first);
    controller.selectBarber(barbers[1]);
    controller.selectDay(bookingDays[2]);
    controller.selectSlot(bookingDays[2].slots[4]);
    controller.updateCustomer(name: 'Alex Morgan', phone: '+31 6 1234 5678');

    controller.selectService(bookingServices[1]);

    expect(controller.service, bookingServices[1]);
    expect(controller.barber, isNull);
    expect(controller.day, isNull);
    expect(controller.slot, isNull);
    expect(controller.customer.name, 'Alex Morgan');
  });

  test('availability failure preserves upstream selection and can retry', () {
    final controller = BookingController();
    controller.selectService(bookingServices.first);
    controller.selectBarber(barbers[1]);
    controller.selectDay(bookingDays[2]);

    controller.showAvailabilityError();
    expect(controller.availabilityState, AvailabilityState.error);
    expect(controller.service, isNotNull);
    expect(controller.barber, isNotNull);

    controller.retryAvailability();
    expect(controller.availabilityState, AvailabilityState.ready);
  });

  test('invalidated slot is cleared and explanation state is retained', () {
    final controller = BookingController();
    controller.selectDay(bookingDays[2]);
    controller.selectSlot(bookingDays[2].slots[4]);

    controller.invalidateSelectedSlot();

    expect(controller.slot, isNull);
    expect(controller.availabilityState, AvailabilityState.invalidated);
  });

  test('validation is useful and duplicate submit is prevented', () async {
    final controller = BookingController(submitDelay: Duration.zero);
    controller.updateCustomer(name: 'A', phone: '123');
    expect(controller.validate().hasErrors, isTrue);

    controller.updateCustomer(name: 'Alex Morgan', phone: '+31 6 1234 5678');
    final first = controller.submit();
    final duplicate = await controller.submit();

    expect(duplicate, isFalse);
    expect(await first, isTrue);
    expect(controller.submissionCount, 1);
    expect(controller.step, BookingStep.confirmation);
  });
}
