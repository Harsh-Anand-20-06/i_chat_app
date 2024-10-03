import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final CollectionReference messages = FirebaseFirestore.instance.collection('messages');
  final String _rapidApiKey = 'f2c5eb7953msh807be487b0b337bp11bbf0jsn1087068a2aa0'; // Replace with your RapidAPI key

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      // Save user's message to Firestore
      messages.add({
        'text': _controller.text,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Call the bot logic using API
      _handleUserMessage(_controller.text);
      _controller.clear();
    }
  }

  void _handleUserMessage(String userMessage) async {
    String botResponse = await _getBotResponse(userMessage) ?? 'No response from the bot';

    // Send bot response to Firestore
    messages.add({
      'text': botResponse,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Future<String?> _getBotResponse(String message) async {
    int retryCount = 0;
    const int maxRetries = 3;
    const int retryDelay = 500; // 500ms

    while (retryCount < maxRetries) {
      try {
        final url = Uri.parse('https://lemurbot.p.rapidapi.com/chat');

        final requestBody = json.encode({
          'bot': 'dilly', // Change this to your bot's name or ID if necessary
          'client': 'd531e3bd-b6c3-4f3f-bb58-a6632cbed5e2', // Client ID from your API documentation
          'message': message,
        });

        print('Request Body: $requestBody');

        final response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json',
            'X-RapidAPI-Key': _rapidApiKey,
            'X-RapidAPI-Host': 'lemurbot.p.rapidapi.com',
          },
          body: requestBody,
        );

        print('Response Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');

        if (response.statusCode == 200) {
          final responseData = json.decode(response.body);
          return responseData['data']['conversation']['output'] ??
              "Error: Unable to parse response data";
        } else if (response.statusCode == 429) {
          // Retry after a short delay
          await Future.delayed(Duration(milliseconds: retryDelay));
          retryCount++;
        } else {
          print("An error occurred: ${response.statusCode}");
          return "An error occurred: ${response.statusCode}";
        }
      } catch (e) {
        print('Error: $e');
        return "An error occurred: $e";
      }
    }

    // If all retries fail, return an error message
    return "Error: Unable to retrieve response from API";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chatbot')),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: messages.orderBy('timestamp', descending: true).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                final docs = snapshot.data!.docs;
                return ListView.builder(
                  reverse: true,
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final message = docs[index].data() as Map<String, dynamic>;
                    return ListTile(
                      title: Text(message['text']),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(labelText: 'Send a message'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
