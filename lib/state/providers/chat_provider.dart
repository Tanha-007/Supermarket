import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/chat_message_model.dart';

// Mock chat service
class ChatService {
  final Map<String, List<ChatMessageModel>> _conversations = {};

  Future<List<ChatMessageModel>> getMessages(String conversationId) async {
    await Future.delayed(const Duration(seconds: 1));
    return _conversations[conversationId] ?? [];
  }

  Future<ChatMessageModel?> sendMessage(ChatMessageModel message) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (!_conversations.containsKey('${message.senderId}_${message.receiverId}')) {
      _conversations['${message.senderId}_${message.receiverId}'] = [];
    }
    _conversations['${message.senderId}_${message.receiverId}']!.add(message);
    return message;
  }

  Future<void> markAsRead(String conversationId, String messageId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final messages = _conversations[conversationId] ?? [];
    final index = messages.indexWhere((msg) => msg.id == messageId);
    if (index != -1) {
      messages[index] = messages[index].copyWith(isRead: true);
    }
  }

  Future<void> deleteMessage(String conversationId, String messageId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _conversations[conversationId]?.removeWhere((msg) => msg.id == messageId);
  }
}

// Chat service provider
final chatServiceProvider = Provider<ChatService>((ref) {
  return ChatService();
});

// Get messages provider
final getMessagesProvider = FutureProvider.family<List<ChatMessageModel>, String>((ref, conversationId) async {
  final chatService = ref.watch(chatServiceProvider);
  return chatService.getMessages(conversationId);
});

// Send message provider
final sendMessageProvider = FutureProvider.family<ChatMessageModel?, ChatMessageModel>((ref, message) async {
  final chatService = ref.watch(chatServiceProvider);
  return chatService.sendMessage(message);
});

// Mark as read provider
final markAsReadProvider = FutureProvider.family<void, (String, String)>((ref, params) async {
  final chatService = ref.watch(chatServiceProvider);
  return chatService.markAsRead(params.$1, params.$2);
});
