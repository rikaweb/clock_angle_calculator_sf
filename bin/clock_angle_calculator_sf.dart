import 'dart:convert';
import 'dart:io';
import 'package:clock_angle_calculator_sf/clock_angle_calculator_sf.dart';
import 'package:clock_angle_calculator_sf/user_input_validator.dart';

void main(List<String> arguments) {
  bool resetStatus = true;

  while (resetStatus) {
    resetStatus = false;

    /// Print welcome message
    print(
      '''
  Please enter the time in the format of HH:MM
      ''',
    );

    /// user input validation
    ValidateUserInput vui = ValidateUserInput(stdin.readLineSync(
      encoding: utf8,
    ));
    if (vui.validateInput != null) {
      print(vui.validateInput);
      resetStatus = true;
    }

    if (!resetStatus) {
      // Calculate the angle
      print(
        'The angle between the hour hand and the minute hand equals: ${calculateAngleBetweenClock(vui.convertToTime)}',
      );
    }
  }
}
