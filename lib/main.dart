import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './widget/question.dart';
import './widget/answer.dart';
import './widget/finalResult.dart';

void main(){
  runApp(const PerguntasApp());
}

class PerguntasApp extends StatefulWidget {
  const PerguntasApp({Key? key}) : super(key: key);

  @override
  State<PerguntasApp> createState() => _PerguntasAppState();
}

class _PerguntasAppState extends State<PerguntasApp> {
  int _perguntaSelecionada = 0;
  int pontuacaoFinalUsuario = 0;

  final List<Map<String, Object>> _perguntas =  [
    {'pergunta': "Qual é a sua cor preferida?",
      'opcoesResposta': [
        { 'texto': 'preto', 'nota': 10 },
        { 'texto': 'vermelho', 'nota': 9 },
        { 'texto': 'branco', 'nota': 8 },
      ]  
    },
    {'pergunta': "Qual é seu animal preferido?",
      'opcoesResposta': [
        { 'texto': 'cachorro', 'nota':10 },
        { 'texto': 'gato', 'nota':9 },
        { 'texto': 'panda','nota':8 },
      ]
    }
  ];

  bool get temPerguntaSelecionada => _perguntaSelecionada < _perguntas.length;

  @override
  Widget build(BuildContext context) {

    void responder(int pontuacao){
      if(temPerguntaSelecionada){
        setState(() {
          _perguntaSelecionada++;  
          pontuacaoFinalUsuario += pontuacao;
        });
      }
    }

    void reboot(){
      setState(() {
        _perguntaSelecionada = 0;  
        pontuacaoFinalUsuario = 0 ;
      });
    }
    
    var opcoesRespostas = temPerguntaSelecionada ? _perguntas[_perguntaSelecionada].cast()['opcoesResposta'] : [];
    var widgets = opcoesRespostas
      .map((resp) => Answer(buttonText: resp['texto'].toString(), callBackFunction: () =>  responder(resp['nota'])))
      .toList();
    
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Perguntas")
            ),
            body:  Center(
              child: temPerguntaSelecionada 
              ? Column(
                  children:  [
                    Question(textQuestion: _perguntas[_perguntaSelecionada]['pergunta'].toString()),
                    // ...mostraOpcoesResposta()
                    ...widgets
                  ],
                ) 
              : FinalResult(pontuacaoFinal: pontuacaoFinalUsuario, rebootSurvey: reboot),
            )
        ),
    );
  }
}
 