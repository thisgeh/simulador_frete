import 'package:simulador_frete/model/resultado_frete.dart';
import 'package:simulador_frete/model/tipo_frete.dart';

class CalculadoraFrete {
  ResultadoFrete calcular({
    required TipoFrete tipo,
    required double peso,
    required double distanciaKm,
    required double valorCompra,
  }) {
    late ResultadoFrete resultado;

    if (peso <= 0) {
      throw ArgumentError("O peso deve ser maior que zero.");
    }

    if (distanciaKm <= 0) {
      throw ArgumentError("A distância deve ser maior que zero.");
    }
    switch (tipo) {
      case TipoFrete.economico:
        resultado = ResultadoFrete(
          valor: 8 + peso * 2 + distanciaKm * 0.10,
          prazoDias: 5,
        );
      case TipoFrete.expresso:
        resultado = ResultadoFrete(
          valor: 15 + peso * 4 + distanciaKm * 0.25,
          prazoDias: 2,
        );
      case TipoFrete.retirada:
        resultado = ResultadoFrete(
          valor: 0,
          prazoDias: 1,
        );
    }

    if (valorCompra >= 300.0) {
      return resultado.copyWith(valor: 0.0);
    }

    return resultado;
  }
}
