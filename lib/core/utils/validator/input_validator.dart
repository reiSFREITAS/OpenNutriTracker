import 'package:opennutritracker/core/utils/calc/unit_calc.dart';

class OnboardingInputValidator {
  static ({bool valid, double? heightCm, double? weightKg}) checkCorrectInput({
    required double? parsedHeight,
    required double? parsedWeight,
    required bool isHeightValid,
    required bool isWeightValid,
    required bool isImperial,
  }) {
    // onboarding input validator 
    if (isHeightValid && isWeightValid) {
      if (parsedHeight != null && parsedWeight != null) {
        final heightCm =
            isImperial ? UnitCalc.feetToCm(parsedHeight) : parsedHeight;
        final weightKg =
            isImperial ? UnitCalc.lbsToKg(parsedWeight) : parsedWeight;

        return (valid: true, heightCm: heightCm, weightKg: weightKg);
      } else {
        return (valid: false, heightCm: null, weightKg: null);
      }
    } else {
      return (valid: false, heightCm: null, weightKg: null);
    }
  }
}