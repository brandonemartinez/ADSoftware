import 'dart:convert';

import 'package:home_life/src/util/constants.dart';
import 'package:http/http.dart' as http;

class HttpService {
  postData(data, url) async {
    var fullUrl = kBaseUrl+url;
    return await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
    );
  }
}