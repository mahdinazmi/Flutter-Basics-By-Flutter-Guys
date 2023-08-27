import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({ Key ? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff1D1E22),
          title: const Text('FLUTTER GUYS'),
          bottom: TabBar(
            tabs: [
              Row(children: const [Icon(Icons.directions_car), SizedBox(width: 5), Text("Car")]),
              Row(children: const [Icon(Icons.directions_transit), SizedBox(width: 5), Text("Transit")]),
              Row(children: const [Icon(Icons.directions_bike), SizedBox(width: 5), Text("Bike")]),
              Row(children: const [Icon(Icons.directions_boat), SizedBox(width: 5), Text("Boat")]),
              Row(children: const [Icon(Icons.directions_railway), SizedBox(width: 5), Text("Railway")]),
              Row(children: const [Icon(Icons.directions_bus), SizedBox(width: 5), Text("Bus")]),
            ],
            isScrollable: true,
            
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text("Car")),
            Center(child: Text("Transit")),
            Center(child: Text("Bike")),
            Center(child: Text("Boat")),
            Center(child: Text("Railway")),
            Center(child: Text("Bus"))
          ],
        ),
      )
    );
  }
}