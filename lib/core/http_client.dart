import 'package:dio/dio.dart';

class HttpClient {
  final dio = Dio();

  Future<Response?> getHttp({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    final response = await dio.get(url);
    print(response);
    if (response.data != null) {
      return response;
    }
  }
}
