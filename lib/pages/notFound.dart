import "package:flutter/material.dart";
import 'package:flutter_cozy/pages/home_page.dart';
import 'package:flutter_cozy/theme.dart';

class NotFound extends StatelessWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 86,
                child: Image.asset("assets/images/404.png"),
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                "Where Are You Going ? ",
                style: blackTextStyle.copyWith(fontSize: edge),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                "Seems like the page that you were \nrequested is already gone",
                textAlign: TextAlign.center,
                style: grayTextStyle.copyWith(fontSize: 16),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }), (route) => false);
                },
                child: Container(
                  width: 210,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          colors: [Color(0xff77eed8), Color(0xff9eabe4)])),
                  child: Center(
                    child: Text("Back To Home",
                        style: whiteTextStyle.copyWith(fontSize: 18)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
