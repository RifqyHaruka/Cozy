import 'package:flutter/material.dart';
import 'package:flutter_cozy/theme.dart';

class BottomBar extends StatelessWidget {
  final bool? ishomeTrue;
  final bool? ismessageTrue;
  final bool? ismailTrue;
  final bool? isfavTrue;
  final Function()? homePressed;
  final Function()? mailPressed;
  final Function()? messagePressed;
  final Function()? favPressed;

  BottomBar(
      {this.ishomeTrue,
      this.ismessageTrue,
      this.ismailTrue,
      this.isfavTrue,
      this.homePressed,
      this.mailPressed,
      this.messagePressed,
      this.favPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 65,
      decoration: BoxDecoration(
          color: lighGrey, borderRadius: BorderRadius.circular(23)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: homePressed,
            icon: Icon(Icons.home,
                color: (ishomeTrue as bool) ? purpleColor : grayColor),
          ),
          IconButton(
            onPressed: mailPressed,
            icon: Icon(
              Icons.mail,
              color: (ismessageTrue as bool) ? purpleColor : grayColor,
            ),
          ),
          IconButton(
            onPressed: messagePressed,
            icon: Icon(
              Icons.chat,
              color: (ismailTrue as bool) ? purpleColor : grayColor,
            ),
          ),
          IconButton(
            onPressed: favPressed,
            icon: Icon(
              Icons.favorite,
              color: (isfavTrue as bool) ? purpleColor : grayColor,
            ),
          )
        ],
      ),
    );
  }
}
