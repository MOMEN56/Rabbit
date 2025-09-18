class FormatHelper {
  static String formatSpeed(double speed) {
    if (speed >= 1024) {
      return '${(speed / 1024).toStringAsFixed(2)} Gbps';
    } else {
      return '${speed.toStringAsFixed(2)} Mbps';
    }
  }
}
