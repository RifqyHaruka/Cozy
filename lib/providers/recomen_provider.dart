import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_cozy/models/recomen.dart';
import 'package:http/http.dart' as http;

class SpaceProvider extends ChangeNotifier {
  getRecommendedSpace() async {
    var url = Uri.parse("https://bwa-cozy.herokuapp.com/recommended-spaces");
    var result = await http.get(url);

    print(result.statusCode);
    print(result.body);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Recomen> spaces =
          data.map((item) => Recomen.fromJson(item)).toList();

      return spaces;
    } else {
      return <Recomen>[];
    }
  }
}
