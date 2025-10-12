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
                  padding: EdgeInsets.only(right: 16.w, top: 8.h),
                  child: GestureDetector(
                    onTap: () {
                      final cubit = context.read<InternetSettingsCubit>();
                      cubit.cancelTest();
                    },
                    child: Container(
                      width: 60.sp,
                      height: 60.sp,
                      decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(
                          Icons.close_sharp,
                          size: 28.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ]
              : [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
