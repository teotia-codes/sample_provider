import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_provider/provider/message_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final messagesProvider = Provider.of<MessagesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Column(
        children: [
          // Input field and send button to add new messages (these might not be Consumer widgets)
          Expanded( // Wrap the message list with Consumer
            child: Consumer<MessagesProvider>(
              builder: (context, messagesProvider, child) {
                return ListView.builder(
                  itemCount: messagesProvider.messages.length,
                  itemBuilder: (context, index) {
                    final message = messagesProvider.messages[index];
                    // Build the UI for a single message here
                    return Text('${message.senderName}: ${message.content}');
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
  // in this chat screen only only the consumer widget will build again and again and not the whole ui.