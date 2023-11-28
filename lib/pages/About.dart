// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:market_flex/components/TituloComponent.dart';
import 'package:market_flex/components/menu.dart';
import 'package:market_flex/components/viewText.dart';

class PageAbout extends StatelessWidget {
  Map<String, String>? data = {
    "title": "Aplicativo de Lista de Tarefas",
    "desc":
        """Em um mundo cada vez mais acelerado, a necessidade de organizar nossas responsabilidades diárias torna-se crucial. É nesse contexto que apresento meu aplicativo de lista de tarefas, uma ferramenta concebida para transformar a maneira como abordamos o gerenciamento do nosso tempo.

Este aplicativo simplifica o processo de adição de tarefas, eliminando burocracias e mantendo-se focado na essência: a eficiência. Com apenas alguns toques, é possível inserir títulos e descrições, proporcionando uma abordagem direta e descomplicada para a organização de nossas atividades cotidianas.

Além disso, a visualização clara das tarefas permite uma compreensão rápida e uma visão abrangente do que precisa ser feito. A simplicidade não é apenas uma característica, mas uma filosofia incorporada ao design do aplicativo.

Ao ser desenvolvido exclusivamente para a plataforma Android, o aplicativo se integra perfeitamente ao ecossistema do sistema operacional, garantindo uma experiência fluida e intuitiva.
"""
  };
  PageAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color(0xffE9E8ED),
            //===================================
            //===================================
            body: Stack(
              children: [
                //===================================
                //===================================
                //===================================
                Column(
                  children: [
                    //===================================
                    Titulo(titulo: "Project", subtitulo: "About"),
                    //===================================
                    Expanded(
                        flex: 100,
                        child: SingleChildScrollView(
                            child: Column(children: [
                          ViewText(
                            titulo: data!["title"]!,
                            desc: data!["desc"]!,
                          ),
                        ]))),
                    //===================================
                    const Spacer(flex: 25)
                    //===================================
                  ],
                  //===================================
                  //===================================
                ),
                //===================================
                //===================================
                //===================================
                Menu(
                  state: const [false, false, true],
                )
              ],
            )));
  }
}
