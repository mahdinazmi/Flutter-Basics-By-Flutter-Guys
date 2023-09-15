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
        title: Text("Flutter Guys"),
      ),
      body: Column(
        children: [
          Expanded(child: stories(),),
          Expanded(child: feedWithBuilder(), flex: 4,),
        ],
      ),
    );
  }

  Widget feed(){
    return Center(
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150,
              color: Colors.green[600],
              child: const Center(child: Text('First container')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150,
              color: Colors.green[500],
              child: const Center(child: Text('Second container')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150,
              color: Colors.green[100],
              child: const Center(child: Text('Third container')),
            ),
          ),
        ],
      ),
    );
  }

  Widget stories(){
    return SizedBox(
      height: 150,
      child: ListView(
        padding: const EdgeInsets.all(8),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 120,
              decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: BorderRadius.circular(100)
              ),
              child: const Center(child: Icon(Icons.person,size: 40,)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 120,
              decoration: BoxDecoration(
                  color: Colors.green[500],
                  borderRadius: BorderRadius.circular(100)
              ),
              child: const Center(child: Icon(Icons.car_crash,size: 40,)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 120,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(100)
              ),
              child: const Center(child: Icon(Icons.home,size: 40,)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 120,
              decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(100)
              ),
              child: const Center(child: Icon(Icons.girl,size: 40,)),
            ),
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

  Widget feedWithBuilder(){
    List items = ["One","Two","Three","Four","Five","Six","Seven","Height","Nine","Ten"];

    return Center(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150,
              color: Colors.green[500],
              child: Center(child: Text(items[index])),
            ),
          );
        },
      ),
    );
  }

  Widget feedWithElevator(){
    List items = ["One","Two","Three","Four","Five","Six","Seven","Height","Nine","Ten"];

    return Center(
      child: ListView.separated(
        itemCount: items.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150,
              color: Colors.green[500],
              child: Center(child: Text(items[index])),
            ),
          );
        },
        separatorBuilder: (_,index)=> Icon(Icons.arrow_drop_down,),
      ),
    );
  }
}
