import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:climate_app/Network.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Location_screen extends StatefulWidget {
   Location_screen({Key? key}) : super(key: key);
  @override
  State<Location_screen> createState() => _Location_screenState();
}
class _Location_screenState extends State<Location_screen> {
  var longitude;
  var latitude;
  var long;
  var lat;
  @override
  void initState() {
    getLocation();
    super.initState();
  }
  @override
  Future<void> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    longitude=position.longitude;
    latitude=position.latitude;
    long=double.parse(longitude.toStringAsFixed(4));
    lat=double.parse(latitude.toStringAsFixed(4));
    Network network=Network('http://api.weatherapi.com/v1/current.json?key=ff200d03083c4e7891263736231801&q=$lat,$long');
    var data= await network.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationScreen(data)));
  }
  @override
  Widget build(BuildContext context) {

    return  const Scaffold(
        body: SpinKitDoubleBounce(
          color: Colors.pink,
        )
    );
  }
}
