import 'package:dio/dio.dart';
import 'package:ecommerce_desi/core/network/api_constants.dart';
import '../storage/secure_storage.dart';


class DioClient {
  final Dio dio;

  DioClient._(this.dio);

  factory DioClient() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstant.baseUrl, // https://api.Desibhandar.com/api
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",

        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        /// 🔹 Attach token automatically
        onRequest: (options, handler) async {
          if (options.extra["skipAuth"] == true) {
            return handler.next(options);
          }
          final token = await SecureStorage.getToken();
          if (token != null && token.isNotEmpty) {
            options.headers["Authorization"] = "Bearer $token";
          }
          handler.next(options);
        },

        /// 🔹 Handle unauthorized globally
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            await SecureStorage.clearToken();
            // TODO: redirect to login if needed
          }
          handler.next(error);
        },
      ),
    );

    return DioClient._(dio);
  }
}
