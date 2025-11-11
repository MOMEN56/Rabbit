import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:Rabbit/core/utils/app_assets.dart';
import 'package:Rabbit/core/utils/app_colors.dart';
import 'package:Rabbit/core/utils/app_dimensions.dart';

class CustomContainer extends StatelessWidget {
  final String unit;
  final String data;
  final IconData? icon;
  final bool isClicked;
  final bool showGraph;

  const CustomContainer({
    super.key,
    required this.unit,
    required this.data,
    this.icon,
    this.isClicked = false,
    this.showGraph = false,
  });

  @override
  Widget build(BuildContext context) {
    AppDimensions.init(context);

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: AppDimensions.usableHeight * 0.20,
        width: AppDimensions.screenWidth * 0.44,
        decoration: BoxDecoration(
          gradient:
              isClicked
                  ? LinearGradient(
                    colors: [
                      Colors.blue[900]!,
                      Colors.blue[600]!,
                      Colors.lightBlue[300]!,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  )
                  : const LinearGradient(colors: [Colors.white, Colors.white]),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                if (icon != null)
                  Padding(
                    padding: EdgeInsets.only(top: 24.h, left: 12.h),
                    child: Container(
                      width: 48.sp,
                      height: 48.sp,
                      decoration: BoxDecoration(
                        color:
                            isClicked
                                ? AppColors.grey
                                : AppColors.backgroundColor,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(
                          icon,
                          size: 24.sp,
                          color: isClicked ? Colors.white : AppColors.blue,
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.only(
                    left: (icon != null ? 8.h : 24.h),
                    top: 24.h,
                  ),
                  child: Text(
                    unit,
                    style: GoogleFonts.manrope(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: isClicked ? Colors.white : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.h, top: 8.h),
              child: Text(
                data,
                style: GoogleFonts.manrope(
                  fontSize: data.length < 14 ? 28.sp : 22.sp,
                  color: isClicked ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow:
                    data.length > 18
                        ? TextOverflow.ellipsis
                        : TextOverflow.visible,
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: AppDimensions.width(0.14),
                  height: AppDimensions.usableHeight * 0.06,
                  child:
                      showGraph
                          ? Lottie.asset(AppAssets.graph, repeat: false)
                          : Container(),
                ),
                SizedBox(
                  width: AppDimensions.width(0.14),
                  height: AppDimensions.usableHeight * 0.06,
                  child:
                      showGraph
                          ? Lottie.asset(AppAssets.graph, repeat: false)
                          : Container(),
                ),
                SizedBox(
                  width: AppDimensions.width(0.14),
                  height: AppDimensions.usableHeight * 0.06,
                  child:
                      showGraph
                          ? Lottie.asset(AppAssets.graph, repeat: false)
                          : Container(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
