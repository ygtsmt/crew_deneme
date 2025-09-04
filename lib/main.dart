// Simple Whale Tracking ListView with hardcoded data
import 'package:flutter/material.dart';

void main() {
  runApp(const WhaleApp());
}

class WhaleApp extends StatelessWidget {
  const WhaleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whale Tracker',
      home: const WhaleListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

final List<Map<String, String>> whaleTransactions = [
  {
    'from': '0x1b3f8a2c9e8e9b7f5d3c1a2b3c4d5e6f7a8b9c0d',
    'to': '0x742d35cc6634c0532925a3b844bc454e4438f44e',
    'amount': '2,500.0000 ETH',
    'timestamp': '2025-09-04T12:05:12Z',
  },
  {
    'from': '0x28c6c06298d514db089934071355e5743bf21d60',
    'to': '0x6f6d3a8c5b4e7f9a0b1c2d3e4f5a6b7c8d9e0f1a',
    'amount': '25,000,000.00 USDT',
    'timestamp': '2025-09-04T12:02:44Z',
  },
  {
    'from': 'bc1qxyzq9h4v6jz3u4r8p0n3k6t9s2wy8j3p4m5q2r',
    'to': 'bc1q6h8k9l0m1n2p3q4r5s6t7u8v9w0x1y2z3a4b5c',
    'amount': '500.0 BTC',
    'timestamp': '2025-09-04T12:00:29Z',
  },
  {
    'from': '0x00000000219ab540356cBB839Cbe05303d7705Fa',
    'to': '0x3f5CE5FBFe3E9af3971dD833D26BA9b5C936f0bE',
    'amount': '1,000.0000 ETH',
    'timestamp': '2025-09-04T11:58:10Z',
  },
  {
    'from': '0x469eda64aed3a3ad6f868c6649f1a3790cf57208',
    'to': '0x21a31ee1afc51d94c2efccaa2092ad1028285549',
    'amount': '12,000,000.00 ARB',
    'timestamp': '2025-09-04T11:55:02Z',
  },
  {
    'from': '5F7k6y8mQpV3a1x2c4r6t7y8u9i0o1p2q3r4s5t6u7v',
    'to': '4Nd1b5X2Y7sP8o3k6L9m0n1B2v3C4x5Z6Q7w8e9r0t',
    'amount': '300,000.0 SOL',
    'timestamp': '2025-09-04T11:51:18Z',
  },
  {
    'from': '0x5abfec25f74cd88437631a7731906932776356f9',
    'to': '0x7F19720A857F834887FC9A7bC0a0fBe7FcB9d96F',
    'amount': '200.0000 ETH',
    'timestamp': '2025-09-04T11:49:20Z',
  },
  {
    'from': '0x564286362092D8e7936f0549571a803B203aAceD',
    'to': '0x4e83362442b8d1bec281594cea3050c8eb01311c',
    'amount': '50,000,000.00 USDC',
    'timestamp': '2025-09-04T11:46:03Z',
  },
  {
    'from': '0x7Be8076f4EA4A4AD08075C2508e481d6C946D12b',
    'to': '0x21a31ee1afc51d94c2efccaa2092ad1028285549',
    'amount': '3,000.0000 WETH',
    'timestamp': '2025-09-04T11:42:57Z',
  },
  {
    'from': '0x1cf0e3e8b2b9a5b362315a4f7c9d3a6b8f4e5d7c',
    'to': '0x5dB3C1bE5f2d7cE8aA2E41a2eB5C9C2a47a0eF4d',
    'amount': '8,500,000.00 ARB',
    'timestamp': '2025-09-04T11:40:11Z',
  },
];

class WhaleListPage extends StatelessWidget {
  const WhaleListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Whale Tracking'),
      ),
      body: ListView.builder(
        itemCount: whaleTransactions.length,
        itemBuilder: (context, index) {
          final tx = whaleTransactions[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tx['amount'] ?? '',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'From: ${tx['from']}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'To:   ${tx['to']}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Time: ${tx['timestamp']}',
                    style: const TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}