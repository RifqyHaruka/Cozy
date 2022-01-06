import "package:flutter/material.dart";
import 'package:flutter_cozy/models/recomen.dart';
import 'package:flutter_cozy/pages/home_page.dart';
import 'package:flutter_cozy/pages/notFound.dart';
import 'package:flutter_cozy/widgets/details_header..dart';
import "package:flutter_cozy/theme.dart";
import 'package:flutter_cozy/widgets/photos.dart';
import 'package:flutter_cozy/widgets/rating_item.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatefulWidget {
  final Recomen? recomen;

  Details({this.recomen});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool isTap = false;
  @override
  Widget build(BuildContext context) {
    int index = 0;
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return NotFound();
        }));
      }
    }

    Future<void> myMessageDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Konfirmasi'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Apakah Kamu Ingin Menelepon Pemilik Kos'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Batal'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Hubungi'),
                onPressed: () {
                  Navigator.of(context).pop();
                  launchUrl('tel:${widget.recomen!.phone}');
                },
              ),
            ],
          );
        },
      );
    }

    return MaterialApp(
      home: Scaffold(
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

            Image.network(
              widget.recomen!.imageUrl as String,
              height: 350,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image(
                      image: AssetImage("assets/images/icon_back.png"),
                      width: 40,
                      height: 40,
                    ),
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
                                Row(
                                  children: [
                                    Text(
                                      widget.recomen?.nama as String,
                                      style:
                                          blackTextStyle.copyWith(fontSize: 22),
                                    ),
                                    SizedBox(
                                      width: 80,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isTap = !isTap;
                                        });
                                      },
                                      child: AnimatedContainer(
                                        duration: Duration(seconds: 1),
                                        child: Image(
                                          image: AssetImage((isTap == false)
                                              ? "assets/images/icon_wishlist.png"
                                              : "assets/images/btn_wishlist_warna.png"),
                                          width: 40,
                                          height: 40,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 2),
                                Row(
                                  children: [
                                    Text(
                                      "\$" +
                                          (widget.recomen?.price as int)
                                              .toString(),
                                      style: purpleTextStyle.copyWith(
                                          fontSize: 16),
                                    ),
                                    Text(
                                      "/ month",
                                      style:
                                          grayTextStyle.copyWith(fontSize: 16),
                                    )
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    RatingItem(
                                        index: 1,
                                        rating: widget.recomen!.rating),
                                    RatingItem(
                                        index: 2,
                                        rating: widget.recomen!.rating),
                                    RatingItem(
                                        index: 3,
                                        rating: widget.recomen!.rating),
                                    RatingItem(
                                        index: 4,
                                        rating: widget.recomen!.rating),
                                    RatingItem(
                                        index: 5,
                                        rating: widget.recomen!.rating)
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
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return NotFound();
                                  }));
                                },
                                child: Image.asset(
                                  "assets/images/001-bar-counter.png",
                                  width: 32,
                                  height: 32,
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    (widget.recomen!.numberOfKitchen as int)
                                        .toString(),
                                    style:
                                        purpleTextStyle.copyWith(fontSize: 14),
                                  ),
                                  Text(" Kitchen",
                                      style:
                                          grayTextStyle.copyWith(fontSize: 14))
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                              // width: 50,
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
                                    (widget.recomen!.numberBedroom as int)
                                        .toString(),
                                    style:
                                        purpleTextStyle.copyWith(fontSize: 14),
                                  ),
                                  Text(" Bedroom",
                                      style:
                                          grayTextStyle.copyWith(fontSize: 14))
                                ],
                              )
                            ],
                          ),
                          // SizedBox(
                          //   width: 50,
                          // ),
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
                                    (widget.recomen!.numberOfCupBoard as int)
                                        .toString(),
                                    style:
                                        purpleTextStyle.copyWith(fontSize: 14),
                                  ),
                                  Text(" CupBoard",
                                      style:
                                          grayTextStyle.copyWith(fontSize: 14))
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
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: widget.recomen!.photos!.map((item) {
                            index++;
                            return Container(
                              margin:
                                  EdgeInsets.only(left: (index == 1) ? 0 : 24),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  item,
                                  width: 110,
                                  height: 88,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }).toList()
                          // Photos(
                          //   urlImage: "assets/images/photos1.png",
                          // ),
                          // SizedBox(
                          //   width: 18,
                          // ),
                          // Photos(urlImage: "assets/images/photos2.png"),
                          // SizedBox(
                          //   width: 18,
                          // ),
                          // Photos(urlImage: "assets/images/photos3.png")
                          ),
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
                                  widget.recomen!.address as String,
                                  style: blackTextStyle,
                                ),
                                Text(
                                  "Palembang",
                                  style: blackTextStyle,
                                )
                              ],
                            ),
                            SizedBox(width: 74),
                            GestureDetector(
                              onTap: () {
                                launchUrl(widget.recomen!.mapUrl as String);
                              },
                              child: Image.asset(
                                "assets/images/icon_maps.png",
                                width: 40,
                                height: 40,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          myMessageDialog();
                        },
                        child: Container(
                          width: 327,
                          height: 50,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xff77eed8),
                                Color(0xff9eabe4)
                              ]),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Text(
                            "Book Now",
                            style: whiteTextStyle.copyWith(fontSize: 18),
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ])
          ],
        ),
      )),
    );
  }
}
