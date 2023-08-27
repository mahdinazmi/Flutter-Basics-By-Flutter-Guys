import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
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
   
   File ? _selectedImgae;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1D1E22),
        title: const Text('Image Picker'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
             MaterialButton(
                 color: Colors.blue,
                 child: const Text(
                     "Pick Image from Gallery",
                     style: TextStyle(
                       color: Colors.white, 
                       fontWeight: FontWeight.bold,
                       fontSize: 16
                     )
                   ),
                   onPressed: () {
                    _pickImageFromGallery();
                   }
               ),
               MaterialButton(
                 color: Colors.red,
                 child: const Text(
                     "Pick Image from Camera",
                     style: TextStyle(
                       color: Colors.white, 
                       fontWeight: FontWeight.bold,
                       fontSize: 16
                     )
                   ),
                   onPressed: () {
                    _pickImageFromCamera();
                   }
               ),
               const SizedBox(height: 20,),
               _selectedImgae != null ? Image.file(_selectedImgae!) : const Text("Please selected an image")
          ],
        ),
      ),
    );
  }

  Future _pickImageFromGallery() async {
   final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
   
   if(returnedImage == null) return;
   setState(() {
     _selectedImgae = File(returnedImage.path);
   });
  }

  Future _pickImageFromCamera() async {
   final returnedImage = await ImagePicker().pickImage(source: ImageSource.camera);
   
   if(returnedImage == null) return;
   setState(() {
     _selectedImgae = File(returnedImage.path);
   });
  }
}