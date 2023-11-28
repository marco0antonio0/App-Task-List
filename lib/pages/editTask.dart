// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:market_flex/components/Campos.dart';
import 'package:market_flex/components/TituloComponent.dart';
import 'package:market_flex/components/botao.dart';
import 'package:market_flex/components/menu.dart';
import 'package:market_flex/model/Database.dart';
import 'package:market_flex/model/Routers.dart';
import 'package:market_flex/model/modelData.dart';
import 'package:market_flex/pages/home.dart';

class PageEditTask extends StatelessWidget {
  Map<String, String> data = {
    "title": "Lorem ipsum dolor",
    "desc": "Lorem ipsum dolor"
  };
  PageEditTask({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    DatabaseHelper databaseHelper = DatabaseHelper();
    DataSingleton dataSingleton = DataSingleton();
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
                    Titulo(subtitulo: "List - edit"),
                    //===================================
                    Expanded(
                        flex: 100,
                        child: SingleChildScrollView(
                            child: Column(children: [
                          Campos(
                            data: data,
                          ),
                          Botao(
                              fn: () {
                                databaseHelper.updateTaskById(
                                    int.parse(data['id']!),
                                    dataSingleton.dataTitle,
                                    dataSingleton.dataDesc);

                                Navigator.pushAndRemoveUntil(
                                  context,
                                  SlidePageRouteToRigth(
                                      builder: (context) => const PageHome()),
                                  (route) => false,
                                );
                              },
                              name: "save task"),
                          Botao(
                            fn: () {
                              databaseHelper
                                  .deleteTaskById(int.parse(data['id']!));
                              Navigator.pushAndRemoveUntil(
                                context,
                                SlidePageRouteToRigth(
                                    builder: (context) => const PageHome()),
                                (route) => false,
                              );
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
