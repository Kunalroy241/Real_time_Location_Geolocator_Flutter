import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hackosmart/schoolRegion.dart';

import 'DiversionPage.dart';
import 'freezonePage.dart';
import 'hospitalPage.dart';
import 'locationScreen.dart';
class ManualPage extends StatefulWidget {
  const ManualPage({Key? key}) : super(key: key);

  @override
  State<ManualPage> createState() => _ManualPageState();
}

class _ManualPageState extends State<ManualPage> {
  var globaltag;
  DatabaseReference? _ref;
  @override
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance.reference();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _ref?.update({
                  "GlobalTag": 'S'

                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (Context) => schoolRegion()));
              }, child: Text("School"
            ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _ref?.update({
                  "GlobalTag": 'H'

                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (Context) => hospitalRegion()));
              }, child: Text("Hospital"
            ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _ref?.update({
                  "GlobalTag": 'F'

                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (Context) => freezone()));
              }, child: Text("Free zone"
            ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _ref?.update({
                  "GlobalTag": 'D'

                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (Context) => diversionPage()));
              }, child: Text("Diversion"
            ),
            ),
          ],
        ),
      ),
    );
  }
}

