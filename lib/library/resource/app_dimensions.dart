class AppDimensions {
  static double ratio = 0;

  static double font(double unit) {
    return (AppDimensions.ratio * unit * 0.125) + unit * 1.90;
  }
}
