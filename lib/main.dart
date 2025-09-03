import 'dart:convert';
import 'package:flutter/material.dart';

// Simple, clean Whale Tracker app
// Displays fffwhale addresses, amounts, and timestamps in a basic ListView with Card widgets.

const String whaleJson = '''
{
  "status": "success",
  "data": [
    {
      "tx_hash": "0x9b3a0f2d5c1e478a6e3c2e0d9b4f7a3c7f8d1e2a3b4c5d6e7f8a9b0c1d2e3f4a",
      "chain": "ethereum",
      "timestamp": "2025-09-02T12:41:23Z",
      "block_number": 20634912,
      "from_address": "0x5a52e96bacdabb82fd05763e25335261b270efcb",
      "to_address": "0x1111111254eeb25477b68fb85ed929f73a960582",
      "whale_address": "0x5a52e96bacdabb82fd05763e25335261b270efcb",
      "whale_label": "Jump Trading",
      "direction": "outflow",
      "asset": "denemeeth",
      "amount": "12000.0",
      "amount_usd": 41280000.0,
      "tx_type": "swap",
      "details": {
        "protocol": "1inch",
        "route": [
          {"token_in": "ffff", "token_out": "USDC", "amount_in": "12000.0", "amount_out": "41,340,000.0"}
        ],
        "gas_used": 182345,
        "gas_price_gwei": 12.4
      }
    },
    {
      "tx_hash": "0x7f1d2a9c38f4b0d9e6c3a5b7c9d2e1f0a3b4c5d6e7f8a9b0c1d2e3f49a8b7c6d",
      "chain": "ethereum",
      "timestamp": "2025-09-02T12:37:02Z",
      "block_number": 20634901,
      "from_address": "0xf977814e90da44bfa03b6295a0616a897441acec",
      "to_address": "0x8c5fecdC472E27Bc447696F431E425D02dd46a8c",
      "whale_address": "0xf977814e90da44bfa03b6295a0616a897441acec",
      "whale_label": "Binance 8",
      "direction": "outflow",
      "asset": "USDT",
      "amount": "250000000.0",
      "amount_usd": 250000000.0,
      "tx_type": "transfer",
      "details": {
        "to_label": "Binance Cold Wallet",
        "memo": null,
        "gas_used": 52000,
        "gas_price_gwei": 11.1
      }
    },
    {
      "tx_hash": "0x0ab4f0c1d2e3f49a8b7c6d7e8f9a0b1c2d3e4f5a6b7c8d9e0f1a2b3c4d5e6f70",
      "chain": "ethereum",
      "timestamp": "2025-09-02T12:29:55Z",
      "block_number": 20634873,
      "from_address": "0x742d35cc6634c0532925a3b844bc454e4438f44e",
      "to_address": "0x4e83362442b8d1bec281594cea3050c8eb01311c",
      "whale_address": "0x742d35cc6634c0532925a3b844bc454e4438f44e",
      "whale_label": "Bitfinex",
      "direction": "outflow",
      "asset": "BTCB",
      "amount": "10000.0",
      "amount_usd": 620000000.0,
      "tx_type": "bridge",
      "details": {
        "bridge": "Wormhole",
        "from_chain": "Ethereum",
        "to_chain": "Solana",
        "gas_used": 298765,
        "gas_price_gwei": 13.0
      }
    },
    {
      "tx_hash": "0x6b4e3d2c1a0f9e8d7c6b5a4f3e2d1c0b9a8f7e6d5c4b3a2f1e0d9c8b7a6f5e4d",
      "chain": "arbitrum",
      "timestamp": "2025-09-02T12:20:11Z",
      "block_number": 279456123,
      "from_address": "0x1a2b3c4d5e6f7081928374655647382910abcDEF",
      "to_address": "0x28c6c06298d514db089934071355e5743bf21d60",
      "whale_address": "0x28c6c06298d514db089934071355e5743bf21d60",
      "whale_label": "Binance 14",
      "direction": "inflow",
      "asset": "ETH",
      "amount": "8500.0",
      "amount_usd": 29210000.0,
      "tx_type": "bridge_in",
      "details": {
        "bridge": "Arbitrum One",
        "from_chain": "Ethereum",
        "gas_used": 45123,
        "gas_price_gwei": 0.22
      }
    },
    {
      "tx_hash": "0xa1b2c3d4e5f60718293a4b5c6d7e8f9a0b1c2d3e4f5a6b7c8d9e0f1a2b3c4d5e",
      "chain": "ethereum",
      "timestamp": "2025-09-02T12:16:38Z",
      "block_number": 20634829,
      "from_address": "0x00000000219ab540356cBB839Cbe05303d7705Fa",
      "to_address": "0x742d35cc6634c0532925a3b844bc454e4438f44e",
      "whale_address": "0x742d35cc6634c0532925a3b844bc454e4438f44e",
      "whale_label": "Bitfinex",
      "direction": "inflow",
      "asset": "ETH",
      "amount": "30000.0",
      "amount_usd": 103200000.0,
      "tx_type": "transfer",
      "details": {
        "from_label": "Kraken",
        "gas_used": 21000,
        "gas_price_gwei": 13.2
      }
    },
    {
      "tx_hash": "0xd3e4f5a6b7c8d9e0f1a2b3c4d5e6f7081928374655647382910abcdef1234567",
      "chain": "tron",
      "timestamp": "2025-09-02T12:15:04Z",
      "block_number": 59871234,
      "from_address": "TN6N14ZCq8tP4cRvaBscbCz8r6bS8tZxC1",
      "to_address": "TYmcNQwZJmWkq9k6Qm3xjC1A3i8BSCUR8p",
      "whale_address": "TN6N14ZCq8tP4cRvaBscbCz8r6bS8tZxC1",
      "whale_label": "Justin Sun",
      "direction": "outflow",
      "asset": "USDT",
      "amount": "500000000.0",
      "amount_usd": 500000000.0,
      "tx_type": "transfer",
      "details": {
        "to_label": "Binance",
        "memo": "",
        "fee_trx": 35.0
      }
    },
    {
      "tx_hash": "0x4d3c2b1a0f9e8d7c6b5a4f3e2d1c0b9a8f7e6d5c4b3a2f1e0d9c8b7a6f5e4d3c",
      "chain": "solana",
      "timestamp": "2025-09-02T12:12:29Z",
      "slot": 298765432,
      "from_address": "9xQeWvG816bUx9EPpSo4qYJv3P9K8d2or7xZ5E8Y5aYi",
      "to_address": "HcVw64f8T1wVtQ1cUQc1G1eM5Qr7u7i9Q5Xb7zYy7a4b",
      "whale_address": "HcVw64f8T1wVtQ1cUQc1G1eM5Qr7u7i9Q5Xb7zYy7a4b",
      "whale_label": "Alameda (tagged)",
      "direction": "inflow",
      "asset": "SOL",
      "amount": "750000.0",
      "amount_usd": 105000000.0,
      "tx_type": "stake_deposit",
      "details": {
        "validator": "Marinade",
        "fee_lamports": 5000
      }
    },
    {
      "tx_hash": "0xe1f2a3b4c5d6e7f8a9b0c1d2e3f49a8b7c6d7e8f9a0b1c2d3e4f5a6b7c8d9e0f1",
      "chain": "bsc",
      "timestamp": "2025-09-02T12:08:44Z",
      "block_number": 41876543,
      "from_address": "0x709c3A2f9b5B8eC5A9e3b2F0A8D4c7B3f1E2dC45",
      "to_address": "0x55FE002aefF02F77364de339a1292923A15844B8",
      "whale_address": "0x709c3A2f9b5B8eC5A9e3b2F0A8D4c7B3f1E2dC45",
      "whale_label": "Cumberland",
      "direction": "outflow",
      "asset": "BUSD",
      "amount": "100000000.0",
      "amount_usd": 100000000.0,
      "tx_type": "redeem",
      "details": {
        "protocol": "Paxos",
        "note": "BUSD redemption"
      }
    },
    {
      "tx_hash": "0xabc123def4567890fedcba09876543211234567890abcdefabcdef1234567890",
      "chain": "ethereum",
      "timestamp": "2025-09-02T12:01:15Z",
      "block_number": 20634782,
      "from_address": "0x1d9a6a4e5b8b2d0d1f3e4c5b6a7d8e9f0a1b2c3d",
      "to_address": "0x21a31Ee1afC51d94C2eFcCAa2092aD1028285549",
      "whale_address": "0x21a31Ee1afC51d94C2eFcCAa2092aD1028285549",
      "whale_label": "Wintermute",
      "direction": "inflow",
      "asset": "USDC",
      "amount": "200000000.0",
      "amount_usd": 200000000.0,
      "tx_type": "transfer",
      "details": {
        "from_label": "Circle Treasury",
        "gas_used": 52000,
        "gas_price_gwei": 12.0
      }
    },
    {
      "tx_hash": "0xfedcba0987654321abcdefabcdef1234567890abcdef1234567890abcdefabcd",
      "chain": "ethereum",
      "timestamp": "2025-09-02T11:55:33Z",
      "block_number": 20634755,
      "from_address": "0x564286362092D8e7936f0549571a803B203aAceD",
      "to_address": "0x3f5CE5FBFe3E9af3971dD833D26BA9b5C936f0bE",
      "whale_address": "0x3f5CE5FBFe3E9af3971dD833D26BA9b5C936f0bE",
      "whale_label": "Binance 1",
      "direction": "inflow",
      "asset": "ETH",
      "amount": "18000.0",
      "amount_usd": 61920000.0,
      "tx_type": "transfer",
      "details": {
        "from_label": "Unknown whale",
        "gas_used": 21000,
        "gas_price_gwei": 11.8
      }
    }
  ],
  "meta": {
    "result_count": 10,
    "generated_at": "2025-09-02T12:42:03Z",
    "filters": {
      "min_usd_value": 5000000,
      "chains": ["ethereum", "bsc", "arbitrum", "tron", "solana"]
    },
    "disclaimer": "This data is aggregated from on-chain sources and labeling heuristics. Labels may be inaccurate. Do not rely solely on this information for investment decisions."
  }
}
''';

final Map<String, dynamic> _parsed =
    jsonDecode(whaleJson) as Map<String, dynamic>;
final List<dynamic> whaleData = (_parsed['data'] ?? []) as List<dynamic>;

void main() {
  runApp(const WhaleTrackerApp());
}

class WhaleTrackerApp extends StatelessWidget {
  const WhaleTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whale Tracker',
      home: const WhaleListPage(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}

class WhaleListPage extends StatelessWidget {
  const WhaleListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Whale Tracker')),
      body: ListView.builder(
        itemCount: whaleData.length,
        itemBuilder: (context, index) {
          final item = whaleData[index] as Map<String, dynamic>;
          final whaleLabel = (item['whale_label'] ?? 'Whale') as String;
          final whaleAddress = (item['whale_address'] ?? '') as String;
          final asset = (item['asset'] ?? '') as String;
          final amount = item['amount']?.toString() ?? '';
          final timestamp = (item['timestamp'] ?? '') as String;

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text('$whaleLabel — $asset'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 4),
                  Text('Address: $whaleAddress'),
                  const SizedBox(height: 4),
                  Text('Amount: $amount $asset'),
                  const SizedBox(height: 4),
                  Text('Time: $timestamp'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
