import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:feedbackdesign/shared/utils/app_formatter.dart';

class APILoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    dynamic requestBody = options.data ?? options.queryParameters;
    if (requestBody is FormData) {
      requestBody = "${requestBody.fields}\n${requestBody.files.toString()}";
    } else {
      requestBody = AppFormatter().prettyJson(requestBody);
    }
    log(
      "\x1B[33m${options.method} => ${options.uri.toString()}",
      name: "\x1B[0m\x1B[33m⏳ Request",
      error: "\x1B[33m$requestBody",
    );
    log(
      "\x1B[33m",
      name: "\x1B[0m\x1B[33m💀 Headers-Request",
      error: "\x1B[33m${json.encode(options.headers)}",
    );

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _setLogger("✅", "\x1B[32m", response.requestOptions, response);
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _setLogger("❌", "\x1B[31m", err.requestOptions, err.response);
    return super.onError(err, handler);
  }

  void _setLogger(
    String type,
    String colorCode,
    RequestOptions request,
    Response? response,
  ) {
    final String logHeader =
        "$colorCode${request.method} =>  $type ${response?.statusCode} : ${request.uri.toString()}";
    log(
      logHeader,
      name: "\x1B[0m$colorCode$type Response",
      error: "$colorCode${AppFormatter().prettyJson(response?.data)}",
    );
  }
}
