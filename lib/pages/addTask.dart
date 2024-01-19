// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:market_flex/components/Campos.dart';
import 'package:market_flex/components/TituloComponent.dart';
import 'package:market_flex/components/botao.dart';
import 'package:market_flex/components/menu.dart';
import 'package:market_flex/model/Database.dart';
import 'package:market_flex/model/Animations.dart';
import 'package:market_flex/pages/home.dart';

class PageAddTask extends StatefulWidget {
  const PageAddTask({super.key});

  @override
  State<PageAddTask> createState() => _PageAddTaskState();
}

class _PageAddTaskState extends State<PageAddTask> {
  // ===================================================================
  //                   INIT VARS AND CONTROLLERS
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerDesc = TextEditingController();

  String erroMensageTitle = '';
  String erroMensagerDesc = '';
  @override
  Widget build(BuildContext context) {
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
                            child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Column(children: [
                            inputText(
                                erroMensage: erroMensageTitle,
                                controller: controllerTitle,
                                fn: () {
                                  // =========================================
                                  //    caso o campo esteja vazio set erro
                                  if (controllerTitle.text.isEmpty) {
                                    setState(
                                        () => erroMensageTitle = 'Campo vazio');
                                  } else {
                                    setState(() => erroMensageTitle = '');
                                  }
                                },
                                placeholder: 'Title task'),
                            inputText(
                                maxLength: 300,
                                controller: controllerDesc,
                                erroMensage: erroMensagerDesc,
                                fn: () {
                                  // =========================================
                                  //    caso o campo esteja vazio set erro
                                  if (controllerDesc.text.isEmpty) {
                                    setState(
                                        () => erroMensagerDesc = 'Campo vazio');
                                  } else {
                                    setState(() => erroMensagerDesc = '');
                                  }
                                },
                                maxLines: 8,
                                placeholder: 'Desc task'),
                            // ====================================================
                            //                     margem
                            const SizedBox(height: 25),
                            // ====================================================
                            Botao(fn: () async {
                              // ===============================
                              //  verifica se não tem erros
                              setState(() {
                                erroMensageTitle = controllerTitle.text.isEmpty
                                    ? 'Campo vazio'
                                    : "";
                                erroMensagerDesc = controllerDesc.text.isEmpty
                                    ? 'Campo vazio'
                                    : "";
                              });
                              // =============================================
                              //     Faz a verificação se NULO
                              if (erroMensageTitle.isEmpty &&
                                  erroMensagerDesc.isEmpty) {
                                // =============================================
                                //     Faz o Insert na tabela
                                await databaseHelper.insertTask(
                                    controllerTitle.text, controllerDesc.text);
                                // ignore: use_build_context_synchronously
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  SlidePageRouteToRigth(
                                      builder: (context) => const PageHome()),
                                  (route) => false,
                                );
                              }
                            })
                          ]),
                        ))),
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
