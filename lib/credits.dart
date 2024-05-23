import 'package:flutter/material.dart';

class Credits extends StatefulWidget {
  const Credits({super.key});

  @override
  State<Credits> createState() => _CreditsState();
}

class _CreditsState extends State<Credits> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Credits'),
      ),
    );
  }
}