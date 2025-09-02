import 'package:flutter/material.dart';

void main() {
  runApp(WhaleTrackerApp());
}

class WhaleTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whale Tracker',
      home: WhaleListScreen(),
    );
  }
}

class WhaleListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> transactions = [
    {"whale_address": "0x8894e0a0c962cb723c1976a4421c95949be2d4e3", "value_formatted": "7.352916", "timestamp": "2025-09-02T11:07:25Z"},
    {"whale_address": "0x8894e0a0c962cb723c1976a4421c95949be2d4e3", "value_formatted": "5000.000000", "timestamp": "2025-09-02T11:07:29Z"},
    {"whale_address": "0x000000000000000000000000000000000000dead", "value_formatted": "22170.599191", "timestamp": "2025-09-02T11:07:19Z"},
    {"whale_address": "0x000000000000000000000000000000000000dead", "value_formatted": "22203.092239", "timestamp": "2025-09-02T11:06:49Z"}
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
              title: Text('Address: ${'${transaction['whale_address']}'}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Amount: ${'${transaction['value_formatted']}'}'),
                  Text('Timestamp: ${'${transaction['timestamp']}'}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}