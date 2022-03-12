import 'package:dukkantek_task/config/utility.dart';
import 'package:dukkantek_task/network/api_request_helper.dart';

class BaseRepository with Utility{
  ApiRequestHelper client = ApiRequestHelper.getApiRequestHelper();

}