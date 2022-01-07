import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  var url = Uri.https('10.0.2.2:8000', '', {});

  var response = await http.get(url);
  print(response);
}
