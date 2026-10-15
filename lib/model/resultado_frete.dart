class ResultadoFrete {
  final double valor;
  final int prazoDias;

  ResultadoFrete({
    required this.valor,
    required this.prazoDias,
  });

  ResultadoFrete copyWith({double? valor, int? prazoDias}) {
    return ResultadoFrete(
      valor: valor ?? this.valor,
      prazoDias: prazoDias ?? this.prazoDias,
    );
  }
}
