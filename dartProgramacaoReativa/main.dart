import 'dart:async';

//
// Programação Reativa = Totalmente Assíncrona

main() {
  // Recebe um dado e avisa ou ouvintes
  StreamController controller = StreamController();

  // Stream - responsavel por escutar
  // Ouvinte / Stream recebida / ouviente de Widget
  controller.stream.listen((data) {
    print(data);
  });

  controller.add("Um texto enviado");
}
