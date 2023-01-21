import 'package:flutter/material.dart';
//import 'package:clima/utilities/constants.dart';
import 'Search_location.dart';
import 'Network.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen(@required this.weatherdata);
  final weatherdata;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}


class _LocationScreenState extends State<LocationScreen> {
  late String cityname;
  var weatherdis;
  var temperature;
  var newname;

  @override
  void initState() {
    getdata(widget.weatherdata);
    super.initState();
  }
  void getdata(dynamic finaldata) {
    setState(() {
      cityname = finaldata['location']['name'];
      weatherdis = finaldata['current']['condition']['text'];
      temperature = finaldata['current']['temp_c'];
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(onTap: () async {
            newname= await Navigator.push(context, MaterialPageRoute(builder: (context)=>Search_location()));

            if(newname!=null){
              Network network=await Network('http://api.weatherapi.com/v1/current.json?key=ff200d03083c4e7891263736231801&q=$newname');
              var newdata=await network.getData();
              getdata(newdata);
            }

          },child: Icon(Icons.location_city_outlined,size: 50.0,)),
          Container(
            width: double.infinity,
            height: 250,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  <Widget>[
                Text(
                  'City Name: $cityname',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'How is the weather: $weatherdis',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Temperature: $temperature',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}