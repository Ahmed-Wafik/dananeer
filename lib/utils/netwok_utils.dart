import 'dart:io';

import 'package:dio/dio.dart';

class NetworkUtils {
  static String _url;
  static ContentType _contentType;
  static ResponseType _responseType;

  NetworkUtils(_url, _contentType, _responseType);

  final Dio _dio = Dio(Options(
    baseUrl: _url,
    connectTimeout: 5000,
    receiveTimeout: 3000,
    responseType: _responseType,
    contentType: _contentType,
  ));

  static Future<String> signUp() {
    
  }
}
