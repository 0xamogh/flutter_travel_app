import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel_ui_starter/models/destination_model.dart';
import 'package:flutter_travel_ui_starter/models/hotel_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HotelCarousel extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children : <Widget>[
                      Text(
                    'Exclusive Hotels',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      )                    
                  ),
                      GestureDetector(
                    onTap: () => print('tappppp'),
                    child :Text(
                    'See All',
                    style : TextStyle(
                      color : Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      letterSpacing: 1
                      
                      )
                    ))

                  ])
                  ),
                  Container(
                    height : 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: hotels.length,
                      itemBuilder: (BuildContext context, int index){
                        Hotel hotel = hotels[index];
                         return Container(
                          margin : EdgeInsets.all(10),
                          width : 240,
                          child : Stack(
                              alignment: Alignment.topCenter,
                              children: <Widget>[
                                 Positioned ( 
                                  bottom: 15,
                                  child :Container(
                                  height: 120,
                                  width : 240,
                                  decoration: BoxDecoration(
                                    color : Colors.white,
                                    borderRadius:  BorderRadius.circular(10)
                                  ),
                                  child : Padding( 
                                    padding: EdgeInsets.all(10),
                                    child :Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(hotel.name,
                                        style: CupertinoTheme.of(context).textTheme.navTitleTextStyle),
                                      SizedBox( height: 2),
                                      Text(
                                        hotel.address,
                                        style: TextStyle(
                                          color : Colors.grey
                                        ),),
                                      SizedBox(height: 2),
                                      Text(
                                        '\$${hotel.price} / night',
                                        style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,                                   
                                  
                                      )
                                    ],))
                                )),
                                Container(
                                  decoration: BoxDecoration(
                                    color : Colors.white,
                                    borderRadius : BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color : Colors.black26,
                                        offset : Offset(0, 2),
                                        blurRadius: 6 
                                      )
                                    ] 
                                  ),
                                  child : Stack(
                                    children: <Widget>[
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child : Image(
                                          height: 180,
                                          width: 220,
                                          image : AssetImage(hotel.imageUrl),
                                          fit : BoxFit.cover
                                        )
                                      ),
                                      ],
                                  )
                                )
                              ],)
                            );
                      },
                    ),
                  )
                  ]
                  

                );
  }
}