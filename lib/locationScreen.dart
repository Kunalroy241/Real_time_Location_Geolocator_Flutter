import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:collection/collection.dart';
import 'package:http/http.dart' as http;

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Position? _position;

  var score=0;
  List<List<double>> location=[
    [0,1],
  ];
  DatabaseReference? _ref;
  String database = "";
  int c=0;


  @override
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance.reference();
    _getCurrentLocation();

  }

  void _getCurrentLocation() async {
    final GeolocatorPlatform geolocator = GeolocatorPlatform.instance;
    await geolocator.checkPermission().then((value) async {
      if (value == LocationPermission.always ||
          value == LocationPermission.whileInUse) {
        geolocator
            .getPositionStream(
          desiredAccuracy: LocationAccuracy.high,
          distanceFilter:10,
        )
            .listen((Position position) {
          setState(() {
            _position = position;
            getscore(position);
          });
        });

      } else {
        await geolocator.requestPermission().then((value) async {
          if (value == LocationPermission.always ||
              value == LocationPermission.whileInUse) {
            _getCurrentLocation();

          }
        });
      }
    });

  }
  void getscore(Position position) {
    List<double> targetlocation=
    [0,1];

    bool isPresent = location.map((row) => ListEquality().equals(row, targetlocation)).contains(true);
    if(isPresent)
    {
      if(position.speed>100) {
        score -= 5;
        c++;
      }

    }


    print(score);

    sendTofirebase(score.toString());
  }
  void sendToThingSpeak(String apiKey, int value) async {
    var url = Uri.parse(
        'https://api.thingspeak.com/update.json');
    var response = await http.post(url, body: {
      'api_key': apiKey,
      'field1': value.toString(),
    });
  }
  void sendTofirebase(String score) {
    _ref?.set({
      'Score': score,
      'Name':'Kunal',
      'Driving Liscence':'12345678',
      'Instances':c,
      'latitude':_position!.latitude,
      'longitude':_position!.longitude
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('DriveScore'),
      ),
      body: Center(
        child: _position != null
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            Text(


              'Latitude: ${_position?.latitude}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Longitude: ${_position?.longitude}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Altitude: ${_position?.altitude}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Accuracy: ${_position?.accuracy}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Speed: ${_position?.speed}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Score: ${score}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        )
            : CircularProgressIndicator(),
      ),
    );
  }
}


