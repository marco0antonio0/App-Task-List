// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:market_flex/components/Campos.dart';
import 'package:market_flex/components/TituloComponent.dart';
import 'package:market_flex/components/botao.dart';
import 'package:market_flex/components/menu.dart';
import 'package:market_flex/model/Database.dart';
import 'package:market_flex/model/Routers.dart';
import 'package:market_flex/model/modelData.dart';
import 'package:market_flex/pages/home.dart';

class PageAddTask extends StatelessWidget {
  const PageAddTask({super.key});

  @override
  Widget build(BuildContext context) {
    DataSingleton dataSingleton = DataSingleton();
    DatabaseHelper databaseHelper = DatabaseHelper();
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
                    Titulo(subtitulo: "List - add"),
                    //===================================
                    Expanded(
                        flex: 100,
                        child: SingleChildScrollView(
                            child: Column(children: [
                          Campos(
                            data: const {},
                          ),
                          Botao(fn: () async {
                            // =============================================
                            //     Faz a verificação se NULO
                            if (dataSingleton.dataTitle.isNotEmpty) {
                              // =============================================
                              //     Faz o Insert na tabela
                              await databaseHelper.insertTask(
                                  dataSingleton.dataTitle,
                                  dataSingleton.dataDesc);
                              // ignore: use_build_context_synchronously
                              Navigator.pushAndRemoveUntil(
                                context,
                                SlidePageRouteToRigth(
                                    builder: (context) => const PageHome()),
                                (route) => false,
                              );
                            }
                          })
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
                  state: const [false, false, false],
                )
              ],
            )));
  }
}
