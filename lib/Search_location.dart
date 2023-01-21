import 'package:flutter/material.dart';

class Search_location extends StatefulWidget {
  const Search_location({Key? key}) : super(key: key);

  @override
  State<Search_location> createState() => _Search_locationState();
}

class _Search_locationState extends State<Search_location> {
  late String cityname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                Navigator.pop(context,cityname);

              });
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value){
                cityname=value;

              },
              decoration: InputDecoration(
                hintText: 'Enter the location',
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)))
              ),
            ),
          ),

        ],
      ),

    );
  }
}
