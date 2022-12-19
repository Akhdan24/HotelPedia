import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/api_return_value.dart';
import '../signin_model.dart';

String baseUrl = 'https://admin.yuvan.dev/api/';

class UserServices {
  static Future<ApiReturnValue<User>?> getProfile(String token,
      {http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }
    String url = baseUrl + 'user';

    var response = await client.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try Again');
    }
    var data = jsonDecode(response.body);

    User value = User.fromJson(data['data']);
    return ApiReturnValue(value: value);
  }
}
