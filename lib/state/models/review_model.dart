class ReviewModel {
  final String id;
  final String userId;
  final String userName;
  final String userImage;
  final String itemId;
  final String itemType; // house, service, tuition
  final double rating;
  final String comment;
  final List<String> images;
  final DateTime createdAt;

  ReviewModel({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.itemId,
    required this.itemType,
    required this.rating,
    required this.comment,
    required this.images,
    required this.createdAt,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      userName: json['userName'] ?? '',
      userImage: json['userImage'] ?? '',
      itemId: json['itemId'] ?? '',
      itemType: json['itemType'] ?? '',
      rating: (json['rating'] ?? 0.0).toDouble(),
      comment: json['comment'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'userName': userName,
      'userImage': userImage,
      'itemId': itemId,
      'itemType': itemType,
      'rating': rating,
      'comment': comment,
      'images': images,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  ReviewModel copyWith({
    String? id,
    String? userId,
    String? userName,
    String? userImage,
    String? itemId,
    String? itemType,
    double? rating,
    String? comment,
    List<String>? images,
    DateTime? createdAt,
  }) {
    return ReviewModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userImage: userImage ?? this.userImage,
      itemId: itemId ?? this.itemId,
      itemType: itemType ?? this.itemType,
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
      images: images ?? this.images,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
