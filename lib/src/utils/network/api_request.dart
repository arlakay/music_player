import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'endpoints.dart';
import 'network_service.dart';

class ErrorCode {
  static const String ERR_MSG =
      'Kamu lagi di luar jangkauan internet. Coba cek ulang koneksi data atau Wi-Fi kamu.';

  static const String NO_CONNECTION = 'NO_CONNECTION';
  static const String TIME_OUT = 'TIME_OUT';
  static const int ERROR = 404;
}

class ApiRequest {
  ApiRequest({this.service});

  final NetworkService? service;

  Dio get dio => _dio();
  Dio _dio() {
    final Dio dio = Dio();

    dio.interceptors.add(PrettyDioLogger(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseBody: true,
    ));
    return dio;
  }

  String baseUrl = Endpoints.baseUrl();

  String get path {
    final _service = service;

    if (_service is SearchMusicService) {
      return Endpoints.searchMusic();
    }

    if (_service is GetMusicService) {
      return Endpoints.searchMusic();
    }

    return '';
  }

  String get method {
    final _service = service;

    if (_service is GetMusicService) {
      return 'GET';
    }
    if (_service is SearchMusicService) {
      return 'GET';
    }

    return 'POST';
  }

  Map<String, dynamic> get headers {
    return <String, dynamic>{'Content-Type': 'application/json'};
  }

  Map<String, dynamic> get body {
    final _service = service;

    if (_service is GetMusicService) {
      return <String, dynamic>{
        'term': _service.searchQuery,
      };
    }

    if (_service is SearchMusicService) {
      return <String, dynamic>{
        'term': _service.searchQuery,
      };
    }

    return <String, dynamic>{};
  }

  Future<dynamic> request() async {
    try {
      final List<InternetAddress> result =
          await InternetAddress.lookup('google.com');

      final bool isConnected =
          result.isNotEmpty && result[0].rawAddress.isNotEmpty;

      print(isConnected);
      if (isConnected) {
        Map<String, dynamic> finalHeaders;
        
        finalHeaders = <String, dynamic>{};

        finalHeaders.addAll(headers);

        dio.options.receiveTimeout = 10000;
        dio.options.connectTimeout = 10000;
        dio.options.sendTimeout = 10000;

        final Response<dynamic> response = await dio.request(baseUrl + path,
            data: method == 'POST' || method == 'PUT'
                ? body
                : <String, dynamic>{},
            queryParameters:
                method == 'GET' || method == 'PUT' ? body : <String, dynamic>{},
            options: Options(
              method: method,
              headers: finalHeaders,
            ));

        return response;
      }
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
