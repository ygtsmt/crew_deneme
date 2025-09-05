import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(WhaleTrackerApp());
}

class WhaleTrackerApp extends StatelessWidget {
  final String jsonData = '''
  {"whales":[{"_id":"689b3beb060e188892c9040e","token_address":"2b1kV6DkPAnxd5ixfnxCpjxmKwqjjaYmCZfHsFu24GXo","address":"CyaE1VxvBrahnPWkqm5VsdCvyS2QmNht2UFrKJHga54o","balance":33383185.218762,"percentage":21.628975513705814,"rank":1,"last_updated":"2025-08-12T12:20:58.999Z","created_at":"2025-08-11T08:27:15.909Z","updated_at":"2025-08-12T12:20:58.999Z"},{"_id":"689b3c62060e188892c90411","token_address":"2b1kV6DkPAnxd5ixfnxCpjxmKwqjjaYmCZfHsFu24GXo","address":"ArfVe1K5gt5zsxzRCWSQeWc1rJSJjZzuuYxmvRh71mMQ","balance":33383185.218762,"percentage":21.628975513705814,"rank":1,"last_updated":"2025-08-12T12:20:58.999Z","created_at":"2025-08-11T08:27:15.909Z","updated_at":"2025-08-12T12:20:58.999Z"},{"_id":"689b3c3d060e188892c90410","token_address":"2b1kV6DkPAnxd5ixfnxCpjxmKwqjjaYmCZfHsFu24GXo","address":"5GoEGMmbd5HQSzDFiLuwETnnsHjB1vWqEfyxhKxxNJh2","balance":33383185.218762,"percentage":21.628975513705814,"rank":1,"last_updated":"2025-08-12T12:20:58.999Z","created_at":"2025-08-11T08:27:15.909Z","updated_at":"2025-08-12T12:20:58.999Z"},{"_id":"689de3f7b2ff6894f942e2cc","token_address":"2b1kV6DkPAnxd5ixfnxCpjxmKwqjjaYmCZfHsFu24GXo","address":"xXpRSpAe1ajq4tJP78tS3X1AqNwJVQ4Vvb1Swg4hHQh","balance":33383185.218762,"percentage":21.628975513705814,"rank":1,"last_updated":"2025-08-12T12:20:58.999Z","created_at":"2025-08-11T08:27:15.909Z","updated_at":"2025-08-12T12:20:58.999Z"},{"_id":"689de3eab2ff6894f942e2cb","token_address":"2b1kV6DkPAnxd5ixfnxCpjxmKwqjjaYmCZfHsFu24GXo","address":"5nQKQEA12zWConEjxrtZVdmdu1iR5rXvg7icc3kJENB7","balance":33383185.218762,"percentage":21.628975513705814,"rank":1,"last_updated":"2025-08-12T12:20:58.999Z","created_at":"2025-08-11T08:27:15.909Z","updated_at":"2025-08-12T12:20:58.999Z"},{"_id":"689de402b2ff6894f942e2cd","token_address":"2b1kV6DkPAnxd5ixfnxCpjxmKwqjjaYmCZfHsFu24GXo","address":"GMKNH8xEAfpMzk4oChsv3iLv6mAw8ksZQd6tbvLMuvLr","balance":33383185.218762,"percentage":21.628975513705814,"rank":1,"last_updated":"2025-08-12T12:20:58.999Z","created_at":"2025-08-11T08:27:15.909Z","updated_at":"2025-08-12T12:20:58.999Z"},{"_id":"689de40cb2ff6894f942e2ce","token_address":"2b1kV6DkPAnxd5ixfnxCpjxmKwqjjaYmCZfHsFu24GXo","address":"DEVyVJeUj5qsvLZebB7Y1PuULEQT57Zat8ADf2UgCnqn","balance":33383185.218762,"percentage":21.628975513705814,"rank":1,"last_updated":"2025-08-12T12:20:58.999Z","created_at":"2025-08-11T08:27:15.909Z","updated_at":"2025-08-12T12:20:58.999Z"},{"_id":"689de435b2ff6894f942e2d1","token_address":"2b1kV6DkPAnxd5ixfnxCpjxmKwqjjaYmCZfHsFu24GXo","address":"BCagckXeMChUKrHEd6fKFA1uiWDtcmCXMsqaheLiUPJd","balance":33383185.218762,"percentage":21.628975513705814,"rank":1,"last_updated":"2025-08-12T12:20:58.999Z","created_at":"2025-08-11T08:27:15.909Z","updated_at":"2025-08-12T12:20:58.999Z"},{"_id":"689ee0ded51a97dadb2521d3","token_address":"2b1kV6DkPAnxd5ixfnxCpjxmKwqjjaYmCZfHsFu24GXo","address":"3ZviMWNFPy931qMZ8CPqsmtofdXPpqKmfDXDBN25Lv27","balance":33383185.218762,"percentage":21.628975513705814,"rank":1,"last_updated":"2025-08-12T12:20:58.999Z","created_at":"2025-08-11T08:27:15.909Z","updated_at":"2025-08-12T12:20:58.999Z"},{"_id":"689eeaf83d4156bca20863e0","token_address":"2b1kV6DkPAnxd5ixfnxCpjxmKwqjjaYmCZfHsFu24GXo","address":"6o4dLQHgEXeixCe5d8bU8cpPgm1GdVenSCaX5FEdkA4X","balance":33383185.218762,"percentage":3.0272814999213042,"rank":1,"last_updated":"2025-08-15T08:08:24.985Z","created_at":"2025-08-15T08:08:24.986Z","updated_at":"2025-08-15T08:08:24.985Z"},{"_id":"689eeafe3d4156bca20863ea","token_address":"27G8MtK7VtTcCHkpASjSDdkWWYfoqT6ggEuKidVJidD4","address":"2XYPHGFrEZxwhZQxtUETT6zEcWwBWv5yPBoAuDJf4i7w","balance":94220691.984057,"percentage":24.432216050456258,"rank":1,"last_updated":"2025-08-15T08:08:30.021Z","created_at":"2025-08-15T08:08:30.022Z","updated_at":"2025-08-15T08:08:30.021Z"}]}
  ''';

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> data = jsonDecode(jsonData);
    final List whales = data['whales'];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Whale Tracker'),
        ),
        body: ListView.builder(
          itemCount: whales.length,
          itemBuilder: (context, index) {
            final whale = whales[index];
            return Card(
              margin: EdgeInsets.all(8.0),
              child: ListTile(
                title: Text('Address: ${whale['address']}'),
                subtitle: Text('Amount: ${whale['balance']}\nLast Updated: ${whale['last_updated']}'),
              ),
            );
          },
        ),
      ),
    );
  }
}