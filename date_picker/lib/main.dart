import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home()
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State < Home > {

  TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: TextField(
            controller: _dateController,
            decoration: const InputDecoration(
              labelText: 'DATE',
              filled: true,
              prefixIcon: Icon(Icons.calendar_today),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue)
              ),
            ),
            readOnly: true,
            onTap: (){
              _selectDate();
            },
          ),
        )
      )
    );
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000), 
      lastDate: DateTime(2100)
    );

    if (_picked != null){
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }
}