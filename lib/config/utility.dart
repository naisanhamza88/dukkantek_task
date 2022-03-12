import 'package:connectivity/connectivity.dart';
import 'package:dukkantek_task/config/ui_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

mixin Utility {
  Future<bool> checkInternetConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // connected
      return true;
    } else if (connectivityResult == ConnectivityResult.none) {
      // not connected
      return false;
    } else {
      return false;
    }
  }

  void onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      callback();
    });
  }

  void showToast(BuildContext context, String msg) {
    final FToast fToast = FToast();
    fToast.init(context);
    fToast.showToast(
        child: Container(
            decoration: const BoxDecoration(
                color: accentColor,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 15.w,
                ),
                Expanded(
                  child: Text(
                    msg,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ],
            )),
        toastDuration: const Duration(seconds: 2),
        gravity: ToastGravity.BOTTOM);
  }
}
