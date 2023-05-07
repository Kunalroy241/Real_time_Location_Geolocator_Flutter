import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
class hospitalRegion extends StatefulWidget {
  const hospitalRegion({Key? key}) : super(key: key);

  @override
  State<hospitalRegion> createState() => _hospitalRegionState();
}

class _hospitalRegionState extends State<hospitalRegion> {
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
                _ref?.child("Hospital").set({
                  "Speed":30 ,
                  "Tag":'H',
                  "Score":0,

                });
              }, child: Text("Speed"
            ),
            ),
            SizedBox(height:10),
            ElevatedButton(
              onPressed: (){
                _ref?.child("Hospital").set({
                  "Speed": 50,
                  "Tag":'H',
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
