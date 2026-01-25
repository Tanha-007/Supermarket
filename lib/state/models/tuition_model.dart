class TuitionModel {
  final String id;
  final String tutorId;
  final String tutorName;
  final String tutorPhone;
  final String subject;
  final String level; // primary, secondary, hsc, university
  final String description;
  final String image;
  final double price;
  final String priceType; // hourly, monthly
  final double rating;
  final int reviewCount;
  final bool isAvailable;
  final List<String> qualifications;
  final String city;
  final String experience;
  final DateTime createdAt;

  TuitionModel({
    required this.id,
    required this.tutorId,
    required this.tutorName,
    required this.tutorPhone,
    required this.subject,
    required this.level,
    required this.description,
    required this.image,
    required this.price,
    required this.priceType,
    required this.rating,
    required this.reviewCount,
    required this.isAvailable,
    required this.qualifications,
    required this.city,
    required this.experience,
    required this.createdAt,
  });

  factory TuitionModel.fromJson(Map<String, dynamic> json) {
    return TuitionModel(
      id: json['id'] ?? '',
      tutorId: json['tutorId'] ?? '',
      tutorName: json['tutorName'] ?? '',
      tutorPhone: json['tutorPhone'] ?? '',
      subject: json['subject'] ?? '',
      level: json['level'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      priceType: json['priceType'] ?? 'hourly',
      rating: (json['rating'] ?? 0.0).toDouble(),
      reviewCount: json['reviewCount'] ?? 0,
      isAvailable: json['isAvailable'] ?? true,
      qualifications: List<String>.from(json['qualifications'] ?? []),
      city: json['city'] ?? '',
      experience: json['experience'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tutorId': tutorId,
      'tutorName': tutorName,
      'tutorPhone': tutorPhone,
      'subject': subject,
      'level': level,
      'description': description,
      'image': image,
      'price': price,
      'priceType': priceType,
      'rating': rating,
      'reviewCount': reviewCount,
      'isAvailable': isAvailable,
      'qualifications': qualifications,
      'city': city,
      'experience': experience,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  TuitionModel copyWith({
    String? id,
    String? tutorId,
    String? tutorName,
    String? tutorPhone,
    String? subject,
    String? level,
    String? description,
    String? image,
    double? price,
    String? priceType,
    double? rating,
    int? reviewCount,
    bool? isAvailable,
    List<String>? qualifications,
    String? city,
    String? experience,
    DateTime? createdAt,
  }) {
    return TuitionModel(
      id: id ?? this.id,
      tutorId: tutorId ?? this.tutorId,
      tutorName: tutorName ?? this.tutorName,
      tutorPhone: tutorPhone ?? this.tutorPhone,
      subject: subject ?? this.subject,
      level: level ?? this.level,
      description: description ?? this.description,
      image: image ?? this.image,
      price: price ?? this.price,
      priceType: priceType ?? this.priceType,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      isAvailable: isAvailable ?? this.isAvailable,
      qualifications: qualifications ?? this.qualifications,
      city: city ?? this.city,
      experience: experience ?? this.experience,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
