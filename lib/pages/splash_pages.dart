import "package:flutter/material.dart";
import 'package:flutter_cozy/pages/home_page.dart';
import "package:flutter_cozy/theme.dart";

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
              child: Stack(
                children: [
                  Align(alignment : Alignment.bottomCenter, 
                  child: Image.asset('assets/images/splash_image.png')),
                  Padding(
                    padding: EdgeInsets.only(
                      top : 50,
                      left : 30
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/logo.png")
                            )
                          ),
                        ),

                        SizedBox(
                          height:30,
                        ),

                        Text(
                          "Find Cozy House\nto Stay and Happy",
                          style: blackTextStyle.copyWith(
                            fontSize : 24
                          ),
                        ),

                        SizedBox(
                          height:10
                        ),

                        Text(
                          "Stop membuang banyak waktu\npada tempat yang tidak habitable",
                          style: grayTextStyle.copyWith(
                            fontSize : 16
                          ),
                          ),

                          SizedBox(
                            height: 50,
                          ),

                          Container(
                            width : 210,
                            height: 40,
                            // child: RaisedButton(
                            //   shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(17)
                            //   ),
                            //   color: purpleColor,
                            //   onPressed: () {},
                            //   child: Text(
                            //     "Explore Now", style: whiteTextStyle.copyWith(
                            //       fontSize: 18
                            //     ),
                            //     ),
                  
                            // ),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => HomePage()
                                  ));
                              },
                              style: ElevatedButton.styleFrom(
                                  primary : purpleColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(17)
                                  )
                                ),
                              
                              child: Text("Explore Now", style: whiteTextStyle.copyWith(
                                fontSize: 18
                              ),
                              ),
                            ),
                          )
                        
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}