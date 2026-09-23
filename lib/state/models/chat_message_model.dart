class ChatMessageModel {
  final String id;
  final String senderId;
  final String senderName;
  final String senderImage;
  final String receiverId;
  final String message;
  final List<String> images;
  final DateTime timestamp;
  final bool isRead;

  ChatMessageModel({
    required this.id,
    required this.senderId,
    required this.senderName,
    required this.senderImage,
    required this.receiverId,
    required this.message,
    required this.images,
    required this.timestamp,
    required this.isRead,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      id: json['id'] ?? '',
      senderId: json['senderId'] ?? '',
      senderName: json['senderName'] ?? '',
      senderImage: json['senderImage'] ?? '',
      receiverId: json['receiverId'] ?? '',
      message: json['message'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      timestamp: DateTime.parse(json['timestamp'] ?? DateTime.now().toString()),
      isRead: json['isRead'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'senderId': senderId,
      'senderName': senderName,
      'senderImage': senderImage,
      'receiverId': receiverId,
      'message': message,
      'images': images,
      'timestamp': timestamp.toIso8601String(),
      'isRead': isRead,
    };
  }

  ChatMessageModel copyWith({
    String? id,
    String? senderId,
    String? senderName,
    String? senderImage,
    String? receiverId,
    String? message,
    List<String>? images,
    DateTime? timestamp,
    bool? isRead,
  }) {
    return ChatMessageModel(
      id: id ?? this.id,
      senderId: senderId ?? this.senderId,
      senderName: senderName ?? this.senderName,
      senderImage: senderImage ?? this.senderImage,
      receiverId: receiverId ?? this.receiverId,
      message: message ?? this.message,
      images: images ?? this.images,
      timestamp: timestamp ?? this.timestamp,
      isRead: isRead ?? this.isRead,
    );
  }
}
