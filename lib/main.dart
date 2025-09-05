import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whale Tracking',
      home: WhaleList(),
    );
  }
}

class WhaleList extends StatelessWidget {
  final List<Map<String, dynamic>> transactions = [
    {
      "whale_address": "0x000000000000000000000000000000000000dead",
      "value_formatted": "155.510579",
      "timestamp": "2025-09-05T08:39:42Z"
    },
    {
      "whale_address": "0x000000000000000000000000000000000000dead",
      "value_formatted": "189.682117",
      "timestamp": "2025-09-05T08:39:39Z"
    },
    {
      "whale_address": "0x000000000000000000000000000000000000dead",
      "value_formatted": "0.000002",
      "timestamp": "2025-09-05T08:39:41Z"
    },
    {
      "whale_address": "0x8894e0a0c962cb723c1976a4421c95949be2d4e3",
      "value_formatted": "3.430900",
      "timestamp": "2025-09-05T08:39:20Z"
    },
    {
      "whale_address": "0x000000000000000000000000000000000000dead",
      "value_formatted": "20.985602",
      "timestamp": "2025-09-05T08:39:19Z"
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
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text('Address: ${transaction['whale_address']}'),
              subtitle: Text('Amount: ${transaction['value_formatted']} USD \nTimestamp: ${transaction['timestamp']}'),
            ),
          );
        },
      ),
    );
  }
}