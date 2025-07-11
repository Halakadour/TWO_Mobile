import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'get_api.dart';
import '../error/handling_exception_request.dart';

class PostWithTokenApi<T> with HandlingExceptionRequest {
  final Uri uri;
  final Map body;
  final FromJson fromJson;
  final bool isLogin;
  final Duration timeout;
  final String token;

  const PostWithTokenApi({
    required this.uri,
    required this.token,
    required this.body,
    required this.fromJson,
    this.isLogin = false,
    this.timeout = const Duration(seconds: 20),
  });

  Future<T> call() async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var request = http.Request('POST', uri);
      request.body = jsonEncode(body);
      request.headers.addAll(headers);
      http.StreamedResponse streamedResponse =
          await request.send().timeout(timeout);
      log(request.body, name: "request body");
      http.Response response = await http.Response.fromStream(streamedResponse);
      log(response.body);
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        return fromJson(response.body);
      } else {
        Exception exception = getException(response: response);
        throw exception;
      }
    } on HttpException {
      log(
        'http exception',
        name: 'RequestManager post function',
      );
      rethrow;
    } on FormatException {
      log(
        'something went wrong in parsing the uri',
        name: 'RequestManager post function',
      );
      rethrow;
    } on SocketException {
      log(
        'socket exception',
        name: 'RequestManager post function',
      );
      rethrow;
    } catch (e) {
      log(
        e.toString(),
        name: 'RequestManager post function',
      );
      rethrow;
    }
  }
}
