import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSnackBar {
  static void showConnected(BuildContext context) {
    _clearAndShow(context, message: "Connected", color: Colors.green);
  }

  static void showNoAccess(BuildContext context) {
    _clearAndShow(
      context,
      message: "This network has no internet access",
      color: Colors.orange,
    );
  }

  static void showDisconnected(BuildContext context) {
    _clearAndShow(context, message: "Disconnected", color: Colors.red);
  }

  static void _clearAndShow(
    BuildContext context, {
    required String message,
    required Color color,
  }) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.clearSnackBars();
    messenger.showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: color.withOpacity(0.95),
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.r),
        ),
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      ),
    );
  }
}
