// Dart imports:
import 'dart:convert';
import 'dart:developer';

// Package imports:
import 'package:http/http.dart';
import 'network_exception.dart';

class ApiRequestHelper {
  static ApiRequestHelper? _webServicesClient;
  final Client _client = Client();

  // BaseEnvironmentRepository Constant = getIt<BaseEnvironmentRepository>();

  static ApiRequestHelper getApiRequestHelper() {
    return _webServicesClient ??= ApiRequestHelper();
  }

  Future<dynamic> postRequest({
    required String args,
  }) async {
    dynamic responseJson;
    Response response;
    String baseUrl = '';
    try {
      response = await _client.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {'args': args},
      );

      log(args);

      log(response.body);
      responseJson = _returnResponse(response);
      return responseJson;
    } catch (e) {
      log('postRequest Exception Error : $e');
      return responseJson;
    }
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        final responseJson = json.decode(response.body);
        log('$responseJson');
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : '
            '${response.statusCode}');
    }
  }
}
