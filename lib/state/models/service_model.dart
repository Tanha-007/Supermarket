class ServiceModel {
  final String id;
  final String providerId;
  final String providerName;
  final String providerPhone;
  final String title;
  final String description;
  final String category; // cleaning, repair, tutoring, moving, etc
  final String image;
  final double price;
  final String priceType; // hourly, fixed, per-item
  final double rating;
  final int reviewCount;
  final bool isAvailable;
  final List<String> skills;
  final String city;
  final DateTime createdAt;

  ServiceModel({
    required this.id,
    required this.providerId,
    required this.providerName,
    required this.providerPhone,
    required this.title,
    required this.description,
    required this.category,
    required this.image,
    required this.price,
    required this.priceType,
    required this.rating,
    required this.reviewCount,
    required this.isAvailable,
    required this.skills,
    required this.city,
    required this.createdAt,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'] ?? '',
      providerId: json['providerId'] ?? '',
      providerName: json['providerName'] ?? '',
      providerPhone: json['providerPhone'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      image: json['image'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      priceType: json['priceType'] ?? 'fixed',
      rating: (json['rating'] ?? 0.0).toDouble(),
      reviewCount: json['reviewCount'] ?? 0,
      isAvailable: json['isAvailable'] ?? true,
      skills: List<String>.from(json['skills'] ?? []),
      city: json['city'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'providerId': providerId,
      'providerName': providerName,
      'providerPhone': providerPhone,
      'title': title,
      'description': description,
      'category': category,
      'image': image,
      'price': price,
      'priceType': priceType,
      'rating': rating,
      'reviewCount': reviewCount,
      'isAvailable': isAvailable,
      'skills': skills,
      'city': city,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  ServiceModel copyWith({
    String? id,
    String? providerId,
    String? providerName,
    String? providerPhone,
    String? title,
    String? description,
    String? category,
    String? image,
    double? price,
    String? priceType,
    double? rating,
    int? reviewCount,
    bool? isAvailable,
    List<String>? skills,
    String? city,
    DateTime? createdAt,
  }) {
    return ServiceModel(
      id: id ?? this.id,
      providerId: providerId ?? this.providerId,
      providerName: providerName ?? this.providerName,
      providerPhone: providerPhone ?? this.providerPhone,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
      price: price ?? this.price,
      priceType: priceType ?? this.priceType,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      isAvailable: isAvailable ?? this.isAvailable,
      skills: skills ?? this.skills,
      city: city ?? this.city,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
