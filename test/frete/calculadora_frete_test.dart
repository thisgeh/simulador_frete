import 'package:flutter_test/flutter_test.dart';
import 'package:simulador_frete/frete/calculadora_frete.dart';
import 'package:simulador_frete/model/tipo_frete.dart';

void main() {
  final CalculadoraFrete calculadoraFrete = CalculadoraFrete();

  test('frete economico deve calcular valor pelo peso e pela distancia', () {
    // ARRANGE
    const peso = 2.0;
    const distanciaKm = 100.0;
    const valorCompra = 1.0;

    // ACT
    final resultado = calculadoraFrete.calcular(
      tipo: TipoFrete.economico,
      peso: peso,
      distanciaKm: distanciaKm,
      valorCompra: valorCompra,
    );

    // Assert
    expect(resultado.valor, closeTo(22.0, 0.01));
  });

  test('frete expresso deve calcular valor pelo peso e distancia', () {
    const peso = 2.0;
    const distanciaKm = 100.0;
    const valorCompra = 1.0;

    final resultado = calculadoraFrete.calcular(
      tipo: TipoFrete.expresso,
      peso: peso,
      distanciaKm: distanciaKm,
      valorCompra: valorCompra,
    );

    expect(resultado.valor, closeTo(48.0, 0.01));
  });

  test('peso zero deve gerar erro', () {
    expect(
      () => calculadoraFrete.calcular(
        tipo: TipoFrete.economico,
        peso: 0.0,
        distanciaKm: 100.0,
        valorCompra: 1.0,
      ),
      throwsArgumentError,
    );
  });

  test('peso negativo deve gerar erro', () {
    expect(
      () => calculadoraFrete.calcular(
        tipo: TipoFrete.economico,
        peso: -1.0,
        distanciaKm: 100.0,
        valorCompra: 1.0,
      ),
      throwsArgumentError,
    );
  });

  test('distancia zero deve gerar erro', () {
    expect(
      () => calculadoraFrete.calcular(
        tipo: TipoFrete.economico,
        peso: 2.0,
        distanciaKm: 0.0,
        valorCompra: 1.0,
      ),
      throwsArgumentError,
    );
  });

  test('compra de 350 deve possuir frete grátis no economico', () {
    const peso = 2.0;
    const distanciaKm = 100.0;
    const valorCompra = 350.0;

    final resultado = calculadoraFrete.calcular(
      tipo: TipoFrete.economico,
      peso: peso,
      distanciaKm: distanciaKm,
      valorCompra: valorCompra,
    );

    expect(resultado.valor, closeTo(0.0, 0.01));
  });

  test('compra de 299 deve cobrar o valor do frete no economico', () {
    const peso = 2.0;
    const distanciaKm = 100.0;
    const valorCompra = 299.0;

    final resultado = calculadoraFrete.calcular(
      tipo: TipoFrete.economico,
      peso: peso,
      distanciaKm: distanciaKm,
      valorCompra: valorCompra,
    );

    expect(resultado.valor, closeTo(22.0, 0.01));
  });

  test('compra de 300 deve possuir frete grátis no economico', () {
    const peso = 2.0;
    const distanciaKm = 100.0;
    const valorCompra = 300.0;

    final resultado = calculadoraFrete.calcular(
      tipo: TipoFrete.economico,
      peso: peso,
      distanciaKm: distanciaKm,
      valorCompra: valorCompra,
    );

    expect(resultado.valor, closeTo(0.0, 0.01));
  });
}
