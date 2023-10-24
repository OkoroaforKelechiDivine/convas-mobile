import 'package:flutter/material.dart';
import '../../model/message.dart';
import '../../model/user_model.dart';

class MessagingScreen extends StatefulWidget {
  final AppUser user;

  const MessagingScreen({required this.user, Key? key}) : super(key: key);

  @override
  State<MessagingScreen> createState() => _MessagingScreenState();
}

class _MessagingScreenState extends State<MessagingScreen> {
  final List<Message> _messages = [];
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with ${widget.user.firstName}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Align(
                  alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: message.isMe ? Colors.blue : Colors.grey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      message.text,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(height: 1),
          _buildMessageInputField(),
        ],
      ),
    );
  }

  Widget _buildMessageInputField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              _sendMessage(_textController.text, isMe: true);
            },
            icon: Icon(Icons.send),
          ),
          Expanded(
            child: TextField(
              controller: _textController,
              textInputAction: TextInputAction.send,
              onSubmitted: (text) {
                _sendMessage(text, isMe: true);
              },
              decoration: InputDecoration(
                hintText: 'Type your message...',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage(String text, {bool isMe = false}) {
    if (text.isNotEmpty) {
      final newMessage = Message(text: text, isMe: isMe);
      setState(() {
        _messages.add(newMessage);
        _textController.clear();
      });
    }
  }
}
