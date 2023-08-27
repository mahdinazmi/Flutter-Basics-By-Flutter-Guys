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
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home ({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  TimeOfDay _timeOfDay = TimeOfDay.now();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              _timeOfDay.hour.toString().padLeft(2, '0') + ':' + _timeOfDay.minute.toString().padLeft(2, '0'),
              style: const TextStyle(fontSize: 20)
            ),
            const SizedBox(height: 30, ),
            MaterialButton(
              height: 50,
              minWidth: 150,
              color: const Color(0xff1D1E22),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0), ),
              child: const Text('Open Time Picker', style: TextStyle(color: Colors.white), ),
              onPressed: () {
                _selectTime();
              }
            )
          ],
        ),
      ), // Center
    ); // Scaffold
  }

  Future <void> _selectTime() async {
   TimeOfDay ? _picked = await showTimePicker(
      initialTime: _timeOfDay,
      context: context
    );
    
    if(_picked != null){
      setState(() {
        _timeOfDay = _picked;
      });
    }
  }

}
