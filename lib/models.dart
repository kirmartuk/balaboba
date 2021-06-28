import 'dart:core';

class BalabobaSearchRequest {
  final int filter;
  final int intro;
  final String query;

  BalabobaSearchRequest(this.filter, this.intro, this.query);

  Map<String, dynamic> toJson() =>
      {'filter': filter, 'intro': intro, 'query': query};
}

class BalabobaResponse {
  // ignore: non_constant_identifier_names
  final int bad_query;
  final int error;
  final String query;
  final String text;

  BalabobaResponse(this.bad_query, this.error, this.query, this.text);

  BalabobaResponse.fromJson(Map<String, dynamic> json)
      : bad_query = json['bad_query'],
        error = json['error'],
        query = json['query'],
        text = json['text'];
}
