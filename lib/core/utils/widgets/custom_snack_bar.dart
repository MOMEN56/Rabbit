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

<<<<<<< HEAD
=======
  static void showcancelled(BuildContext context) {
    _clearAndShow(context, message: "Test is cancelled", color: Colors.grey);
  }

>>>>>>> ead6508 (add button to appbar)
  static void _clearAndShow(
    BuildContext context, {
    required String message,
    required Color color,
  }) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.clearSnackBars(); // يمسح أي سناك بار قديم

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

        // 🎨 الشكل الخارجي للسناك بار
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.r),
        ),
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      ),
    );
  }
}
