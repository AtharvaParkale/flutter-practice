import 'package:flutter/material.dart';

class ImplicitAnimationsScreen extends StatefulWidget {
  const ImplicitAnimationsScreen({super.key});

  @override
  State<ImplicitAnimationsScreen> createState() =>
      _ImplicitAnimationsScreenState();
}

class _ImplicitAnimationsScreenState extends State<ImplicitAnimationsScreen> {
  double height = 100;
  double width = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                curve: Curves.linear,
                color: Colors.red,
                duration: Duration(milliseconds: 3000),
                width: height,
                height: width,
              ),
              SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    width = width + 100;
                    height = height + 100;
                  });
                },
                child: Text("Click"),
              ),

              TweenAnimationBuilder(
                tween: Tween(begin: 0.0, end: 200.0),
                duration: Duration(seconds: 3),
                builder: (context, object, widget) {
                  return Container(
                    color: Colors.blue,
                    width: object,
                    height: object,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
