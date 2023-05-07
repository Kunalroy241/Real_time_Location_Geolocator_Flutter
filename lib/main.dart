import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'homepage.dart';


import 'package:firebase_database/firebase_database.dart';
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp firebaseApp=await Firebase.initializeApp();


  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homePage(),
    );
  }
}

