import 'package:flutter_test/flutter_test.dart';
import 'package:opennutritracker/core/utils/validator/input_validator.dart';

void main() {
  group('OnboardingInputValidator - MC/DC Tests', () {
    const isImperial = false; // Pode ser true, tanto faz para lógica de fluxo

    // CT1: Todas entradas válidas
    test('CT1 - Todas entradas válidas', () {
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

    // CT2: Altura inválida
    test('CT2 - Altura inválida', () {
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

    // CT3: Peso inválido
    test('CT3 - Peso inválido', () {
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

    // CT4: Altura nula
    test('CT4 - Altura nula', () {
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

    // CT5: Peso nulo
    test('CT5 - Peso nulo', () {
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