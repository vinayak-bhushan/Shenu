import 'dart:math';

import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final List<String> userNames = [
    'John Doe',
    'Alice Smith',
    'Bob Johnson',
    'Emily Brown',
    'David Lee',
  ];

  final List<String> messages = [
    'Hello there!',
    'How are you?',
    'What\'s up?',
    'Flutter is awesome!',
    'See you later.',
  ];

  String getRandomImageUrl() {
    final random = Random();
    final width = 50 + random.nextInt(200); // Random width between 50 and 250
    final height = 50 + random.nextInt(200); // Random height between 50 and 250
    return 'https://picsum.photos/$width/$height';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Center(
          child: Text(
            'Direct Message',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: userNames.length,
        itemBuilder: (context, index) {
          final random = Random();
          final userPhotoUrl = getRandomImageUrl();

          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(userPhotoUrl),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(userNames[index], style: TextStyle(fontWeight: FontWeight.bold),),
                Text('12:34 PM', style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 12)),
              ],
            ),
            subtitle: Stack(
              children: [
                Text(
                  messages[random.nextInt(messages.length)],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: Text(
                      '2', // Replace with the actual notification count
                      style: TextStyle(color: Colors.white,
                      fontSize: 8,),
                    ),
                  ),
                ),
              ],
            ),
            onTap: () {
              // Handle onTap event for chat item
            },
          );
        },
      ),
    );
  }
}
