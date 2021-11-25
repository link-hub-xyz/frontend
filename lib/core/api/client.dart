import 'package:http/http.dart' as http;

class Client extends http.BaseClient {
  Future<String?> Function() tokenProvider;
  final http.Client _inner = http.Client();

  Client({required this.tokenProvider});

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final token = await tokenProvider();
    if (token != null) request.headers['Authorization'] = 'Bearer $token';
    return _inner.send(request);
  }
}
