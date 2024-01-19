// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:market_flex/components/TituloComponent.dart';
import 'package:market_flex/components/botao.dart';
import 'package:market_flex/components/menu.dart';
import 'package:market_flex/components/viewText.dart';
import 'package:market_flex/model/Animations.dart';
import 'package:market_flex/pages/editTask.dart';

class PageViewTask extends StatelessWidget {
  Map<String, dynamic>? data;
  PageViewTask({super.key, this.data});

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
                    Titulo(subtitulo: "View"),
                    //===================================
                    Expanded(
                        flex: 90,
                        child: SingleChildScrollView(
                            child: Column(children: [
                          ViewText(
                            titulo: data!["title"]!,
                            desc: data!["desc"]!,
                          )
                        ]))),
                    //===================================
                    Expanded(
                        flex: 15,
                        child: Botao(
                            fn: () {
                              Navigator.push(
                                  context,
                                  SlidePageRouteToRigth(
                                      builder: (context) => PageEditTask(
                                            data: data!,
                                          )));
                            },
                            name: "Edit"
                            // setType: const Color(0xffD1D1D1),
                            )),
                    const Spacer(flex: 30)
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
