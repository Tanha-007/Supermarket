import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/tuition_model.dart';

// Mock tuition service
class TuitionService {
  final List<TuitionModel> _mockTuitions = [
    TuitionModel(
      id: '1',
      tutorId: 'tutor1',
      tutorName: 'Dr. Karim',
      tutorPhone: '01781111111',
      subject: 'Mathematics',
      level: 'hsc',
      description: 'Expert mathematics tuition for HSC students',
      image: 'https://via.placeholder.com/400x300?text=Math+Tutor',
      price: 800,
      priceType: 'hourly',
      rating: 4.8,
      reviewCount: 45,
      isAvailable: true,
      qualifications: ['M.Sc Mathematics', 'B.Ed'],
      city: 'Dhaka',
      experience: '15 years',
      createdAt: DateTime.now().subtract(const Duration(days: 90)),
    ),
    TuitionModel(
      id: '2',
      tutorId: 'tutor2',
      tutorName: 'Aisha Islam',
      tutorPhone: '01792222222',
      subject: 'English',
      level: 'secondary',
      description: 'English language and literature tutoring',
      image: 'https://via.placeholder.com/400x300?text=English+Tutor',
      price: 600,
      priceType: 'hourly',
      rating: 4.6,
      reviewCount: 30,
      isAvailable: true,
      qualifications: ['M.A English', 'DELTA'],
      city: 'Dhaka',
      experience: '10 years',
      createdAt: DateTime.now().subtract(const Duration(days: 70)),
    ),
    TuitionModel(
      id: '3',
      tutorId: 'tutor3',
      tutorName: 'Mr. Rahman',
      tutorPhone: '01803333333',
      subject: 'Physics',
      level: 'hsc',
      description: 'Physics tuition with practical experiments',
      image: 'https://via.placeholder.com/400x300?text=Physics+Tutor',
      price: 900,
      priceType: 'hourly',
      rating: 4.7,
      reviewCount: 50,
      isAvailable: true,
      qualifications: ['M.Sc Physics', 'B.Ed'],
      city: 'Dhaka',
      experience: '12 years',
      createdAt: DateTime.now().subtract(const Duration(days: 50)),
    ),
  ];

  Future<List<TuitionModel>> getAllTuitions() async {
    await Future.delayed(const Duration(seconds: 1));
    return _mockTuitions;
  }

  Future<TuitionModel?> getTuitionById(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      return _mockTuitions.firstWhere((tuition) => tuition.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<List<TuitionModel>> searchTuitions({
    required String query,
    required String city,
    String? subject,
    String? level,
    double? minPrice,
    double? maxPrice,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return _mockTuitions
        .where((tuition) =>
            (tuition.tutorName.toLowerCase().contains(query.toLowerCase()) ||
                tuition.subject.toLowerCase().contains(query.toLowerCase())) &&
            tuition.city == city &&
            (subject == null || tuition.subject == subject) &&
            (level == null || tuition.level == level) &&
            (minPrice == null || tuition.price >= minPrice) &&
            (maxPrice == null || tuition.price <= maxPrice))
        .toList();
  }

  Future<TuitionModel?> createTuition(TuitionModel tuition) async {
    await Future.delayed(const Duration(seconds: 1));
    return tuition;
  }

  Future<TuitionModel?> updateTuition(TuitionModel tuition) async {
    await Future.delayed(const Duration(seconds: 1));
    return tuition;
  }

  Future<void> deleteTuition(String id) async {
    await Future.delayed(const Duration(seconds: 1));
  }
}

// Tuition service provider
final tuitionServiceProvider = Provider<TuitionService>((ref) {
  return TuitionService();
});

// Get all tuitions provider
final getAllTuitionsProvider = FutureProvider<List<TuitionModel>>((ref) async {
  final tuitionService = ref.watch(tuitionServiceProvider);
  return tuitionService.getAllTuitions();
});

// Get tuition by id provider
final getTuitionByIdProvider = FutureProvider.family<TuitionModel?, String>((ref, id) async {
  final tuitionService = ref.watch(tuitionServiceProvider);
  return tuitionService.getTuitionById(id);
});

// Search tuitions provider
final searchTuitionsProvider = FutureProvider.family<
    List<TuitionModel>,
    ({
      String query,
      String city,
      String? subject,
      String? level,
      double? minPrice,
      double? maxPrice,
    })>((ref, params) async {
  final tuitionService = ref.watch(tuitionServiceProvider);
  return tuitionService.searchTuitions(
    query: params.query,
    city: params.city,
    subject: params.subject,
    level: params.level,
    minPrice: params.minPrice,
    maxPrice: params.maxPrice,
  );
});

// Create tuition provider
final createTuitionProvider = FutureProvider.family<TuitionModel?, TuitionModel>((ref, tuition) async {
  final tuitionService = ref.watch(tuitionServiceProvider);
  return tuitionService.createTuition(tuition);
});

// Update tuition provider
final updateTuitionProvider = FutureProvider.family<TuitionModel?, TuitionModel>((ref, tuition) async {
  final tuitionService = ref.watch(tuitionServiceProvider);
  return tuitionService.updateTuition(tuition);
});
