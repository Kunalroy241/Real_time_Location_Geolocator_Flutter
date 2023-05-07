import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
class diversionPage extends StatefulWidget {
  const diversionPage({Key? key}) : super(key: key);

  @override
  State<diversionPage> createState() => _diversionPageState();
}

class _diversionPageState extends State<diversionPage> {
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
                _ref?.child("Diversion").set({
                  "Speed":15,
                  "Tag":'D',
                  "Score":0,

                });
              }, child: Text("Speed"
            ),
            ),
            SizedBox(height:10),
            ElevatedButton(
              onPressed: (){
                _ref?.child("Diversion").set({
                  "Speed":50,
                  "Tag":'D',
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
