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
      "whale_address": "0x8894e0a0c962cb723c1976a4421c95949be2d4e3",
      "whale_name": "Binance: Hot Wallet 6",
      "whale_rank": 51,
      "contract_address": "0x2859e4544c4bb03966803b044a93563bd2d0dd4d",
      "token_name": "SHIBA INU",
      "token_symbol": "SHIB",
      "transaction_hash": "0xa90cc043284d6e7a033f52de0cc2e7edef9c6fa094bf69925b775b3972472975",
      "timestamp": "2025-09-06T08:56:01Z",
      "value_formatted": "236777.920000"
    },
    {
      "whale_address": "0x000000000000000000000000000000000000dead",
      "whale_name": "Null: 0x000...dEaD",
      "whale_rank": 6,
      "contract_address": "0x206ec57d16fc60130ec6e3e0d748791f44a4e06a",
      "token_name": "Unknown",
      "token_symbol": "UNKNOWN",
      "transaction_hash": "0x28ba9bbd80828f8bc694d79fe82e4bd20a069a9c8a2b68e67920dadbf3e2721d",
      "timestamp": "2025-09-06T08:56:09Z",
      "value_formatted": "776.192953"
    },
    {
      "whale_address": "0x000000000000000000000000000000000000dead",
      "whale_name": "Null: 0x000...dEaD",
      "whale_rank": 6,
      "contract_address": "0x001208f7f53f78db2b32e1c68198d3e8f320aa23",
      "token_name": "Unknown",
      "token_symbol": "UNKNOWN",
      "transaction_hash": "0x3dc4cd9ffe0413cc18f151fde2d8b6386c97d11c0f69ee6007f03ef49b37ba60",
      "timestamp": "2025-09-06T08:56:13Z",
      "value_formatted": "0.000002"
    },
    // More entries would go here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Whale Tracking'),
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
                  Text('Whale Address: ${transaction['whale_address']}', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Whale Name: ${transaction['whale_name']}'),
                  Text('Whale Rank: ${transaction['whale_rank']}'),
                  Text('Contract Address: ${transaction['contract_address']}'),
                  Text('Token Name: ${transaction['token_name']}'),
                  Text('Token Symbol: ${transaction['token_symbol']}'),
                  Text('Transaction Hash: ${transaction['transaction_hash']}'),
                  Text('Timestamp: ${transaction['timestamp']}'),
                  Text('Value: ${transaction['value_formatted']}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}