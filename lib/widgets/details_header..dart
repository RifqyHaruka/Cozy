import 'package:flutter/material.dart';
import 'package:flutter_cozy/theme.dart';
import 'package:flutter_cozy/widgets/photos.dart';

class DetailsHeader extends StatelessWidget {
  const DetailsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   height: 350,
          //   child: Image(
          //     image: AssetImage("assets/images/city1.png"),
          //     fit: BoxFit.cover,
          //   ),
          // ),

          Image.asset(
            "assets/images/city1.png",
            height: 350,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
          Padding(
            padding: EdgeInsets.only(left: edge, top: 30, right: edge),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image(
                    image: AssetImage("assets/images/icon_back.png"),
                    width: 40,
                    height: 40,
                  ),
                ),
                Image(
                  image: AssetImage("assets/images/icon_wishlist.png"),
                  width: 40,
                  height: 40,
                ),
              ],
            ),
          ),

          ListView(children: [
            SizedBox(
              height: 328,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: edge),
              height: 604,
              width: 390,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 30),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Kuratakesso Hot",
                                style: blackTextStyle.copyWith(fontSize: 22),
                              ),
                              SizedBox(height: 2),
                              Row(
                                children: [
                                  Text(
                                    "\$52",
                                    style:
                                        purpleTextStyle.copyWith(fontSize: 16),
                                  ),
                                  Text(
                                    "/ month",
                                    style: grayTextStyle.copyWith(fontSize: 16),
                                  )
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Image.asset("assets/images/icon_star.png",
                                      width: 20, height: 20),
                                  Image.asset("assets/images/icon_star.png",
                                      width: 20, height: 20),
                                  Image.asset("assets/images/icon_star.png",
                                      width: 20, height: 20),
                                  Image.asset("assets/images/icon_star.png",
                                      width: 20, height: 20),
                                  Image.asset(
                                      "assets/images/icon_star_black.png",
                                      width: 20,
                                      height: 20),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Main Facilities",
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/001-bar-counter.png",
                              width: 32,
                              height: 32,
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  "2",
                                  style: purpleTextStyle.copyWith(fontSize: 14),
                                ),
                                Text(" Kitchen",
                                    style: grayTextStyle.copyWith(fontSize: 14))
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/002-double-bed.png",
                              width: 32,
                              height: 32,
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  "2",
                                  style: purpleTextStyle.copyWith(fontSize: 14),
                                ),
                                Text(" Kitchen",
                                    style: grayTextStyle.copyWith(fontSize: 14))
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/003-cupboard.png",
                              width: 32,
                              height: 32,
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  "2",
                                  style: purpleTextStyle.copyWith(fontSize: 14),
                                ),
                                Text(" Kitchen",
                                    style: grayTextStyle.copyWith(fontSize: 14))
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Photos",
                    style: blackTextStyle.copyWith(fontSize: 16),
                  ),
                  SizedBox(height: 12),
                  Container(
                    height: 88,
                    width: MediaQuery.of(context).size.width,
                    child:
                        ListView(scrollDirection: Axis.horizontal, children: [
                      Photos(
                        urlImage: "assets/images/photos1.png",
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      Photos(urlImage: "assets/images/photos2.png"),
                      SizedBox(
                        width: 18,
                      ),
                      Photos(urlImage: "assets/images/photos3.png")
                    ]),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Location",
                        style: blackTextStyle.copyWith(fontSize: 16),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Jln. Kappan Sukses No. 20",
                                style: blackTextStyle,
                              ),
                              Text(
                                "Palembang",
                                style: blackTextStyle,
                              )
                            ],
                          ),
                          SizedBox(width: 74),
                          Image.asset(
                            "assets/images/icon_maps.png",
                            width: 40,
                            height: 40,
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Container(
                      width: 327,
                      height: 50,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xff77eed8), Color(0xff9eabe4)]),
                          borderRadius: BorderRadius.circular(17)),
                      child: Center(
                          child: Text(
                        "Book Now",
                        style: whiteTextStyle.copyWith(fontSize: 18),
                      )),
                    ),
                  )
                ],
              ),
            )
          ])
        ],
      ),
    ));
  }
}
