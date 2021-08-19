import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:rim_creator/dictionary/translations/backstories.dart';

class Dictionary extends ChangeNotifier{
  Backstories? _backstories;
  Backstories? get backstories => _backstories;

  dynamic getRandomBackstory()
  {
    final _random = new Random();
    final _backstory = backstories!.data.values.toList()[_random.nextInt(backstories!.data.length)];
    return _backstory;
  }

  dynamic getBackstory(String key){
    final _backstory = backstories?.data[key];
    return _backstory;
  }

  void initTranslations(){
    WidgetsFlutterBinding.ensureInitialized();
    Future<String> future = _readFileAsync('assets/backstories.xml');
    future.then((val) {
      _backstories = Backstories.fromXml(val);
      notifyListeners();
    }).catchError((error) {
      print('error: $error');
    });
  }

  Future<String> _readFileAsync(String filePath) async {
    String xmlString = await rootBundle.loadString(filePath);
    return xmlString;
  }
}