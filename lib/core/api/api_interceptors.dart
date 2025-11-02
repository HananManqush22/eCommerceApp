import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/sensitive_data.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers.addAll({
      // 'Authorization': 'Bearer ${idToken.toString()}',
      'Accept': 'application/json',
      'apikey': anonKey,
    });

    super.onRequest(options, handler);
  }
}
