import 'package:flutter/material.dart';
import 'package:flutter_cozy/models/city.dart';
import 'package:flutter_cozy/theme.dart';

class CityCards extends StatelessWidget {

  final City city;

  CityCards(this.city);  

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
          child: Container(
        height: 150,
        width: 120,
        child : Column(
          children: [
          Stack(
            children: [
              Image.asset(city.imageUrl as String,
              width: 120,
              height: 102,
              fit: BoxFit.cover,
              
              ),

              city.isPopular as bool ?  Align(
                alignment : Alignment.topRight,
                child: Container(
                       width:50,
                  height:30,
                  decoration: BoxDecoration(
                    color: purpleColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(36)
                    )
                    ),
                  child : Center(
                    child: Image.asset("assets/images/icon_star.png",
                    width: 22,
                    height: 22,)
                    )
                ),
              ) : Container()
            ]
          ),

          SizedBox(
            height : 11
          ),
          Text(city.name as String, style:blackTextStyle.copyWith(
            fontSize: 16
          ))
        ],)
      ),
    );
  }
}