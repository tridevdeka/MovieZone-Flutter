import 'dart:async';

import 'package:hive/hive.dart';

abstract class LanguageLocalDatSource {
  Future<void> updateLanguage(String languageCode);
  Future<String> getLanguage();
}

class LanguageLocalDatSourceImpl extends LanguageLocalDatSource{
  @override
  Future<String> getLanguage() async{
    final languageBox=await Hive.openBox("languageBox");
   return languageBox.get("preferred_language");
  }

  @override
  Future<void> updateLanguage(String languageCode) async{
    final languageBox=await Hive.openBox("languageBox");
    unawaited(languageBox.put("preferred_language", languageCode));
  }
  
}