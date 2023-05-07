import 'package:flutter/material.dart';
import 'package:hackosmart/manualPage.dart';
import 'locationScreen.dart';
class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (Context) => LocationScreen()));
              }, child: Text("Automated"
            ),
            ),
            SizedBox(height:10),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (Context) => ManualPage()));
              }, child: Text("Manual"
            ),
            ),
          ],
        ),

      ),
    );
  }
}

