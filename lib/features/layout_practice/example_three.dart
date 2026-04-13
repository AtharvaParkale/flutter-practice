// Practice SingleChildScrollView/ ListView/ GridView/

import 'package:flutter/material.dart';

class ExampleThree extends StatelessWidget {
  ExampleThree({super.key});

  final List<String> fruits = [
    "mango",
    "apple",
    "banana",
    "orange",
    "grapes",
    "pineapple",
    "watermelon",
    "papaya",
    "kiwi",
    "strawberry",
  ];

  final List<String> vehicles = [
    "car",
    "bike",
    "bus",
    "train",
    "truck",
    "scooter",
    "bicycle",
    "auto",
    "van",
    "metro",
  ];

  final List<String> cities = [
    "Mumbai",
    "Delhi",
    "Bangalore",
    "Hyderabad",
    "Chennai",
    "Pune",
    "Kolkata",
    "Ahmedabad",
    "Jaipur",
    "Lucknow",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Layout")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: fruits.length,
                itemBuilder: (context, count) {
                  return Text(fruits[count]);
                },
              ),
            ),

            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: vehicles.length,
                itemBuilder: (context, count) {
                  return Text(fruits[count]);
                },
              ),
            ),

            SizedBox(
              height: 500,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: cities.length,
                itemBuilder: (context, count) {
                  return Text(cities[count]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
