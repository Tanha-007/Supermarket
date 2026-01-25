class BookingModel {
  final String id;
  final String userId;
  final String itemId; // house, service, or tuition id
  final String itemType; // house, service, tuition
  final String providerId;
  final double totalPrice;
  final DateTime bookingDate;
  final DateTime scheduledDate;
  final String status; // pending, confirmed, completed, cancelled
  final String notes;
  final DateTime createdAt;
  final DateTime updatedAt;

  BookingModel({
    required this.id,
    required this.userId,
    required this.itemId,
    required this.itemType,
    required this.providerId,
    required this.totalPrice,
    required this.bookingDate,
    required this.scheduledDate,
    required this.status,
    required this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      itemId: json['itemId'] ?? '',
      itemType: json['itemType'] ?? '',
      providerId: json['providerId'] ?? '',
      totalPrice: (json['totalPrice'] ?? 0.0).toDouble(),
      bookingDate: DateTime.parse(json['bookingDate'] ?? DateTime.now().toString()),
      scheduledDate: DateTime.parse(json['scheduledDate'] ?? DateTime.now().toString()),
      status: json['status'] ?? 'pending',
      notes: json['notes'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toString()),
      updatedAt: DateTime.parse(json['updatedAt'] ?? DateTime.now().toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'itemId': itemId,
      'itemType': itemType,
      'providerId': providerId,
      'totalPrice': totalPrice,
      'bookingDate': bookingDate.toIso8601String(),
      'scheduledDate': scheduledDate.toIso8601String(),
      'status': status,
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  BookingModel copyWith({
    String? id,
    String? userId,
    String? itemId,
    String? itemType,
    String? providerId,
    double? totalPrice,
    DateTime? bookingDate,
    DateTime? scheduledDate,
    String? status,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return BookingModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      itemId: itemId ?? this.itemId,
      itemType: itemType ?? this.itemType,
      providerId: providerId ?? this.providerId,
      totalPrice: totalPrice ?? this.totalPrice,
      bookingDate: bookingDate ?? this.bookingDate,
      scheduledDate: scheduledDate ?? this.scheduledDate,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
