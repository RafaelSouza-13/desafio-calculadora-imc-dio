import 'dart:convert';
import 'dart:io';
// import 'package:imc/leitura_dados.dart';
import 'package:imc/pessoa.dart';

void main(List<String> arguments) {
  Pessoa? pessoa;
  while (pessoa == null) {
    // Foi criada uma função e ajustada, porém preferi retornar e deixar dessa maneira
    // Map<String, String?> dados = leituraDados();
    stdout.write("Digite seu nome: ");
    String? nome = stdin.readLineSync(encoding: utf8);
    stdout.write("Digite sua altura: ");
    String? altura = stdin.readLineSync(encoding: utf8);
    stdout.write("Digite seu peso: ");
    String? peso = stdin.readLineSync(encoding: utf8);
    if (nome != null && altura != null && peso != null) {
      try {
        pessoa = Pessoa(nome, peso, altura);
      } on ArgumentError catch (e) {
        print(e);
        stdout.writeln('Tente novamente');
      }
    }
  }
  stdout.writeln(pessoa.classificacao());
}
