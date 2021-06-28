// ignore: import_of_legacy_library_into_null_safe
import 'dart:convert';

import 'package:balaboba/models.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

class ApiRepository {
  final String _baseUrl = "https://zeapi.yandex.net/lab/api/yalm/text3";

  Future<http.Response> makeRequest(String query) {
    return http.post(Uri.parse(_baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(BalabobaSearchRequest(1, 0, query).toJson()),
        encoding: Encoding.getByName("utf-8"));
  }
}
