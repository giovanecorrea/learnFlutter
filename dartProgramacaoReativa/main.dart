//
// Flutterando - Programação Reativa em Flutter - Streams
//
import 'dart:async';

//
// Programação Reativa = Totalmente Assíncrona

main() {
  // Recebe um dado e avisa ou ouvintes
  // Qualquer tipo de dado - Exemplo:	value,	event,	object,	collec5on,	map,	error	ou até	outro	Stream.
  // Broadcast vai permitir mais de um ouvinte para o mesmo StreamController
  StreamController<String> controller = StreamController<String>.broadcast();

  // Stream é fluxo de dado - > meu Approach -> braços do rio que corre
  // Stream é um Duto (pipe) com dois extremos: uma entrada e uma saída.
  Stream<String> output = controller.stream;

  // Map serve para transformar dado em outro
  //  neste caso pega o String data e transforma em inteiro para retornar
  Stream<int> output2 = controller.stream.map((data) => data.length);

  // Entrada dos dados -> Meu Approach => Piscina onde vamos afundar dados
  Sink<String> input = controller.sink;

// Add  -> corresponde a sink.add
//   controller.add("Um texto enviado");
//   * Dados enviados antes de assinar Listener serão perdidos
  input.add("Um texto enviado");
  input.add("Segungo envio de texto");

  // Stream - responsavel por escutar
  // Ouvinte / Stream recebida / ouvinte de Widget
  // Listener recebe um objeto StreamSubscription
  //  Notifica: Um dado sai do stream, erro ou stream fechado
  output.listen((String data) {
    print(data);
  });

  output2.listen((int data) {
    print(data);
  });
}
