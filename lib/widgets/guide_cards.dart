import 'package:flutter/material.dart';
import 'package:flutter_cozy/theme.dart';
import 'package:flutter_cozy/models/guide.dart';

class GuideCards extends StatelessWidget {
  final Guide guide;

  GuideCards(this.guide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 321,
      height: 80,
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            child: Image.asset(
              guide.imageUrl as String,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              guide.nama as String,
              style: blackTextStyle.copyWith(fontSize: 18),
            ),
            Text("Updated ${guide.tanggal} ${guide.bulan}",
                style: grayTextStyle.copyWith(fontSize: 14))
          ]),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: 40),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.chevron_right),
              splashColor: Color(0xff3edbf0),
              color: grayColor,
            ),
          )
        ],
      ),
    );
  }
}
