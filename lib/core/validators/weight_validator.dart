import 'package:flutter/material.dart';
import 'package:opennutritracker/generated/l10n.dart';

double? parseWeight(String? input) {
  if (input == null || input.isEmpty) return null;
  return double.tryParse(input.replaceAll(',', '.'));
}

String? validateWeight(String? value, BuildContext context) {
  final parsed = parseWeight(value);

  if (parsed == null || parsed <= 10) {
    return S.of(context).onboardingWrongWeightLabel;
  }

  return null;
}