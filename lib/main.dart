import 'package:flutter/material.dart';

void main() {
  runApp(WhaleTrackingApp());
}

class WhaleTrackingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whale Tracking',
      home: WhaleListScreen(),
    );
  }
}

class WhaleListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> transactions = [
    {
      'whale_address': '0x000000000000000000000000000000000000dead',
      'value_formatted': '0.000001',
      'timestamp': '2025-09-04T11:06:53Z'
    },
    {
      'whale_address': '0x000000000000000000000000000000000000dead',
      'value_formatted': '27282154.680949',
      'timestamp': '2025-09-04T11:06:53Z'
    },
    {
      'whale_address': '0x000000000000000000000000000000000000dead',
      'value_formatted': '25.812761',
      'timestamp': '2025-09-04T11:06:36Z'
    },
    // Additional transactions can be added here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Whale Transactions'),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('Address: ${transaction['whale_address']}'),
              subtitle: Text('Amount: ${transaction['value_formatted']} - Time: ${transaction['timestamp']}'),
            ),
          );
        },
      ),
    );
  }
}