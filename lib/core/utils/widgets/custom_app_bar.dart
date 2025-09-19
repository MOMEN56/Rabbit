import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rabbit/core/utils/app_colors.dart';
import 'package:rabbit/features/home/presentation/manager/cubits/internet%20settings%20cubit/internet_settings_cubit.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool cancelIcon;
  const CustomAppBar({super.key, this.cancelIcon = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      title: Text(
        "Speed Test",
        style: GoogleFonts.manrope(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      actions:
          cancelIcon
              ? [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.close_sharp,
                      color: Colors.black,
                      size: 32.sp,
                    ),
                    onPressed: () {
                      final cubit = context.read<InternetSettingsCubit>();
                      cubit.cancelTest(); // 👈 يوقف أي اختبار شغال
                      cubit.reset(); // 👈 يرجع الحالة للوضع الافتراضي
                    },
                  ),
                ),
              ]
              : [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
