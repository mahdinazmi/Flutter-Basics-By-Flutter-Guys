import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("FlutterGuys"),
      ),
      body: listViewEx6(),
    );
  }

  Widget listViewEx1(){
    return Center(
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.green[600],
            child: const Center(child: Text('First container')),
          ),
          Container(
            height: 50,
            color: Colors.green[500],
            child: const Center(child: Text('Second container')),
          ),
          Container(
            height: 50,
            color: Colors.green[100],
            child: const Center(child: Text('Third container')),
          ),
        ],
      ),
    );
  }

  Widget listViewEx2(){
    return Center(
      child: ListView(
        padding: const EdgeInsets.all(8),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.grey[600],
            child: const Center(child: Text('First container')),
          ),
          const SizedBox(width: 5,), // space between each container
          Container(
            height: 50,
            color: Colors.green[500],
            child: const Center(child: Text('Second container')),
          ),
          const SizedBox(width: 5,), // space between each container
          Container(
            height: 50,
            color: Colors.grey[300],
            child: const Center(child: Text('Third container')),
          ),
          const SizedBox(width: 5,), // space between each container
          Container(
            height: 50,
            color: Colors.green[100],
            child: const Center(child: Text('Four container')),
          ),
        ],
      ),
    );
  }

  Widget listViewEx3(){
    return Center(
      child: ListView(
        padding: const EdgeInsets.all(8),
        reverse: true,
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.grey[600],
            child: const Center(child: Text('First container')),
          ),
          const SizedBox(width: 5,), // space between each container
          Container(
            height: 50,
            color: Colors.green[500],
            child: const Center(child: Text('Second container')),
          ),
          const SizedBox(width: 5,), // space between each container
          Container(
            height: 50,
            color: Colors.grey[300],
            child: const Center(child: Text('Third container')),
          ),
          const SizedBox(width: 5,), // space between each container
          Container(
            height: 50,
            color: Colors.green[100],
            child: const Center(child: Text('Four container')),
          ),
        ],
      ),
    );
  }

  Widget listViewEx4(){
    return Center(
      child: ListView(
        padding: const EdgeInsets.all(8),
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.grey[600],
            child: const Center(child: Text('First container')),
          ),
          const SizedBox(width: 5,), // space between each container
          Container(
            height: 50,
            color: Colors.green[500],
            child: const Center(child: Text('Second container')),
          ),
          const SizedBox(width: 5,), // space between each container
          Container(
            height: 50,
            color: Colors.grey[300],
            child: const Center(child: Text('Third container')),
          ),
          const SizedBox(width: 5,), // space between each container
          Container(
            height: 50,
            color: Colors.green[100],
            child: const Center(child: Text('Four container')),
          ),
        ],
      ),
    );
  }

  Widget listViewEx5(){
    List items = ["One","Two","Three","Four","Five","Six","Seven","Height","Nine","Ten"];

    return Center(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (_, index) {
          return ListTile(
            title: Text(items[index]),
          );
        },
      ),
    );
  }

  Widget listViewEx6(){
    List items = ["One","Two","Three","Four","Five","Six","Seven","Height","Nine","Ten"];

    return Center(
      child: ListView.separated(
        itemCount: items.length,
        itemBuilder: (_, index) {
          return ListTile(
            title: Text(items[index]),
          );
        },
        separatorBuilder: (_,index)=> Divider(),
      ),
    );
  }
}
