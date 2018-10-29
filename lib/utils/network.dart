import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
class NetworkUtils {
  static NetworkUtils _instance = NetworkUtils.internal();
  
  NetworkUtils.internal();

  factory NetworkUtils() {
    return _instance;
  }

  Future<dynamic> get(String url) {
    return http.get(url).then((response) {
      int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return json.decode(response.body);
    });
  }

  Future<dynamic> post(String url, {Map headers, body, encodding}) {
    return http
        .post(url, body: body, encoding: encodding, headers: headers)
        .then((response) {
      int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return response.body;
    });
  }

  postWithImage(String url, String fileName, final bytes) {
    return http.MultipartRequest('POST', Uri.parse(url))
      ..files.add(
          http.MultipartFile.fromBytes('image', bytes, filename: fileName));
  }
}
