import 'dart:convert';

import 'package:http/http.dart';

import 'api_constants.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);

  dynamic get(String path, {Map<dynamic, dynamic>? params}) async {
    final response = await _client.get(
      getPath(params: params, path: path),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    print('PATH:: $path STATUS_CODE:: ${response.statusCode}  MSG:: ${response.reasonPhrase}');

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Uri getPath({required String path, required Map<dynamic, dynamic>? params}) {
    var paramString = "";
    if (params?.isNotEmpty ?? false) {
      params?.forEach((key, value) {
        paramString += '&$key=$value';
      });
    }
    return Uri.parse('${ApiConstants.BASE_URL}$path?api_key=${ApiConstants.API_KEY}$paramString');
  }
}
