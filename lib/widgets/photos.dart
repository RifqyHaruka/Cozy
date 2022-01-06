import "package:flutter/material.dart";

class Photos extends StatelessWidget {
  final String? urlImage;

  Photos({this.urlImage});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: Container(
        width: 110,
        height: 88,
        child: Image.asset(
          urlImage as String,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
