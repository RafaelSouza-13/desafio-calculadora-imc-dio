class Pessoa {
  String? _nome;
  double? _peso;
  double? _altura;
  double? _imc;
  Pessoa(
    String nome,
    String peso,
    String altura,
  ) {
    _nome = _validaNome(nome);
    _peso = _validaPeso(peso);
    _altura = _validaAltura(altura);
    _imc = _calcularIMC();
  }

  String _validaNome(String nome) {
    nome = nome.trim();
    if (nome == "") {
      throw ArgumentError('Não é aceito o campo nome como vazio');
    }
    return nome;
  }

  String get nome {
    return _nome!;
  }

  setNome(String nome) {
    nome = _validaNome(nome);
    _nome = nome;
  }

  double _validaPeso(String peso) {
    double? valor = double.tryParse(peso);
    if (valor == null) {
      throw ArgumentError(
          'Não é aceito o campo peso entrada nula ou com caracteres');
    } else {
      if (valor <= 0) {
        throw ArgumentError('Não é aceito peso igual ou menor que zero');
      }
      return valor;
    }
  }

  setPeso(String peso) {
    double valor = _validaPeso(peso);
    _peso = valor;
  }

  double get peso {
    return _peso!;
  }

  double _validaAltura(String altura) {
    double? valor = double.tryParse(altura);
    if (valor == null) {
      throw ArgumentError(
          'Não é aceito o campo altura entrada nula ou com caracteres');
    } else {
      if (valor <= 0) {
        throw ArgumentError('Não é aceito altura igual ou menor que zero');
      }
      return valor;
    }
  }

  double get altura {
    return _altura!;
  }

  setAltura(String altura) {
    double valor = _validaAltura(altura);
    _altura = valor;
  }

  double _calcularIMC() {
    return peso / (altura * altura);
  }

  double get imc {
    return _imc!;
  }

  String classificacao() {
    String imcFormatado = imc.toStringAsFixed(2);
    String info = "IMC: $imcFormatado, Classificação:";
    if (imc < 16) {
      return '$info Magreza grave';
    } else if (imc < 17) {
      return '$info Magreza moderada';
    } else if (imc < 18.5) {
      return '$info Magreza leve';
    } else if (imc < 25) {
      return '$info Saudavel';
    } else if (imc < 30) {
      return '$info Sobrepeso';
    } else if (imc < 35) {
      return '$info Obesidade grau I';
    } else if (imc < 40) {
      return '$info Obesidade grau II (severa)';
    } else {
      return '$info Obesidade grau III (morbida)';
    }
  }
}
