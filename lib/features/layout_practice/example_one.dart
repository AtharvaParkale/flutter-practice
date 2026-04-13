import 'package:flutter/material.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              Container(width: 50, height: 50, color: Colors.red),

              Expanded(child: Container(height: 50, color: Colors.green)),

              Container(width: 50, height: 50, color: Colors.blue),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Flexible(
                child: Container(color: Colors.green, child: Text("Short")),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(color: Colors.red, height: 50),
              ),
              Expanded(
                flex: 2,
                child: Container(color: Colors.green, height: 50),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(child: Container(color: Colors.red, height: 50)),
              Flexible(
                child: Container(color: Colors.green, height: 50, width: 50),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
