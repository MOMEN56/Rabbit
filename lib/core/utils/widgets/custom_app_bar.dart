import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rabbit/core/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;
  final bool cancelIcon;
  const CustomAppBar({
    super.key,
    this.showBackButton = true,
    this.cancelIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      automaticallyImplyLeading: showBackButton,
      title: Text(
        "Speed Test",
        style: GoogleFonts.manrope(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: Icon(Icons.close_sharp, color: Colors.black, size: 32.sp),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
