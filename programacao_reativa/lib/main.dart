//
// Flutterando - Programação Reativa em Flutter - Streams
//   Salvei o codigo anterior ao processo de implementação do bloc no arquivo main_rxdart.dart
//
import 'dart:async';

import 'package:rxdart/rxdart.dart';

import 'bloc.dart';

//
// Programação Reativa = Totalmente Assíncrona

main() {
  Bloc bloc = Bloc();

  // Adicionando texto aqui, antes do listen, ele vai substituir o sedado
  bloc.addtext("texto adicionado no bloc");

  // Stream - responsavel por escutar
  // Ouvinte / Stream recebida / ouvinte de Widget
  // Listener recebe um objeto StreamSubscription
  //  Notifica: Um dado sai do stream, erro ou stream fechado
  bloc.output.listen((String data) {
    print(data);
  });

  bloc.output2.listen((int data) {
    print(data);
  });

  bloc.addtext("Segundo texto adicionado no bloc");
}
