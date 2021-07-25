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

  @override
  String toString() {
    return 'BalabobaResponse{bad_query: $bad_query, error: $error, query: $query, text: $text}';
  }
}

class Intro {
  int id = 0;
  String name = "";
  String hint = "";
  bool isSelected = false;

  Intro(this.id, this.name, this.hint);

  static List<Intro> castTo(List<dynamic> original) {
    var result = <Intro>[];
    original.forEach((intro) {
      result.add(Intro(intro[0], intro[1], intro[2]));
    });
    return result;
  }

  @override
  String toString() {
    return 'Intro{id: $id, name: $name, hint: $hint}';
  }
}

class IntroDto {
  int error = 0;
  late List<Intro> intros;

  IntroDto.fromJson(Map<String, dynamic> json)
      : error = json['error'],
        intros = Intro.castTo(json['intros']);

  @override
  String toString() {
    return 'IntroDto{error: $error, intros: $intros}';
  }
}
