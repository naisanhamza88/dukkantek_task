import 'package:dukkantek_task/config/ui_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget getTextField(
    {required TextEditingController controller,
    required BuildContext context,
    required String hint,
    String? errorMsg,
    Icon? icon,
    bool? obscureText,
    void Function()? onIconPressed}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: TextFormField(
      cursorColor: mainDarkColor,
      keyboardType: TextInputType.text,
      obscureText: obscureText ?? false,
      textInputAction: TextInputAction.next,
      controller: controller,
      maxLines: 1,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        hintText: hint,
        hintStyle:
            Theme.of(context).textTheme.headline6?.copyWith(fontSize: 40.sp),
        suffixIcon: IconButton(
          icon: icon ??
              const Icon(
                Icons.person,
                color: mainColor,
              ),
          onPressed: () {
            if(onIconPressed!=null) {
              onIconPressed();
            }
          },
        ),
        errorText: errorMsg ?? '',
        errorMaxLines: 2,
        errorStyle:
            Theme.of(context).textTheme.headline6?.copyWith(fontSize: 30.sp,
                color: Colors.red),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Color(0xfff0f1f5), width: 0, style: BorderStyle.none),
          borderRadius: border,
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Color(0xfff0f1f5), width: 0, style: BorderStyle.none),
          borderRadius: border,
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Color(0xfff0f1f5), width: 0, style: BorderStyle.none),
          borderRadius: border,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Color(0xfff0f1f5), width: 0, style: BorderStyle.none),
          borderRadius: border,
        ),
      ),
      style: Theme.of(context).textTheme.headline5?.copyWith(fontSize: 40.sp),
    ),
  );
}
