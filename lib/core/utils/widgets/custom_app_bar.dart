import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rabbit/core/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;

  const CustomAppBar({
    super.key,
    this.showBackButton = true,
  }); // ← افتراضيًا يظهر الزر

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      automaticallyImplyLeading: showBackButton, // ← يتحكم في إظهار زر الرجوع
      title: Text(
        "Speed Test",
        style: GoogleFonts.manrope(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
