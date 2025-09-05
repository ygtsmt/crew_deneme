import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whale Tracking',
      home: WhaleTrackingScreen(),
    );
  }
}

class WhaleTrackingScreen extends StatelessWidget {
  final String jsonData = '''{"count":50,"limit":50,"status":"success","transactions":[{"id":"000000000000000000000000","whale_address":"0x000000000000000000000000000000000000dead","whale_name":"Null: 0x000...dEaD","whale_rank":6,"contract_address":"0x001208f7f53f78db2b32e1c68198d3e8f320aa23","token_name":"APD","token_symbol":"APD","token_type":"migrated","transaction_hash":"0x1263b9d4bb20fda332dcd398775941f1d942c301fd7aecebab99e7c53a47eba1","block_number":60106344,"timestamp":"2025-09-05T13:17:45Z","value":886252000000,"value_formatted":"0.000001","is_incoming":true,"token_market_cap":3859109927,"price_usd":"0.04158","created_at":"2025-09-05T13:17:48.570324484Z","image":"https://dd.dexscreener.com/ds-data/tokens/bsc/0x001208F7F53F78Db2b32E1c68198D3e8f320Aa23.png"}]}''';

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> data = json.decode(jsonData);
    final List<dynamic> transactions = data['transactions'];

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
              subtitle: Text('Amount: ${transaction['value_formatted']} USD\nTimestamp: ${transaction['timestamp']}'),
            ),
          );
        },
      ),
    );
  }
}