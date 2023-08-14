import 'dart:convert';
import 'dart:io';

Map<String, String?> leituraDados() {
  stdout.write("Digite seu nome: ");
  String? nome = stdin.readLineSync(encoding: utf8);
  stdout.write("Digite sua altura: ");
  String? altura = stdin.readLineSync(encoding: utf8);
  stdout.write("Digite seu peso: ");
  String? peso = stdin.readLineSync(encoding: utf8);
  return {'nome': nome, 'altura': altura, 'peso': peso};
}
