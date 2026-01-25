class EmergencyContactModel {
  final String id;
  final String userId;
  final String name;
  final String phone;
  final String relationship;
  final String address;
  final DateTime createdAt;

  EmergencyContactModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.phone,
    required this.relationship,
    required this.address,
    required this.createdAt,
  });

  factory EmergencyContactModel.fromJson(Map<String, dynamic> json) {
    return EmergencyContactModel(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      relationship: json['relationship'] ?? '',
      address: json['address'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'phone': phone,
      'relationship': relationship,
      'address': address,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  EmergencyContactModel copyWith({
    String? id,
    String? userId,
    String? name,
    String? phone,
    String? relationship,
    String? address,
    DateTime? createdAt,
  }) {
    return EmergencyContactModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      relationship: relationship ?? this.relationship,
      address: address ?? this.address,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
