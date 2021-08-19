import 'dart:convert';

import 'package:xml2json/xml2json.dart';

class Backstories {
  final Map<String, dynamic> data;
  factory Backstories.fromXml(String input) {
    final _jString = Xml2Json()..parse(input);
    final _jData = _jString.toParker();
    final _decoded = jsonDecode(_jData);
    final _stories = _decoded["BackstoryTranslations"];
    return Backstories(_stories);
  }

  Backstories(this.data);
}