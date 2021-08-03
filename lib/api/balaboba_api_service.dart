import "dart:async";
import 'package:balaboba/models.dart';
import 'package:chopper/chopper.dart';

// This is necessary for the generator to work.
part "balaboba_api_service.chopper.dart";

@ChopperApi(baseUrl: "/lab/api/yalm")
abstract class BalabobaApiService extends ChopperService {
  static BalabobaApiService create([ChopperClient? client]) =>
      _$BalabobaApiService(client);

  @Post(
      path: '/text3',
      headers: {'Content-Type': 'application/json; charset=UTF-8'})
  Future<Response> getTextGeneratedByBalaboba(
      @Body() Map<String, dynamic> body,
      );

  @Get(path: '/intros', headers: {'Content-Type': 'application/json; charset=UTF-8'})
  Future<Response> getIntros();


}