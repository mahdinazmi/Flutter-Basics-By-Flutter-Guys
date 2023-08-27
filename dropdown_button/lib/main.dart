import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
  
void main() {
  runApp(const MyApp());
}
  
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return const MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
  
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  
  @override
  _HomeState createState() => _HomeState();
}
  
class _HomeState extends State < Home > {

  String _dropdownValue = '1';

  var _items = [
    '1',
    '2',
    '3',
    '4',
    '5'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 150,
          height: 80,
          decoration: BoxDecoration(
            color: Color(0xffEBEDFE),
            borderRadius: BorderRadius.circular(10)
          ),
          child: Center(
            child: DropdownButton(
              items: _items.map((String item){
                return DropdownMenuItem(
                  value: item,
                  child: Text(item)
                );
              }).toList(),
              onChanged: (String? newValue){
                setState(() {
                  _dropdownValue = newValue!;
                });
              },
              value: _dropdownValue,
              borderRadius: BorderRadius.circular(10),
              icon: const Icon(Icons.keyboard_arrow_down),
              iconSize: 50,
              style: TextStyle(
                fontSize: 30,
                color: Colors.black
              ),
              underline: Container(), 
            ),
          ),
        ),
      )
    );
  }
}