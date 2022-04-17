import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart' as iOclient;
import 'package:http_interceptor/http_interceptor.dart';
import 'package:interview/api/http_client.dart';
import 'package:interview/objects/todo_object.dart';

import '../response/api_response.dart';
import 'interceptor.dart';

class Api {
  http.Client _client = InterceptedClient.build(
    interceptors: [LoggingInterceptor()],
    requestTimeout: Duration(seconds: 60),
    client: iOclient.IOClient(MyHttpClient(HttpClient())
      ..badCertificateCallback = (_, __, ___) => true),
  );

  Future<ApiResponse> getTodos() async {
    try {
      final _uri =
          Uri.https("jsonplaceholder.typicode.com", "todos", {"_limit": "5"});
      final _res = await _client.get(_uri);
      if (_res.statusCode == 200) {
        final _body = json.decode(_res.body);
        return ApiResponse(
            (_body as List).map((e) => TodoObject.fromMap(e)).toList());
      }
      return ApiResponse.error("Failed to fetch");
    } catch (e) {
      return ApiResponse.error("Critical Error");
    }
  }
}
