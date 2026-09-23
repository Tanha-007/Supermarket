import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/booking_model.dart';

// Mock booking service
class BookingService {
  final List<BookingModel> _mockBookings = [];

  Future<List<BookingModel>> getAllBookings() async {
    await Future.delayed(const Duration(seconds: 1));
    return _mockBookings;
  }

  Future<List<BookingModel>> getBookingsByUserId(String userId) async {
    await Future.delayed(const Duration(seconds: 1));
    return _mockBookings.where((booking) => booking.userId == userId).toList();
  }

  Future<BookingModel?> getBookingById(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      return _mockBookings.firstWhere((booking) => booking.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<BookingModel?> createBooking(BookingModel booking) async {
    await Future.delayed(const Duration(seconds: 1));
    _mockBookings.add(booking);
    return booking;
  }

  Future<BookingModel?> updateBooking(BookingModel booking) async {
    await Future.delayed(const Duration(seconds: 1));
    final index = _mockBookings.indexWhere((b) => b.id == booking.id);
    if (index != -1) {
      _mockBookings[index] = booking;
    }
    return booking;
  }

  Future<void> cancelBooking(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    final index = _mockBookings.indexWhere((b) => b.id == id);
    if (index != -1) {
      _mockBookings[index] = _mockBookings[index].copyWith(status: 'cancelled');
    }
  }

  Future<void> deleteBooking(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    _mockBookings.removeWhere((booking) => booking.id == id);
  }
}

// Booking service provider
final bookingServiceProvider = Provider<BookingService>((ref) {
  return BookingService();
});

// Get all bookings provider
final getAllBookingsProvider = FutureProvider<List<BookingModel>>((ref) async {
  final bookingService = ref.watch(bookingServiceProvider);
  return bookingService.getAllBookings();
});

// Get bookings by user id provider
final getBookingsByUserIdProvider = FutureProvider.family<List<BookingModel>, String>((ref, userId) async {
  final bookingService = ref.watch(bookingServiceProvider);
  return bookingService.getBookingsByUserId(userId);
});

// Get booking by id provider
final getBookingByIdProvider = FutureProvider.family<BookingModel?, String>((ref, id) async {
  final bookingService = ref.watch(bookingServiceProvider);
  return bookingService.getBookingById(id);
});

// Create booking provider
final createBookingProvider = FutureProvider.family<BookingModel?, BookingModel>((ref, booking) async {
  final bookingService = ref.watch(bookingServiceProvider);
  return bookingService.createBooking(booking);
});

// Update booking provider
final updateBookingProvider = FutureProvider.family<BookingModel?, BookingModel>((ref, booking) async {
  final bookingService = ref.watch(bookingServiceProvider);
  return bookingService.updateBooking(booking);
});

// Cancel booking provider
final cancelBookingProvider = FutureProvider.family<void, String>((ref, bookingId) async {
  final bookingService = ref.watch(bookingServiceProvider);
  return bookingService.cancelBooking(bookingId);
});
