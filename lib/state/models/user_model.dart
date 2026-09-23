class UserModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String nid;
  final String role; // student, houseowner, serviceprovider
  final String profileImage;
  final String address;
  final String city;
  final double rating;
  final int reviewCount;
  final DateTime createdAt;
  final bool isVerified;
  final bool isActive;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.nid,
    required this.role,
    required this.profileImage,
    required this.address,
    required this.city,
    required this.rating,
    required this.reviewCount,
    required this.createdAt,
    required this.isVerified,
    required this.isActive,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      nid: json['nid'] ?? '',
      role: json['role'] ?? 'student',
      profileImage: json['profileImage'] ?? '',
      address: json['address'] ?? '',
      city: json['city'] ?? '',
      rating: (json['rating'] ?? 0.0).toDouble(),
      reviewCount: json['reviewCount'] ?? 0,
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toString()),
      isVerified: json['isVerified'] ?? false,
      isActive: json['isActive'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'nid': nid,
      'role': role,
      'profileImage': profileImage,
      'address': address,
      'city': city,
      'rating': rating,
      'reviewCount': reviewCount,
      'createdAt': createdAt.toIso8601String(),
      'isVerified': isVerified,
      'isActive': isActive,
    };
  }

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? nid,
    String? role,
    String? profileImage,
    String? address,
    String? city,
    double? rating,
    int? reviewCount,
    DateTime? createdAt,
    bool? isVerified,
    bool? isActive,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      nid: nid ?? this.nid,
      role: role ?? this.role,
      profileImage: profileImage ?? this.profileImage,
      address: address ?? this.address,
      city: city ?? this.city,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      createdAt: createdAt ?? this.createdAt,
      isVerified: isVerified ?? this.isVerified,
      isActive: isActive ?? this.isActive,
    );
  }
}
