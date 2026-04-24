import 'package:flutter/material.dart';

class PollingPage extends StatefulWidget {
  @override
  State<PollingPage> createState() => _PollingPageState();
}

class _PollingPageState extends State<PollingPage> {
  Map<String, int> votes = {
    "Badminton": 0,
    "Catur": 0,
    "Padel": 0,
    "Basket": 0,
    "Lari Marathon": 0,
  };

  bool voted = false;

  void vote(String key) {
    setState(() {
      votes[key] = votes[key]! + 1;
      voted = true;
    });
  }

  int total() => votes.values.fold(0, (a, b) => a + b);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Polling Hobby")),
      body: Column(
        children: votes.keys.map((e) {
          return ListTile(
            title: Text(e),
            trailing: voted
                ? Text("${((votes[e]! / total()) * 100).toStringAsFixed(1)}%")
                : null,
            onTap: voted ? null : () => vote(e),
          );
        }).toList(),
      ),
    );
  }
}
