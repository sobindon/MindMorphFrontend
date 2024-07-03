String getFormatedTime({required double seconds}) {
  int totalSeconds = seconds.toInt();

  int min = totalSeconds ~/ 60;
  int sec = totalSeconds % 60;
  // if (min == 0)
  //   return '     $sec s';
  // else if (min < 10) return ' $min m $sec s';
  return '$min m $sec s';
}
