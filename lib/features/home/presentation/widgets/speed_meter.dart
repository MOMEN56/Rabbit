import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SpeedMeter extends StatelessWidget {
  final double speed;

  const SpeedMeter({super.key, required this.speed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: SfRadialGauge(
                enableLoadingAnimation: true,
                animationDuration: 2500,
                axes: <RadialAxis>[
                  RadialAxis(
                    axisLineStyle: const AxisLineStyle(
                      thicknessUnit: GaugeSizeUnit.factor,
                      thickness: 0.15,
                    ),
                    radiusFactor: 0.9,
                    showTicks: false,
                    showLastLabel: true,
                    maximum: 100, // الحد الأقصى
                    axisLabelStyle: GaugeTextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: GoogleFonts.manrope().fontFamily,
                    ),
                    onCreateAxisRenderer: () => _CustomAxisRenderer(),
                    pointers: <GaugePointer>[
                      NeedlePointer(
                        enableAnimation: true,
                        gradient: const LinearGradient(
                          colors: <Color>[
                            Color.fromRGBO(203, 126, 223, 0),
                            Color(0xFF00a1ff),
                          ],
                          stops: <double>[0.25, 0.75],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        animationType: AnimationType.easeOutBack,
                        value: speed, // ✅ القيمة من الـ Cubit
                        animationDuration: 1300,
                        needleStartWidth: 4,
                        needleEndWidth: 8,
                        needleLength: 0.8,
                        knobStyle: const KnobStyle(knobRadius: 0),
                      ),
                      RangePointer(
                        value: speed, // ✅ نفس القيمة
                        width: 0.15,
                        sizeUnit: GaugeSizeUnit.factor,
                        color: const Color(0xFF00a1ff),
                        animationDuration: 1300,
                        animationType: AnimationType.easeOutBack,
                        gradient: const SweepGradient(
                          colors: <Color>[Color(0xFFc0e5fb), Color(0xFF166AF5)],
                          stops: <double>[0.25, 0.75],
                        ),
                        enableAnimation: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAxisRenderer extends RadialAxisRenderer {
  _CustomAxisRenderer() : super();

  @override
  List<CircularAxisLabel> generateVisibleLabels() {
    final List<CircularAxisLabel> visibleLabels = <CircularAxisLabel>[];
    for (num i = 0; i < 8; i++) {
      final double labelValue = _calculateLabelValue(i);
      final CircularAxisLabel label = CircularAxisLabel(
        axis.axisLabelStyle,
        labelValue.toInt().toString(),
        i,
        false,
      );
      label.value = labelValue;
      visibleLabels.add(label);
    }
    return visibleLabels;
  }

  @override
  double valueToFactor(double value) {
    if (value >= 0 && value <= 1) {
      return (value * 0.1428) / 1;
    } else if (value > 1 && value <= 5) {
      return (((value - 1) * 0.1428) / (5 - 1)) + (1 * 0.1428);
    } else if (value > 5 && value <= 10) {
      return (((value - 5) * 0.1428) / (10 - 5)) + (2 * 0.1428);
    } else if (value > 10 && value <= 20) {
      return (((value - 10) * 0.1428) / (20 - 10)) + (3 * 0.1428);
    } else if (value > 20 && value <= 50) {
      return (((value - 20) * 0.1428) / (50 - 20)) + (4 * 0.1428);
    } else if (value > 50 && value <= 75) {
      return (((value - 50) * 0.1428) / (75 - 50)) + (5 * 0.1428);
    } else if (value > 75 && value <= 100) {
      return (((value - 75) * 0.1428) / (100 - 75)) + (6 * 0.1428);
    } else {
      return 1;
    }
  }

  double _calculateLabelValue(num value) {
    if (value == 0) return 0;
    if (value == 1) return 1;
    if (value == 2) return 5;
    if (value == 3) return 10;
    if (value == 4) return 20;
    if (value == 5) return 50;
    if (value == 6) return 75;
    return 100;
  }
}
