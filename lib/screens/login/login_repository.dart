import 'dart:convert';
import 'dart:developer';

import 'package:dukkantek_task/base/base_repository.dart';
import 'package:dukkantek_task/model/login_response.dart';

import '../../model/main_response.dart';

class LoginRepository extends BaseRepository {
  Future<MainResponse<LoginResponse>> login(
      {required userName, required password}) async {
    final Map<String, dynamic> argsData = {};
    argsData['userName'] = userName;
    argsData['password'] = password;

    final String args = argsData.toString();

    MainResponse<LoginResponse> loginResponse = MainResponse<LoginResponse>();
    try {
      final responseJson = await client.postRequest(args: args);
      loginResponse = MainResponse.fromJson(responseJson);
      return loginResponse;
    } catch (error) {
      log('subscriptionResponse Exception Error : ${error.toString()}');
      return loginResponse;
    }
  }
}
