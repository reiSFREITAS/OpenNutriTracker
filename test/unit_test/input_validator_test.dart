import 'package:flutter_test/flutter_test.dart';
import 'package:opennutritracker/core/utils/validator/input_validator.dart';

void main() {
  group('OnboardingInputValidator - MC/DC test', () {
    const isImperial = false; 

    test('CT1 - All valid inputs', () {
      final result = OnboardingInputValidator.checkCorrectInput(
        parsedHeight: 170.0,
        parsedWeight: 70.0,
        isHeightValid: true,
        isWeightValid: true,
        isImperial: isImperial,
      );

      expect(result.valid, true);
      expect(result.heightCm, 170.0);
      expect(result.weightKg, 70.0);
    });

    test('CT2 - Invalid height', () {
      final result = OnboardingInputValidator.checkCorrectInput(
        parsedHeight: 170.0,
        parsedWeight: 70.0,
        isHeightValid: false,
        isWeightValid: true,
        isImperial: isImperial,
      );

      expect(result.valid, false);
      expect(result.heightCm, null);
      expect(result.weightKg, null);
    });
    test('CT3 - Invalid weight', () {
      final result = OnboardingInputValidator.checkCorrectInput(
        parsedHeight: 170.0,
        parsedWeight: 70.0,
        isHeightValid: true,
        isWeightValid: false,
        isImperial: isImperial,
      );

      expect(result.valid, false);
      expect(result.heightCm, null);
      expect(result.weightKg, null);
    });

    test('CT4 - Null height', () {
      final result = OnboardingInputValidator.checkCorrectInput(
        parsedHeight: null,
        parsedWeight: 70.0,
        isHeightValid: true,
        isWeightValid: true,
        isImperial: isImperial,
      );

      expect(result.valid, false);
      expect(result.heightCm, null);
      expect(result.weightKg, null);
    });

    test('CT5 - Null weight', () {
      final result = OnboardingInputValidator.checkCorrectInput(
        parsedHeight: 170.0,
        parsedWeight: null,
        isHeightValid: true,
        isWeightValid: true,
        isImperial: isImperial,
      );
      expect(result.valid, false);
      expect(result.heightCm, null);
      expect(result.weightKg, null);
    });
  });
}