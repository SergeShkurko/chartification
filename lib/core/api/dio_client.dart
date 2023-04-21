import 'package:chartification/config.dart' as config;
import 'package:chartification/core/core.dart';
import 'package:chartification/dependencies_injection.dart';
import 'package:chartification/utils/utils.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

typedef ResponseConverter<T> = T Function(dynamic response);

class DioClient {
  String baseUrl = config.baseUrl;

  String? _auth;
  bool _isUnitTest = false;
  late Dio _dio;

  DioClient({bool isUnitTest = false}) {
    _isUnitTest = isUnitTest;

    try {
      _auth = sl<PrefManager>().token;
    } catch (_) {}

    _dio = _createDio();

    if (!_isUnitTest) _dio.interceptors.add(DioInterceptor());
  }

  Dio get dio {
    if (_isUnitTest) {
      /// Return static dio if is unit test
      return _dio;
    } else {
      /// We need to recreate dio to avoid token issue after login
      try {
        _auth = sl<PrefManager>().token;
      } catch (_) {}

      final dio = _createDio();

      if (!_isUnitTest) dio.interceptors.add(DioInterceptor());

      return dio;
    }
  }

  Dio _createDio() => Dio(
        BaseOptions(
          baseUrl: baseUrl,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            if (_auth != null) ...{
              'Authorization': _auth,
            },
          },
          receiveTimeout: const Duration(milliseconds: 60000),
          connectTimeout: const Duration(milliseconds: 60000),
          validateStatus: (int? status) {
            return status! > 0;
          },
        ),
      );

  Future<Either<Failure, T>> getRequest<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    required ResponseConverter<T> converter,
  }) async {
    try {
      final response = await dio.get(url, queryParameters: queryParameters);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(converter(response.data));
      }

      throw DioError(
        requestOptions: response.requestOptions,
        response: response,
      );
    } on DioError catch (e) {
      return Left(ServerFailure(_relevantErrorMessage(e)));
    } on TypeError {
      return Left(MappingFailure());
    }
  }

  Future<Either<Failure, T>> postRequest<T>(
    String url, {
    Map<String, dynamic>? data,
    required ResponseConverter<T> converter,
  }) async {
    try {
      final response = await dio.post(url, data: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(converter(response.data));
      }

      throw DioError(
        requestOptions: response.requestOptions,
        response: response,
      );
    } on DioError catch (e) {
      return Left(
        ServerFailure(_relevantErrorMessage(e)),
      );
    } on TypeError {
      return Left(MappingFailure());
    }
  }

  String? _relevantErrorMessage(DioError e) =>
      e.response?.data['description'] as String? ??
      e.response?.data['error'] as String? ??
      e.response?.data['Note'] as String? ??
      e.message;
}
