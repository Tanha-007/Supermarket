import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/review_model.dart';
import '../models/emergency_contact_model.dart';

// Mock review service
class ReviewService {
  final List<ReviewModel> _mockReviews = [];

  Future<List<ReviewModel>> getReviewsByItemId(String itemId) async {
    await Future.delayed(const Duration(seconds: 1));
    return _mockReviews.where((review) => review.itemId == itemId).toList();
  }

  Future<ReviewModel?> createReview(ReviewModel review) async {
    await Future.delayed(const Duration(seconds: 1));
    _mockReviews.add(review);
    return review;
  }

  Future<ReviewModel?> updateReview(ReviewModel review) async {
    await Future.delayed(const Duration(seconds: 1));
    final index = _mockReviews.indexWhere((r) => r.id == review.id);
    if (index != -1) {
      _mockReviews[index] = review;
    }
    return review;
  }

  Future<void> deleteReview(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    _mockReviews.removeWhere((review) => review.id == id);
  }
}

// Mock emergency contact service
class EmergencyContactService {
  final List<EmergencyContactModel> _mockContacts = [];

  Future<List<EmergencyContactModel>> getContactsByUserId(String userId) async {
    await Future.delayed(const Duration(seconds: 1));
    return _mockContacts.where((contact) => contact.userId == userId).toList();
  }

  Future<EmergencyContactModel?> createContact(EmergencyContactModel contact) async {
    await Future.delayed(const Duration(seconds: 1));
    _mockContacts.add(contact);
    return contact;
  }

  Future<EmergencyContactModel?> updateContact(EmergencyContactModel contact) async {
    await Future.delayed(const Duration(seconds: 1));
    final index = _mockContacts.indexWhere((c) => c.id == contact.id);
    if (index != -1) {
      _mockContacts[index] = contact;
    }
    return contact;
  }

  Future<void> deleteContact(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    _mockContacts.removeWhere((contact) => contact.id == id);
  }
}

// Review service provider
final reviewServiceProvider = Provider<ReviewService>((ref) {
  return ReviewService();
});

// Emergency contact service provider
final emergencyContactServiceProvider = Provider<EmergencyContactService>((ref) {
  return EmergencyContactService();
});

// Get reviews by item id provider
final getReviewsByItemIdProvider = FutureProvider.family<List<ReviewModel>, String>((ref, itemId) async {
  final reviewService = ref.watch(reviewServiceProvider);
  return reviewService.getReviewsByItemId(itemId);
});

// Create review provider
final createReviewProvider = FutureProvider.family<ReviewModel?, ReviewModel>((ref, review) async {
  final reviewService = ref.watch(reviewServiceProvider);
  return reviewService.createReview(review);
});

// Update review provider
final updateReviewProvider = FutureProvider.family<ReviewModel?, ReviewModel>((ref, review) async {
  final reviewService = ref.watch(reviewServiceProvider);
  return reviewService.updateReview(review);
});

// Delete review provider
final deleteReviewProvider = FutureProvider.family<void, String>((ref, reviewId) async {
  final reviewService = ref.watch(reviewServiceProvider);
  return reviewService.deleteReview(reviewId);
});

// Get emergency contacts provider
final getEmergencyContactsProvider = FutureProvider.family<List<EmergencyContactModel>, String>((ref, userId) async {
  final contactService = ref.watch(emergencyContactServiceProvider);
  return contactService.getContactsByUserId(userId);
});

// Create emergency contact provider
final createEmergencyContactProvider = FutureProvider.family<EmergencyContactModel?, EmergencyContactModel>((ref, contact) async {
  final contactService = ref.watch(emergencyContactServiceProvider);
  return contactService.createContact(contact);
});

// Update emergency contact provider
final updateEmergencyContactProvider = FutureProvider.family<EmergencyContactModel?, EmergencyContactModel>((ref, contact) async {
  final contactService = ref.watch(emergencyContactServiceProvider);
  return contactService.updateContact(contact);
});

// Delete emergency contact provider
final deleteEmergencyContactProvider = FutureProvider.family<void, String>((ref, contactId) async {
  final contactService = ref.watch(emergencyContactServiceProvider);
  return contactService.deleteContact(contactId);
});
