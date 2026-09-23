class HouseModel {
  final String id;
  final String ownerId;
  final String ownerName;
  final String ownerPhone;
  final String title;
  final String description;
  final String address;
  final String city;
  final double latitude;
  final double longitude;
  final double price;
  final int bedrooms;
  final int bathrooms;
  final int floorNumber;
  final List<String> images;
  final List<String> amenities;
  final bool isPetFriendly;
  final bool hasWifi;
  final bool hasParking;
  final double rating;
  final int reviewCount;
  final DateTime createdAt;
  final bool isAvailable;

  HouseModel({
    required this.id,
    required this.ownerId,
    required this.ownerName,
    required this.ownerPhone,
    required this.title,
    required this.description,
    required this.address,
    required this.city,
    required this.latitude,
    required this.longitude,
    required this.price,
    required this.bedrooms,
    required this.bathrooms,
    required this.floorNumber,
    required this.images,
    required this.amenities,
    required this.isPetFriendly,
    required this.hasWifi,
    required this.hasParking,
    required this.rating,
    required this.reviewCount,
    required this.createdAt,
    required this.isAvailable,
  });

  factory HouseModel.fromJson(Map<String, dynamic> json) {
    return HouseModel(
      id: json['id'] ?? '',
      ownerId: json['ownerId'] ?? '',
      ownerName: json['ownerName'] ?? '',
      ownerPhone: json['ownerPhone'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      address: json['address'] ?? '',
      city: json['city'] ?? '',
      latitude: (json['latitude'] ?? 0.0).toDouble(),
      longitude: (json['longitude'] ?? 0.0).toDouble(),
      price: (json['price'] ?? 0.0).toDouble(),
      bedrooms: json['bedrooms'] ?? 0,
      bathrooms: json['bathrooms'] ?? 0,
      floorNumber: json['floorNumber'] ?? 0,
      images: List<String>.from(json['images'] ?? []),
      amenities: List<String>.from(json['amenities'] ?? []),
      isPetFriendly: json['isPetFriendly'] ?? false,
      hasWifi: json['hasWifi'] ?? false,
      hasParking: json['hasParking'] ?? false,
      rating: (json['rating'] ?? 0.0).toDouble(),
      reviewCount: json['reviewCount'] ?? 0,
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toString()),
      isAvailable: json['isAvailable'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ownerId': ownerId,
      'ownerName': ownerName,
      'ownerPhone': ownerPhone,
      'title': title,
      'description': description,
      'address': address,
      'city': city,
      'latitude': latitude,
      'longitude': longitude,
      'price': price,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'floorNumber': floorNumber,
      'images': images,
      'amenities': amenities,
      'isPetFriendly': isPetFriendly,
      'hasWifi': hasWifi,
      'hasParking': hasParking,
      'rating': rating,
      'reviewCount': reviewCount,
      'createdAt': createdAt.toIso8601String(),
      'isAvailable': isAvailable,
    };
  }

  HouseModel copyWith({
    String? id,
    String? ownerId,
    String? ownerName,
    String? ownerPhone,
    String? title,
    String? description,
    String? address,
    String? city,
    double? latitude,
    double? longitude,
    double? price,
    int? bedrooms,
    int? bathrooms,
    int? floorNumber,
    List<String>? images,
    List<String>? amenities,
    bool? isPetFriendly,
    bool? hasWifi,
    bool? hasParking,
    double? rating,
    int? reviewCount,
    DateTime? createdAt,
    bool? isAvailable,
  }) {
    return HouseModel(
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      ownerName: ownerName ?? this.ownerName,
      ownerPhone: ownerPhone ?? this.ownerPhone,
      title: title ?? this.title,
      description: description ?? this.description,
      address: address ?? this.address,
      city: city ?? this.city,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      price: price ?? this.price,
      bedrooms: bedrooms ?? this.bedrooms,
      bathrooms: bathrooms ?? this.bathrooms,
      floorNumber: floorNumber ?? this.floorNumber,
      images: images ?? this.images,
      amenities: amenities ?? this.amenities,
      isPetFriendly: isPetFriendly ?? this.isPetFriendly,
      hasWifi: hasWifi ?? this.hasWifi,
      hasParking: hasParking ?? this.hasParking,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      createdAt: createdAt ?? this.createdAt,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }
}
