// Project imports:


import 'package:dukkantek_task/model/login_response.dart';

/// Created By: Hamza 14/9/2020
class MainResponse<T> {
  String? responseMessage;

  String? responseCode;

  String? messageCode;

  dynamic data;

  MainResponse(
      {this.responseMessage, this.responseCode, this.messageCode, this.data});

  factory MainResponse.fromJson(Map<String, dynamic> json) {
    final MainResponse<T> mainResponse = MainResponse<T>();
    mainResponse.responseMessage = json['MESSAGE'];
    mainResponse.responseCode = json['CODE'];
    mainResponse.messageCode = json['MESSAGECODE'];
    if (T == LoginResponse) {
      mainResponse.data = LoginResponse.fromJson(json['DATA']);
    } else {
      mainResponse.data = json['DATA'];
    }
    return mainResponse;
  }

  Map<String, dynamic> mainResponseToJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CODE'] = responseCode;
    data['MESSAGE'] = responseMessage;
    data['MESSAGECODE'] = messageCode;
    if (this.data != null) {
      data['DATA'] = this.data;
    }
    return data;
  }
}
