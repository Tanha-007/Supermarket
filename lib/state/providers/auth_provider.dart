import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_model.dart';

// Mock current user state
final currentUserProvider = StateProvider<UserModel?>((ref) => null);

// Mock authentication state
final authTokenProvider = StateProvider<String?>((ref) => null);

// Mock is authenticated
final isAuthenticatedProvider = Provider<bool>((ref) {
  return ref.watch(authTokenProvider) != null;
});

// Mock user authentication service
class AuthService {
  Future<UserModel?> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    // Mock login
    return UserModel(
      id: '1',
      name: 'Rajib Ahmed',
      email: email,
      phone: '01700000000',
      nid: '1234567890123',
      role: 'student',
      profileImage: 'https://via.placeholder.com/150',
      address: 'Dhaka',
      city: 'Dhaka',
      rating: 4.5,
      reviewCount: 12,
      createdAt: DateTime.now(),
      isVerified: true,
      isActive: true,
    );
  }

  Future<UserModel?> signup(String name, String email, String password, String role) async {
    await Future.delayed(const Duration(seconds: 1));
    // Mock signup
    return UserModel(
      id: '2',
      name: name,
      email: email,
      phone: '01700000001',
      nid: '1234567890124',
      role: role,
      profileImage: 'https://via.placeholder.com/150',
      address: 'Dhaka',
      city: 'Dhaka',
      rating: 0.0,
      reviewCount: 0,
      createdAt: DateTime.now(),
      isVerified: false,
      isActive: true,
    );
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<bool> verifyNID(String nid) async {
    await Future.delayed(const Duration(seconds: 2));
    return true; // Mock verification
  }
}

// Auth service provider
final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

// Login provider
final loginProvider = FutureProvider.family<UserModel?, (String, String)>((ref, args) async {
  final authService = ref.watch(authServiceProvider);
  return authService.login(args.$1, args.$2);
});

// Signup provider
final signupProvider = FutureProvider.family<UserModel?, (String, String, String, String)>((ref, args) async {
  final authService = ref.watch(authServiceProvider);
  return authService.signup(args.$1, args.$2, args.$3, args.$4);
});

// NID verification provider
final nidVerificationProvider = FutureProvider.family<bool, String>((ref, nid) async {
  final authService = ref.watch(authServiceProvider);
  return authService.verifyNID(nid);
});
