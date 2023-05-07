import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
class schoolRegion extends StatefulWidget {
  const schoolRegion({Key? key}) : super(key: key);

  @override

  State<schoolRegion> createState() => _schoolRegionState();
}

class _schoolRegionState extends State<schoolRegion> {
  var speed;

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
               _ref?.child("School").update({
                     "Speed":25,
                     "Tag":'S',
                     "Score": 0,

               });
              }, child: Text("Speed"
            ),
            ),
            SizedBox(height:10),
            ElevatedButton(
              onPressed: (){
              _ref?.child("School").set({
                "Speed":50,
                "Tag":'S',
                "Score":-10

              });
              } ,child: Text("OverSpeed"
            ),
            ),
          ],
        ),
      ) ,
    );
  }
}
