// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balaboba_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$BalabobaApiService extends BalabobaApiService {
  _$BalabobaApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = BalabobaApiService;

  @override
  Future<Response<dynamic>> getTextGeneratedByBalaboba(
      Map<String, dynamic> body) {
    final $url = '/lab/api/yalm/text3';
    final $headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    final $body = body;
    final $request =
    Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getIntros() {
    final $url = '/lab/api/yalm/intros';
    final $headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}