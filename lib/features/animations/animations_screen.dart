import 'package:flutter/material.dart';

class AnimationsScreen extends StatefulWidget {
  const AnimationsScreen({super.key});

  @override
  State<AnimationsScreen> createState() => _AnimationsScreenState();
}

class _AnimationsScreenState extends State<AnimationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton:FloatingActionButton(onPressed: (){
      Navigator.of(context).pop(7);
    }) ,body: Center(child: Text("Demo")));
  }
}
