import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  Widget build(BuildContext context) {
    final List<Map<String, Object>> perguntas = [
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
    List<String> respostas = perguntas[_perguntaSelecionada].cast()['respostas'];
  List<Widget> widgets = respostas.map((t) => Resposta(t, _responder)).toList();

    //for(var textoResp in respostas){
     //respostas.add(Resposta(textoResp, _responder));
    //}

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: [
            Column(
              children: <Widget>[
                Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
                ...respostas.map((t) => Resposta(t, _responder)).toList(),
                
              ],
            )
          ],
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
