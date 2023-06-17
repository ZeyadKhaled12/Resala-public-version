import 'dart:convert';

class GeneralFunctions {

  final String text;

  GeneralFunctions({required this.text});


  bool _hasArabicCharacters() {
    if(text.contains('Ø')){
     return true;
    }
    return false;
  }

  String checkAndConvert() {
    if (_hasArabicCharacters()) {
      return _convert();
    }
    return text;
  }

  String _convert() {
    var myDataString = utf8.decode(text.codeUnits);
    return myDataString;
  }
}
