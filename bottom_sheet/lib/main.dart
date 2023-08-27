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

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () {
             _displayBottomSheet(context);
          },
          height: 50,
          minWidth: 200,
          color: const Color(0xff1D1E22),
          child: const Text(
           'OPEN',
           style: TextStyle(
            color: Colors.white
           ),
          ),
        ),
      ),
    );
  }
  

  Future _displayBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      barrierColor: Colors.black87.withOpacity(0.5),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      builder: (context) => const SizedBox(
        height: 200,
        child: Center(
          child: Text(
            'FLUTTER GUYS',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25
            ),
          ),
        ),
      )
    );
  }
  
}