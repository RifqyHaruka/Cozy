import 'package:flutter/material.dart';
import 'package:flutter_cozy/models/recomen.dart';
import 'package:flutter_cozy/theme.dart';
import 'package:flutter_cozy/pages/details.dart';

class SpaceCards extends StatelessWidget {
  final Recomen recomen;

  SpaceCards(this.recomen);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 329,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Details(
              recomen: recomen,
            );
          }));
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Container(
                  width: 130,
                  height: 110,
                  child: Stack(
                    children: [
                      Image.network(
                        recomen.imageUrl as String,
                        width: 130,
                        height: 110,
                        fit: BoxFit.cover,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                            width: 70,
                            height: 30,
                            decoration: BoxDecoration(
                                color: purpleColor,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(36))),
                            child: Center(
                                child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/icon_star.png",
                                  width: 22,
                                  height: 22,
                                ),
                                Text("${recomen.rating}/5",
                                    style:
                                        whiteTextStyle.copyWith(fontSize: 13))
                              ],
                            ))),
                      )
                    ],
                  )),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recomen.nama as String,
                  style: blackTextStyle.copyWith(fontSize: 18),
                ),
                Row(
                  children: [
                    Text(
                      "\$${recomen.price as int}",
                      style: purpleTextStyle.copyWith(fontSize: 18),
                    ),
                    Text(
                      " / month ",
                      style: grayTextStyle.copyWith(fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  recomen.location as String,
                  style: grayTextStyle,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
