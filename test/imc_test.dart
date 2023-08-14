import 'package:imc/pessoa.dart';
import 'package:test/test.dart';

void main() {
  group('Testar instancias da classe pessoa', () {
    test('Criar pessoa com valores válidos', () {
      final pessoa = Pessoa('Alice', "50", "1.60");
      expect(pessoa.nome, 'Alice');
      expect(pessoa.peso, 50);
      expect(pessoa.altura, 1.60);
    });
    test('Criar pessoa com nome somente com espaços em branco', () {
      expect(() => Pessoa("      ", "50", "1.60"),
          throwsA(TypeMatcher<ArgumentError>()));
    });

    test('Criar pessoa com altura somente com espaços em branco', () {
      expect(() => Pessoa("Alice", "   ", "1.60"),
          throwsA(TypeMatcher<ArgumentError>()));
    });

    test('Criar pessoa com altura igual a zero', () {
      expect(() => Pessoa("Alice", "0", "1.60"),
          throwsA(TypeMatcher<ArgumentError>()));
    });

    test('Criar pessoa com peso somente com espaços em branco', () {
      expect(() => Pessoa("Alice", "50", "   "),
          throwsA(TypeMatcher<ArgumentError>()));
    });

    test('Criar pessoa com peso igual a zero', () {
      expect(() => Pessoa("Alice", "50", "0"),
          throwsA(TypeMatcher<ArgumentError>()));
    });

    test('Teste imc correto', () {
      final pessoa = Pessoa("Teste", "80", "1.65");
      expect(pessoa.classificacao(), 'IMC: 29.38, Classificação: Sobrepeso');
    });
  });
}
