import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/service_model.dart';

// Mock service service
class ServiceService {
  final List<ServiceModel> _mockServices = [
    ServiceModel(
      id: '1',
      providerId: 'provider1',
      providerName: 'Cleaning Experts',
      providerPhone: '01741111111',
      title: 'Professional House Cleaning',
      description: 'Deep cleaning service for your home',
      category: 'cleaning',
      image: 'https://via.placeholder.com/400x300?text=Cleaning+Service',
      price: 5000,
      priceType: 'fixed',
      rating: 4.7,
      reviewCount: 50,
      isAvailable: true,
      skills: ['Deep Cleaning', 'Sanitization', 'Carpet Cleaning'],
      city: 'Dhaka',
      createdAt: DateTime.now().subtract(const Duration(days: 60)),
    ),
    ServiceModel(
      id: '2',
      providerId: 'provider2',
      providerName: 'Quick Repairs',
      providerPhone: '01752222222',
      title: 'Electrical & Plumbing Repair',
      description: 'Fast and reliable repair services',
      category: 'repair',
      image: 'https://via.placeholder.com/400x300?text=Repair+Service',
      price: 500,
      priceType: 'hourly',
      rating: 4.5,
      reviewCount: 30,
      isAvailable: true,
      skills: ['Electrical', 'Plumbing', 'General Repair'],
      city: 'Dhaka',
      createdAt: DateTime.now().subtract(const Duration(days: 45)),
    ),
    ServiceModel(
      id: '3',
      providerId: 'provider3',
      providerName: 'Moving Experts',
      providerPhone: '01763333333',
      title: 'House Moving & Transportation',
      description: 'Professional moving service with care',
      category: 'moving',
      image: 'https://via.placeholder.com/400x300?text=Moving+Service',
      price: 15000,
      priceType: 'fixed',
      rating: 4.6,
      reviewCount: 20,
      isAvailable: true,
      skills: ['Packing', 'Loading', 'Transportation'],
      city: 'Dhaka',
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
    ),
  ];

  Future<List<ServiceModel>> getAllServices() async {
    await Future.delayed(const Duration(seconds: 1));
    return _mockServices;
  }

  Future<ServiceModel?> getServiceById(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      return _mockServices.firstWhere((service) => service.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<List<ServiceModel>> searchServices({
    required String query,
    required String city,
    String? category,
    double? minPrice,
    double? maxPrice,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return _mockServices
        .where((service) =>
            (service.title.toLowerCase().contains(query.toLowerCase()) ||
                service.description.toLowerCase().contains(query.toLowerCase())) &&
            service.city == city &&
            (category == null || service.category == category) &&
            (minPrice == null || service.price >= minPrice) &&
            (maxPrice == null || service.price <= maxPrice))
        .toList();
  }

  Future<ServiceModel?> createService(ServiceModel service) async {
    await Future.delayed(const Duration(seconds: 1));
    return service;
  }

  Future<ServiceModel?> updateService(ServiceModel service) async {
    await Future.delayed(const Duration(seconds: 1));
    return service;
  }

  Future<void> deleteService(String id) async {
    await Future.delayed(const Duration(seconds: 1));
  }
}

// Service service provider
final serviceServiceProvider = Provider<ServiceService>((ref) {
  return ServiceService();
});

// Get all services provider
final getAllServicesProvider = FutureProvider<List<ServiceModel>>((ref) async {
  final serviceService = ref.watch(serviceServiceProvider);
  return serviceService.getAllServices();
});

// Get service by id provider
final getServiceByIdProvider = FutureProvider.family<ServiceModel?, String>((ref, id) async {
  final serviceService = ref.watch(serviceServiceProvider);
  return serviceService.getServiceById(id);
});

// Search services provider
final searchServicesProvider = FutureProvider.family<
    List<ServiceModel>,
    ({
      String query,
      String city,
      String? category,
      double? minPrice,
      double? maxPrice,
    })>((ref, params) async {
  final serviceService = ref.watch(serviceServiceProvider);
  return serviceService.searchServices(
    query: params.query,
    city: params.city,
    category: params.category,
    minPrice: params.minPrice,
    maxPrice: params.maxPrice,
  );
});

// Create service provider
final createServiceProvider = FutureProvider.family<ServiceModel?, ServiceModel>((ref, service) async {
  final serviceService = ref.watch(serviceServiceProvider);
  return serviceService.createService(service);
});

// Update service provider
final updateServiceProvider = FutureProvider.family<ServiceModel?, ServiceModel>((ref, service) async {
  final serviceService = ref.watch(serviceServiceProvider);
  return serviceService.updateService(service);
});
