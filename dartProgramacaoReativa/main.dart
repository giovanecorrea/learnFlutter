//
// Flutterando - Programação Reativa em Flutter - Streams
//
import 'dart:async';

//
// Programação Reativa = Totalmente Assíncrona

main() {
  // Recebe um dado e avisa ou ouvintes
  // Broadcast vai permitir mais de um ouvinte para o mesmo StreamController
  StreamController<String> controller = StreamController<String>.broadcast();
  Stream<String> output = controller.stream;

  // Map serve para transformar dado em outro
  //  neste caso pega o String data e transforma em inteiro para retornar
  Stream<int> output2 = controller.stream.map((data) => data.length);

  // Stream - responsavel por escutar
  // Ouvinte / Stream recebida / ouviente de Widget
  output.listen((String data) {
    print(data);
  });

  output2.listen((int data) {
    print(data);
  });

  controller.add("Um texto enviado");
}
