import 'package:flutter/material.dart';

class MessagesProvider extends ChangeNotifier {
  List<MessageModel> messages = [];

  void addMessage(String senderName, String content) {
    messages.add(MessageModel(senderName, content, DateTime.now()));
    notifyListeners(); // Notify listeners of the change
  }
}

class MessageModel {
  final String senderName;
  final String content;
  final DateTime timestamp;

  MessageModel(this.senderName, this.content, this.timestamp);
}
