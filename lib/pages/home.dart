import 'dart:io';

import 'package:flutter/material.dart';
import 'package:market_flex/components/TituloComponent.dart';
import 'package:market_flex/components/botao.dart';
import 'package:market_flex/components/itemComponent.dart';
import 'package:market_flex/components/menu.dart';
import 'package:market_flex/model/Database.dart';
import 'package:market_flex/model/Animations.dart';
import 'package:market_flex/pages/addTask.dart';
import 'package:market_flex/pages/mensage.dart';

class PageHome extends StatelessWidget {
  const PageHome({super.key});

  @override
  Widget build(BuildContext context) {
    DatabaseHelper databaseHelper = DatabaseHelper();
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        Navigator.push(
            context,
            SlidePageRouteToRigth(
                builder: (context) => PageMensage(
                      fn: () {
                        exit(0);
                      },
                      msg: 'Deseja sair do app ?',
                    )));
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xffE9E8ED),
          body: Stack(
            children: [
              Column(children: [
                Titulo(),
                Expanded(
                    flex: 90,
                    child: FutureBuilder(
                        future: databaseHelper.getAllTasks(),
                        builder: ((context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                height: 50,
                                width: 50,
                                child: CircularProgressIndicator(),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return const Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                child: Text('Erro ao carregar app'),
                              ),
                            );
                          } else if (!snapshot.hasData ||
                              (snapshot.data as List).isEmpty) {
                            return const Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                child: Text('Add a new task now'),
                              ),
                            );
                          } else {
                            dynamic tasks = snapshot.data;
                            return ListView.builder(
                                itemCount: tasks.length,
                                itemBuilder: (context, index) {
                                  return Item(
                                    data: snapshot.data[index],
                                  );
                                });
                          }
                        }))),
                Expanded(
                    flex: 15,
                    child: Botao(fn: () {
                      Navigator.push(
                          context,
                          SlidePageRouteToRigth(
                              builder: (context) => const PageAddTask()));
                    })),
                const Spacer(flex: 30),
              ]),
              Menu(state: const [true, false, false])
            ],
          ),
        ),
      ),
    );
  }
}
