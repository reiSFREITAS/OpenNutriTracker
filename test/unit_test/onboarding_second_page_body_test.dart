import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:opennutritracker/generated/l10n.dart';
import 'package:opennutritracker/core/validators/weight_validator.dart';

void main() {
  testWidgets('Método validateWeight existe e retorna algo', (tester) async {
    String? result;

    final widget = MaterialApp(
      localizationsDelegates: const [S.delegate],
      home: Builder(
        builder: (context) {
          result = validateWeight('42', context); // ainda nem existe
          return const SizedBox.shrink();
        },
      ),
    );

    await tester.pumpWidget(widget);
    expect(result, isNull); // esperamos algo válido por enquanto
  });

  testWidgets('Peso menor ou igual a 10 deve ser inválido', (tester) async {
  String? result;

  final widget = MaterialApp(
    localizationsDelegates: const [S.delegate],
    home: Builder(
      builder: (context) {
        result = validateWeight('10', context);
        return const SizedBox.shrink();
      },
    ),
  );

  await tester.pumpWidget(widget);
  expect(result, isNotNull); 
});
}

