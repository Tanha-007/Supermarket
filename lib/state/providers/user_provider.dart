import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model.dart';

// Mock user service
class UserService {
  Future<UserModel?> getUserById(String userId) async {
    await Future.delayed(const Duration(seconds: 1));
    return UserModel(
      id: userId,
      name: 'Rajib Ahmed',
      email: 'rajib@example.com',
      phone: '01700000000',
      nid: '1234567890123',
      role: 'student',
      profileImage: 'https://via.placeholder.com/150',
      address: '123 Main St, Dhaka',
      city: 'Dhaka',
      rating: 4.5,
      reviewCount: 12,
      createdAt: DateTime.now(),
      isVerified: true,
      isActive: true,
    );
  }

  Future<List<UserModel>> getAllUsers() async {
    await Future.delayed(const Duration(seconds: 1));
    return [];
  }

  Future<UserModel?> updateUser(UserModel user) async {
    await Future.delayed(const Duration(seconds: 1));
    return user;
  }

  Future<void> deleteUser(String userId) async {
    await Future.delayed(const Duration(seconds: 1));
  }
}

// User service provider
final userServiceProvider = Provider<UserService>((ref) {
  return UserService();
});

// Get user by id provider
final getUserByIdProvider = FutureProvider.family<UserModel?, String>((ref, userId) async {
  final userService = ref.watch(userServiceProvider);
  return userService.getUserById(userId);
});

// Get all users provider
final getAllUsersProvider = FutureProvider<List<UserModel>>((ref) async {
  final userService = ref.watch(userServiceProvider);
  return userService.getAllUsers();
});

// Update user provider
final updateUserProvider = FutureProvider.family<UserModel?, UserModel>((ref, user) async {
  final userService = ref.watch(userServiceProvider);
  return userService.updateUser(user);
});
