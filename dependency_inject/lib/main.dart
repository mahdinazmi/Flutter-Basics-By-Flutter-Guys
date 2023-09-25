import 'package:dependency_inject/dep_inj.dart';
import 'package:flutter/material.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Guys',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void showSnackBar(String value){
      SnackBar snackBar = SnackBar(
        content: Text(value),
        duration: Duration(milliseconds: 500),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Guys', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        elevation: 1,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Welcome to our DI tutorial'),
          ),
          OutlinedButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
            onPressed: () {
              final currentDate = getIt<AppService>().execute();
              showSnackBar(currentDate);
            },
            child: const Text('Get Date'),
          ),
          OutlinedButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsPage()),
              );
            },
            child: const Text('Details page'),
          ),
        ],
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  DetailsPage({Key? key}) : super(key: key);

  final appService = getIt<AppService>();

  @override
  Widget build(BuildContext context) {

    void showSnackBar(String value){
      SnackBar snackBar = SnackBar(
        content: Text(value),
        duration: Duration(milliseconds: 500),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Page', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.grey[500],
        elevation: 1,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Welcome to our DI tutorial'),
          ),
          OutlinedButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
            onPressed: () {
              final currentDate = appService.execute();
              showSnackBar(currentDate);
            },
            child: const Text('Get Date'),
          ),
        ],
      ),
    );
  }
}