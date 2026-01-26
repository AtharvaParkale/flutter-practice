import 'dart:async';

import 'package:flutter/material.dart';

class SimpleTicker extends StatefulWidget {
  const SimpleTicker({super.key});

  @override
  State<SimpleTicker> createState() => _SimpleTickerState();
}

class _SimpleTickerState extends State<SimpleTicker> {
  int seconds = 0;
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        seconds++;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('Seconds: $seconds'));
  }
}
