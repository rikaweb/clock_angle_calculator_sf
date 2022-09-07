import 'time.dart' as time;
import 'constants.dart';

/// Validation of input
class ValidateUserInput {
  final String? userInput;
  ValidateUserInput(this.userInput);
  int? hh;
  int? mm;
  String? get validateInput {
    //check for null input
    if (userInput == null || userInput!.isEmpty) {
      return kNothingEntered;
    } //check for correct Syntax with :
    else if (userInput!.contains(":") == false) {
      return kIncorrectTimeSyntax;
    } else {
      hh = int.tryParse(userInput!.substring(0, userInput!.indexOf(":")));
      mm = int.tryParse(userInput!.substring(userInput!.indexOf(":") + 1));
      if (hh == null || mm == null) {
        return kIncorrectTimeIntValue;
      } //check HH to be smaller than 24
      else if (hh! > 23) {
        return kIncorrectTimeHourValue;
      } //check MM to be smaller than 60
      else if (mm! > 59) {
        return kIncorrectTimeMinValue;
      } //check for nagetive value on input
      else if (hh! < 0 || mm! < 0) {
        return kIncorrectTimeNegativeValue;
      } //return null if all valifation passed
      else {
        return null;
      }
    } //check for have HH and MM
  }

  /// Conver input(HH:MM) to time  class
  time.Time get convertToTime => time.Time(
        int.parse(userInput!.substring(0, userInput!.indexOf(":"))),
        int.parse(userInput!.substring(userInput!.indexOf(":") + 1)),
      );
}
