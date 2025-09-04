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
      "whale_address": "0x000000000000000000000000000000000000dead",
      "value_formatted": "0.000000",
      "timestamp": "2025-09-04T06:41:07Z"
    },
    {
      "whale_address": "0x000000000000000000000000000000000000dead",
      "value_formatted": "31363243.146685",
      "timestamp": "2025-09-04T06:41:04Z"
    },
    {
      "whale_address": "0x8894e0a0c962cb723c1976a4421c95949be2d4e3",
      "value_formatted": "34.708721",
      "timestamp": "2025-09-04T06:40:52Z"
    }
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
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Address: ${transaction['whale_address']}', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 8),
                  Text('Amount: ${transaction['value_formatted']}', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 8),
                  Text('Timestamp: ${transaction['timestamp']}', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}