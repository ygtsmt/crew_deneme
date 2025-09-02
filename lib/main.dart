import 'package:flutter/material.dart';

void main() {
  runApp(ValorantAgentsApp());
}

class ValorantAgentsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Valorant Agents',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ValorantAgentsScreen(),
    );
  }
}

class ValorantAgentsScreen extends StatelessWidget {
  final Map<String, List<Map<String, dynamic>>> agents = {
    'Initiators': [
      {
        'uuid': 'e370fa57-4757-3604-3648-499e1f642d3f',
        'name': 'Gekko',
        'description': 'Leads a crew of creatures to scatter enemies.',
        'icon': 'https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/displayicon.png',
        'abilities': [
          {
            'name': 'Wingman',
            'description': 'Send Wingman to seek enemies and defuse/plant Spike.',
            'icon': 'https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/abilities/ability1/displayicon.png'
          },
          {
            'name': 'Dizzy',
            'description': 'Send Dizzy to blind enemies in line of sight.',
            'icon': 'https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/abilities/ability2/displayicon.png'
          },
          {
            'name': 'Mosh Pit',
            'description': 'Throw Mosh to create a damaging area.',
            'icon': 'https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/abilities/grenade/displayicon.png'
          },
          {
            'name': 'Thrash',
            'description': 'Control Thrash to detain enemies.',
            'icon': 'https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/abilities/ultimate/displayicon.png'
          }
        ]
      },
      // Add other agents here
    ],
    'Sentinels': [],
    'Controllers': [],
    'Duelists': []
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Valorant Agents'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: agents.entries.map((entry) {
          String role = entry.key;
          List<Map<String, dynamic>> agentsList = entry.value;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  role,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              ...agentsList.map((agent) {
                return Card(
                  child: ListTile(
                    leading: Image.network(agent['icon']),
                    title: Text(agent['name']),
                    subtitle: Text(agent['description']),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(agent['name']),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: agent['abilities'].map<Widget>((ability) {
                                return ListTile(
                                  leading: Image.network(ability['icon']),
                                  title: Text(ability['name']),
                                  subtitle: Text(ability['description']),
                                );
                              }).toList(),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                );
              }).toList(),
            ],
          );
        }).toList(),
      ),
    );
  }
}