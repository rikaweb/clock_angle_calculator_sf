import 'time.dart' as time;

/// Calculate the angle between hands
double calculateAngleBetweenClock(time.Time time) {
  /// Based on https://www.omnicalculator.com/math/clock-angle
  /// A 12 Hour clock hour hand makes a full turn in 12 hours. It means that each hour, it moves by 30 degrees.
  /// But the hour hand doesn't move once every hour! Each minute, it moves by half a degree. So for a 24 Hour clock
  /// hour hand Move 0.25 degrees per minutes and 15 degrees per hour.
  /// The minute hand rotates completely in 60 minutes. So, every minute it moves by 6 degrees.
  ///
  /// Anglehrs (aH) = 15° * number of hours + 0.25° * number of minutes,
  /// Anglemins(aM) = 6° * number of minutes

  double aH = (15 * time.hours) + (0.25 * time.minutes);

  int aM = 6 * time.minutes;

  // Lastly, find two clock angles. To find the first one, subtract the smaller angle form the bigger one. In other words, find the absolute value of the difference of two angles:
  return (aH - aM).abs();
}
