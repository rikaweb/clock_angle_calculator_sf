import 'package:clock_angle_calculator_sf/clock_angle_calculator_sf.dart';
import 'package:clock_angle_calculator_sf/constants.dart';
import 'package:clock_angle_calculator_sf/user_input_validator.dart';
import 'package:clock_angle_calculator_sf/time.dart' as time;
import 'package:test/test.dart';

void main() {
  /// Test the input validator
  test('Testing Input Validation', () {
    // Test for blank
    expect(
      ValidateUserInput(null).validateInput,
      kNothingEntered,
    );

    // Test for empty String
    expect(
      ValidateUserInput("").validateInput,
      kNothingEntered,
    );

    // Test for illegal int input
    expect(
      ValidateUserInput("1234").validateInput,
      kIncorrectTimeSyntax,
    );

    // Test for illegal String input
    expect(
      ValidateUserInput("this is not a time").validateInput,
      kIncorrectTimeSyntax,
    );
    expect(
      ValidateUserInput("mm:hh").validateInput,
      kIncorrectTimeIntValue,
    );

    // Test for illegal time input
    expect(
      ValidateUserInput("26:26").validateInput,
      kIncorrectTimeHourValue,
    );
    expect(
      ValidateUserInput("12:61").validateInput,
      kIncorrectTimeMinValue,
    );
    expect(
      ValidateUserInput("-10:00").validateInput,
      kIncorrectTimeNegativeValue,
    );
    expect(
      ValidateUserInput("10:-5").validateInput,
      kIncorrectTimeNegativeValue,
    );

    // Test for valid time input
    expect(
      ValidateUserInput("10:30").validateInput,
      null,
    );
  });

  /// Test the input validator
  test('Calculating the time', () {
    // Test for valid time input
    expect(
      calculateAngleBetweenClock(time.Time(00, 00)),
      00,
    );
    expect(
      calculateAngleBetweenClock(time.Time(06, 00)),
      90,
    );
    expect(
      calculateAngleBetweenClock(time.Time(24, 00)),
      360,
    );
    expect(
      calculateAngleBetweenClock(time.Time(16, 20)),
      125,
    );
  });
}
