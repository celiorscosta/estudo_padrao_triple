import 'package:mobx_triple/mobx_triple.dart';

class HomeStore extends MobXStore<Exception, Dados> {
  HomeStore() : super(Dados(qualquerValor: '', valor: 0));

  Future<void> increment() async {
    setLoading(true);

    await Future.delayed(const Duration(seconds: 1));

    int value = state.valor + 1;

    var data = Dados(
      valor: value,
      qualquerValor: _teste(value),
    );

    if (value <= 5) {
      update(data);
    } else {
      setError(Exception('Error: state not can be > 5'));
    }

    setLoading(false);
  }

  String _teste(value) {
    if (value < 3) {
      return 'Valor maior que 1';
    } else if (value >= 3 && value < 5) {
      return 'Valor é maior ou igual a 3';
    } else if (value == 5) {
      return 'Limite atingido';
    } else {
      return 'Opa';
    }
  }
}

class Dados {
  String qualquerValor;
  int valor;

  Dados({
    required this.qualquerValor,
    required this.valor,
  });
}
