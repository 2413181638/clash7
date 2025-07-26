import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConfigPage extends StatelessWidget {
  Future<void> _updateConfig(BuildContext context) async {
    final response = await http.put(
      Uri.parse('http://localhost:8000/configs?force=true'),
      headers: {'Content-Type': 'application/json'},
      body: '{"path": "", "payload": ""}',
    );
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Config updated!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${response.body}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Config')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => _updateConfig(context),
              child: Text('Update Config'),
            ),
          ],
        ),
      ),
    );
  }
}
