// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:market_flex/components/Campos.dart';
import 'package:market_flex/components/TituloComponent.dart';
import 'package:market_flex/components/botao.dart';
import 'package:market_flex/components/menu.dart';
import 'package:market_flex/model/Database.dart';
import 'package:market_flex/model/Animations.dart';
import 'package:market_flex/pages/home.dart';
import 'package:market_flex/pages/mensage.dart';

class PageEditTask extends StatefulWidget {
  Map<String, dynamic> data;
  PageEditTask({super.key, required this.data});

  @override
  State<PageEditTask> createState() => _PageEditTaskState();
}

class _PageEditTaskState extends State<PageEditTask> {
  @override
  void initState() {
    super.initState();

    controllerTitle = TextEditingController(text: widget.data['title']);
    controllerDesc = TextEditingController(text: widget.data['desc']);
  }

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
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      //===================================
                      Titulo(subtitulo: "List - edit"),
                      //===================================
                      Expanded(
                          flex: 100,
                          child: SingleChildScrollView(
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

                            Botao(
                                name: "save task",
                                fn: () {
                                  // ===============================
                                  //  verifica se não tem erros
                                  setState(() {
                                    erroMensageTitle =
                                        controllerTitle.text.isEmpty
                                            ? 'Campo vazio'
                                            : "";
                                    erroMensagerDesc =
                                        controllerDesc.text.isEmpty
                                            ? 'Campo vazio'
                                            : "";
                                  });
                                  // =============================================
                                  //     Faz a verificação se NULO
                                  if (erroMensageTitle.isEmpty &&
                                      erroMensagerDesc.isEmpty) {
                                    databaseHelper.updateTaskById(
                                        widget.data['id'],
                                        controllerTitle.text,
                                        controllerDesc.text);
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      SlidePageRouteToRigth(
                                          builder: (context) =>
                                              const PageHome()),
                                      (route) => false,
                                    );
                                  }
                                }),
                            Botao(
                              fn: () {
                                Navigator.push(
                                    context,
                                    SlidePageRouteToRigth(
                                        builder: (context) => PageMensage(
                                              fn: () {
                                                databaseHelper.deleteTaskById(
                                                    widget.data['id']);
                                                Navigator.pushAndRemoveUntil(
                                                  context,
                                                  SlidePageRouteToRigth(
                                                      builder: (context) =>
                                                          const PageHome()),
                                                  (route) => false,
                                                );
                                              },
                                              msg:
                                                  'Tem certeza que deseja deletar esse item ?',
                                            )));
                              },
                              name: "delete task",
                              setType: Colors.red.withOpacity(0.7),
                            ),
                          ]))),
                      //===================================
                      const Spacer(flex: 25)
                      //===================================
                    ],
                    //===================================
                    //===================================
                  ),
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
