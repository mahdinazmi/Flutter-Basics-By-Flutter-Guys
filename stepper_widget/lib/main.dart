import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home()
    );
  }
}

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentStep = 0;

  List<Step> stepList() => [
    Step(
     title: const Text('Account'),
     isActive: _currentStep >= 0,
     state: _currentStep <= 0 ? StepState.editing : StepState.complete,
     content: Column(
      children: const [
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Email',
          ),
        ),
        SizedBox(
          height: 8,
        ),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
          ),
        ),
      ],
     ),
    ),
    Step(
      title: const Text('Address'),
      isActive: _currentStep >= 1,
      state: _currentStep <= 1 ? StepState.editing : StepState.complete,
      content: Column(
      children: const [
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Address',
          ),
        ),
        SizedBox(
          height: 8,
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Pin Code',
          ),
        ),
      ],
     ),
    ),
    Step(
      title: const Text('Confirm'),
      isActive: _currentStep >= 2,
      state: StepState.complete,
      content: const Center(child: Text('Confirm'),)
    )
  ];
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1D1E22),
        title: const Text('Stepper'),
        centerTitle: true,
      ),
      body: Stepper(
        steps: stepList(),
        type: StepperType.horizontal,
        elevation: 0,
        currentStep: _currentStep,
        onStepContinue: (){
          if( _currentStep < (stepList().length - 1) ) {
            setState(() {
              _currentStep += 1;
            });
          }
        },
        onStepCancel: () {
          if( _currentStep > 0) {
            setState(() {
              _currentStep -= 1;
            });
          }
        },
      ),
    );
  }
}
