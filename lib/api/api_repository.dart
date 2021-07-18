import 'dart:convert';

import 'package:chopper/chopper.dart';

import '../models.dart';
import 'balaboba_api_service.dart';

class ApiRepository {
  ChopperClient? chopper;
  BalabobaApiService? service;

  ApiRepository() {
    chopper = ChopperClient(
      converter: JsonConverter(),
      baseUrl: "https://zeapi.yandex.net",
      services: [
        // Create and pass an instance of the generated service to the client
        BalabobaApiService.create()
      ],
    );
    service = chopper!.getService<BalabobaApiService>();
  }

  Future<BalabobaResponse> getTextGeneratedBalaboba(
      int filter, int intro, String query) async {
    var res = await service!.getTextGeneratedByBalaboba(
        BalabobaSearchRequest(1, 0, query).toJson());

    return BalabobaResponse.fromJson(res.body);
  }

  Future<IntroDto> getIntros() async {
    var res = await service!.getIntros();
    return IntroDto.fromJson(res.body);
  }
}