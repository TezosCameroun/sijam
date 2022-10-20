import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

abstract class ApiInterface {
  String get url;
  late http.Response response;
  Future post(
    String endpoint, {
    Map body = const {},
    Map<String, String> headers = const {},
  }) async {
    var uri = Uri.parse(
      url + endpoint!,
    );
    http.Client client = RetryClient(
      http.Client(),
      retries: 1,
    );
    try {
      response = await client.post(uri, body: body, headers: headers);
      print("${response.body} login");
    } catch (e) {}

    return response;
  }

  Future delete() async {}
  Future put() async {}
  Future get() async {}
}
