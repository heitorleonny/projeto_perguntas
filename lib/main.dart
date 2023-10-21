import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final  List<Map<String, Object>> _perguntas = [
      {
        'texto': 'Qual é a sua cor favorita?',
        'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'],
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão'],
      },
      {
        'texto': 'Qual o seu instrutor favorito?',
        'respostas': ['Maria', 'João', 'Leo', 'Pedro'],
      },
    ];
  

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  Widget build(BuildContext context) {
    
    List<String> respostas = temPerguntaSelecionada? _perguntas[_perguntaSelecionada].cast()['respostas']: [];
  List<Widget> widgets = respostas.map((t) => Resposta(t, _responder)).toList();

    //for(var textoResp in respostas){
     //respostas.add(Resposta(textoResp, _responder));
    //}

    return MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text('Perguntas'),
    ),
    body: temPerguntaSelecionada
        ? Column(
            children: <Widget>[
              Questao(_perguntas[_perguntaSelecionada]['texto'].toString()),
              ...respostas.map((t) => Resposta(t, _responder)).toList(),
            ],
          )
        : Center(
            child: Text("Não há mais perguntas."),
          ),
  ),
);
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
