import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/house_model.dart';

// Mock house service
class HouseService {
  final List<HouseModel> _mockHouses = [
    HouseModel(
      id: '1',
      ownerId: 'owner1',
      ownerName: 'Ahmed Ali',
      ownerPhone: '01711111111',
      title: 'Beautiful 2-bedroom House',
      description: 'A modern house with all amenities in the heart of Dhaka',
      address: '123 Main Road, Gulshan',
      city: 'Dhaka',
      latitude: 23.8110,
      longitude: 90.4229,
      price: 15000,
      bedrooms: 2,
      bathrooms: 2,
      floorNumber: 3,
      images: [
        'https://via.placeholder.com/400x300?text=House+1',
        'https://via.placeholder.com/400x300?text=House+1+Interior',
      ],
      amenities: ['WiFi', 'Parking', 'Garden', 'Gym'],
      isPetFriendly: true,
      hasWifi: true,
      hasParking: true,
      rating: 4.5,
      reviewCount: 25,
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
      isAvailable: true,
    ),
    HouseModel(
      id: '2',
      ownerId: 'owner2',
      ownerName: 'Fatima Khan',
      ownerPhone: '01722222222',
      title: 'Spacious 3-bedroom Villa',
      description: 'Luxury villa with modern facilities and security',
      address: '456 Park Avenue, Banani',
      city: 'Dhaka',
      latitude: 23.8210,
      longitude: 90.4129,
      price: 25000,
      bedrooms: 3,
      bathrooms: 3,
      floorNumber: 2,
      images: [
        'https://via.placeholder.com/400x300?text=House+2',
        'https://via.placeholder.com/400x300?text=House+2+Pool',
      ],
      amenities: ['WiFi', 'Parking', 'Pool', 'Security Guard'],
      isPetFriendly: false,
      hasWifi: true,
      hasParking: true,
      rating: 4.8,
      reviewCount: 40,
      createdAt: DateTime.now().subtract(const Duration(days: 20)),
      isAvailable: true,
    ),
    HouseModel(
      id: '3',
      ownerId: 'owner3',
      ownerName: 'Mohammad Hasan',
      ownerPhone: '01733333333',
      title: 'Cozy 1-bedroom Apartment',
      description: 'Perfect for students, close to universities',
      address: '789 Student Street, Farmgate',
      city: 'Dhaka',
      latitude: 23.7630,
      longitude: 90.3948,
      price: 8000,
      bedrooms: 1,
      bathrooms: 1,
      floorNumber: 4,
      images: [
        'https://via.placeholder.com/400x300?text=House+3',
      ],
      amenities: ['WiFi', 'Common Area'],
      isPetFriendly: true,
      hasWifi: true,
      hasParking: false,
      rating: 4.2,
      reviewCount: 15,
      createdAt: DateTime.now().subtract(const Duration(days: 10)),
      isAvailable: true,
    ),
  ];

  Future<List<HouseModel>> getAllHouses() async {
    await Future.delayed(const Duration(seconds: 1));
    return _mockHouses;
  }

  Future<HouseModel?> getHouseById(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      return _mockHouses.firstWhere((house) => house.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<List<HouseModel>> searchHouses({
    required String query,
    required String city,
    double? minPrice,
    double? maxPrice,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return _mockHouses
        .where((house) =>
            (house.title.toLowerCase().contains(query.toLowerCase()) ||
                house.description.toLowerCase().contains(query.toLowerCase())) &&
            house.city == city &&
            (minPrice == null || house.price >= minPrice) &&
            (maxPrice == null || house.price <= maxPrice))
        .toList();
  }

  Future<HouseModel?> createHouse(HouseModel house) async {
    await Future.delayed(const Duration(seconds: 1));
    return house;
  }

  Future<HouseModel?> updateHouse(HouseModel house) async {
    await Future.delayed(const Duration(seconds: 1));
    return house;
  }

  Future<void> deleteHouse(String id) async {
    await Future.delayed(const Duration(seconds: 1));
  }
}

// House service provider
final houseServiceProvider = Provider<HouseService>((ref) {
  return HouseService();
});

// Get all houses provider
final getAllHousesProvider = FutureProvider<List<HouseModel>>((ref) async {
  final houseService = ref.watch(houseServiceProvider);
  return houseService.getAllHouses();
});

// Get house by id provider
final getHouseByIdProvider = FutureProvider.family<HouseModel?, String>((ref, id) async {
  final houseService = ref.watch(houseServiceProvider);
  return houseService.getHouseById(id);
});

// Search houses provider
final searchHousesProvider = FutureProvider.family<
    List<HouseModel>,
    ({
      String query,
      String city,
      double? minPrice,
      double? maxPrice,
    })>((ref, params) async {
  final houseService = ref.watch(houseServiceProvider);
  return houseService.searchHouses(
    query: params.query,
    city: params.city,
    minPrice: params.minPrice,
    maxPrice: params.maxPrice,
  );
});

// Create house provider
final createHouseProvider = FutureProvider.family<HouseModel?, HouseModel>((ref, house) async {
  final houseService = ref.watch(houseServiceProvider);
  return houseService.createHouse(house);
});

// Update house provider
final updateHouseProvider = FutureProvider.family<HouseModel?, HouseModel>((ref, house) async {
  final houseService = ref.watch(houseServiceProvider);
  return houseService.updateHouse(house);
});
