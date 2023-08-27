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
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  List<String> items = [
    "Dart",
    "Kotlin",
    "Java",
    "Swift",
    "Python",
    "Go",
    "Java Script",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1D1E22),
        centerTitle: true,
        title: const Text("Dismissible"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context,index) {
          return Dismissible(
           onDismissed: (direction) {
             setState(() {
               items.removeAt(index);
             });
           },
           confirmDismiss: (DismissDirection direction) async {
              if (direction == DismissDirection.startToEnd) {
              return await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Delete"),
                      content: const Text(
                          "Are you sure you want to delete this cart ?"
                        ),
                        actions: < Widget > [
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: const Text("Yes")
                          ),
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text("No"),
                          ),
                       ],
                  );
                },
              );
            } else {
              return await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Save"),
                      content: const Text(
                          "Are you sure you want to save this cart ?"
                        ),
                        actions: < Widget > [
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: const Text("Yes")
                          ),
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text("No"),
                          ),
                       ],
                  );
                },
              );
            }
          },
           background: Container(
            height: 50,
            color: Colors.red,
            margin: const EdgeInsets.only(top: 10),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Delete',
                textAlign: TextAlign.left,
              ),
            ),
           ) , 
           secondaryBackground:Container(
            height: 50,
            color: Colors.blue,
            margin: const EdgeInsets.only(top: 10),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Save',
                textAlign: TextAlign.right,
              ),
            ),
           ) , 
           key: ValueKey<String>(items[index]),
           child: Container(
            color: const Color(0xffEBEDFE),
            margin: const EdgeInsets.only(top: 10),
            height: 50,
            child: Center(
              child: Text(
                items[index]
              ),
            ),
           )
          );
        },
      ),
    );
  }
}
