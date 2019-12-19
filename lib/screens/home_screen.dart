import 'package:flutter/material.dart';
import 'package:flutter_travel_ui_starter/widgets/destination_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking

  ];
  Widget buildIcon(int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedIndex = index;
        });
      },
      child :Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: selectedIndex ==index ? Theme.of(context).accentColor : Color(0xFFE7EBEE),
          borderRadius:BorderRadius.circular(30) ,

        ),
        child: Icon(_icons[index],size: 25, color: selectedIndex ==index ?  Theme.of(context).primaryColor: Color(0xFFB4C1C4),),
      ),
      );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30),
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left: 20,right: 120),
            child :Text('What would you like to find?',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
                ),
               )
              ),
              SizedBox(height:20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _icons.asMap().entries.map(
                  (MapEntry map) => buildIcon(map.key),
                ).toList(),
              ),
              SizedBox(height: 20,),
              DestinationCarousel()
            ],
          )
        )
    );
  }
}
