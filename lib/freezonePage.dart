import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
class freezone extends StatefulWidget {
  const freezone({Key? key}) : super(key: key);

  @override
  State<freezone> createState() => _freezoneState();
}

class _freezoneState extends State<freezone> {
  DatabaseReference? _ref;
  @override
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance.reference();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(

              onPressed: (){
                _ref?.child("Freezone").set({
                  "Speed":50 ,
                  "Tag":'F',
                  "Score":0
                });
              }, child: Text("Speed"
            ),
            ),
            SizedBox(height:10),
            ElevatedButton(
              onPressed: (){
                _ref?.child("Freezone").set({
                  "Speed":50,
                  "Tag":'F',
                  "Score":-10,

                });
              } ,child: Text("OverSpeed"
            ),
            ),
          ],
        ),
      ) ,
    );;
  }
}
