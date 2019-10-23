import 'package:rxdart/rxdart.dart';

class Bloc {
  // Recebe um dado e avisa ou ouvintes
  // Qualquer tipo de dado - Exemplo:	value,	event,	object,	collec5on,	map,	error	ou até	outro	Stream.
  // Broadcast vai permitir mais de um ouvinte para o mesmo StreamController
//  StreamController<String> controller = StreamController<String>.broadcast();

  // Substituindo o Stream Controller pelo rxDart
  //   seeded - um construtor/factory usado para definir um valor inicial a enviar

  // Usa a Estrutura de Get do Flutter para criar uma arrwo function
  BehaviorSubject<String> _controller =
      BehaviorSubject<String>.seeded("Envio sedado");

  // Stream é fluxo de dado - > meu Approach -> braços do rio que corre
  // Stream é um Duto (pipe) com dois extremos: uma entrada e uma saída.
  Stream<String> get output => _controller.stream;

  // Map serve para transformar dado em outro
  //  neste caso pega o String data e transforma em inteiro para retornar
  Stream<int> get output2 => _controller.stream.map((data) => data.length);

  // Entrada dos dados -> Meu Approach => Piscina onde vamos afundar dados, vira um valor padrão do sink

  Sink<String> get input => _controller.sink;

// Add  -> corresponde a sink.add
//   controller.add("Um texto enviado");
//   * Dados enviados antes de assinar Listener serão perdidos
  addtext(String texto) {
    input.add(texto);
  }
}
