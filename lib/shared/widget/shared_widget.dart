import 'package:ani_going/constant/AppColor.dart';
import 'package:flutter/material.dart';

class SharedWidget {
  static Widget widgetLoading() {
    return const CircularProgressIndicator(
      color: AppColor.primary,
    );
  }
}
