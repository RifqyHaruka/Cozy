import 'package:flutter/material.dart';
import 'package:flutter_cozy/Providers/recomen_provider.dart';
import 'package:flutter_cozy/models/city.dart';
import 'package:flutter_cozy/models/guide.dart';

import 'package:flutter_cozy/theme.dart';
import 'package:flutter_cozy/widgets/city_cards.dart';
import 'package:flutter_cozy/widgets/guide_cards.dart';
import 'package:flutter_cozy/widgets/space_cards.dart';
import 'package:flutter_cozy/models/recomen.dart';
import 'package:flutter_cozy/widgets/toggle.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider =
        Provider.of<SpaceProvider>(context); //cara manggilnya emang gini
    // spaceProvider.getRecommendedSpace();
    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: edge),
            child: ListView(
              children: [
                //Note:Title/Header
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: edge),
                  child: Text(
                    "Explore Now",
                    style: blackTextStyle.copyWith(fontSize: 24),
                  ),
                ),

                SizedBox(height: 2),

                Padding(
                  padding: EdgeInsets.only(left: 24),
                  child: Text(
                    "Mencari kosan yang cozy",
                    style: grayTextStyle.copyWith(fontSize: 16),
                  ),
                ),

                SizedBox(height: 30),

                Padding(
                  //Note : Popular Cities
                  padding: EdgeInsets.only(left: 24),
                  child: Text("Popular Cities",
                      style: regularTextStyle.copyWith(fontSize: 16)),
                ),

                SizedBox(height: 16),

                Container(
                    height: 150,
                    width: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(width: 24),
                        CityCards(City(
                            id: 1,
                            name: "Jakarta",
                            imageUrl: "assets/images/city1.png")),
                        SizedBox(width: 20),
                        CityCards(City(
                            id: 2,
                            name: "Bandung",
                            imageUrl: "assets/images/city2.png",
                            isPopular: true)),
                        SizedBox(width: 20),
                        CityCards(City(
                            id: 3,
                            name: "Surabaya",
                            imageUrl: "assets/images/city3.png")),
                        // SizedBox(width: 24),
                        SizedBox(width: 20),
                        CityCards(City(
                            id: 3,
                            name: "Palembang",
                            imageUrl: "assets/images/palembang.png")),
                        SizedBox(width: 20),
                        CityCards(City(
                            isPopular: true,
                            id: 3,
                            name: "Aceh",
                            imageUrl: "assets/images/aceh.png")),
                        SizedBox(width: 20),
                        CityCards(City(
                            id: 3,
                            name: "Bogor",
                            imageUrl: "assets/images/bogor.png")),
                        SizedBox(width: 24),
                      ],
                    )),

                //Note : Recommend Space
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.only(left: 24),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Recommended Space",
                          style: blackTextStyle.copyWith(fontSize: 16),
                        ),
                        SizedBox(height: 16),
                        FutureBuilder(
                          future: spaceProvider.getRecommendedSpace(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<Recomen> data =
                                  snapshot.data as List<Recomen>;
                              int index = 0;

                              return Column(
                                  children: data.map((item) {
                                index++;
                                return Container(
                                    margin: EdgeInsets.only(
                                        top: (index == 1) ? 0 : 30),
                                    child: SpaceCards(item));
                              }).toList()
                                  // [
                                  //   SpaceCards(Recomen(
                                  //       id: 1,
                                  //       nama: "Kuratakeso Hot",
                                  //       imageUrl: "assets/images/recomen1.png",
                                  //       location: "Bandung, Germany",
                                  //       price: 52,
                                  //       rating: 4)),
                                  //   SizedBox(height: 30),
                                  //   SpaceCards(Recomen(
                                  //       id: 2,
                                  //       nama: "Roemah nenek",
                                  //       imageUrl: "assets/images/recomen2.png",
                                  //       location: "Seattle, Bogor",
                                  //       price: 52,
                                  //       rating: 5)),
                                  //   SizedBox(height: 30),
                                  //   SpaceCards(Recomen(
                                  //       id: 3,
                                  //       nama: "Darrling How",
                                  //       imageUrl: "assets/images/recomen3.png",
                                  //       location: "Jakarta Indonesia",
                                  //       price: 52,
                                  //       rating: 3)),
                                  //   SizedBox(height: 30),
                                  // ],
                                  );
                            }

                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                      ]),
                ),

                SizedBox(height: 30),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: edge),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Tips and Guidance",
                          style: blackTextStyle.copyWith(fontSize: 16)),
                      SizedBox(height: 16),
                      GuideCards(Guide(
                          imageUrl: "assets/images/tips1.png",
                          nama: "City Guidelines",
                          tanggal: "20",
                          bulan: "Apr")),
                      SizedBox(height: 20),
                      GuideCards(Guide(
                          imageUrl: "assets/images/tips2.png",
                          nama: "Jakarta Fairship",
                          tanggal: "11",
                          bulan: "Dec"))
                    ],
                  ),
                ),

                SizedBox(height: 50),
                Center(
                    child: BottomBar(
                  ishomeTrue: true,
                  isfavTrue: false,
                  ismailTrue: false,
                  ismessageTrue: false,
                ))
              ],
            ),
          )),
    );
  }
}
