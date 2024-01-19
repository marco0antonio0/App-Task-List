import 'package:flutter/material.dart';
import 'package:market_flex/components/TituloComponent.dart';
import 'package:market_flex/components/botao.dart';

// ignore: must_be_immutable
class PageMensage extends StatelessWidget {
  String msg = 'Voce tem certeza dessa operação?';
  Function fn;
  PageMensage(
      {super.key,
      this.msg = 'Voce tem certeza dessa operação?',
      required this.fn});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffE9E8ED),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  Titulo(),
                  Expanded(
                    flex: 75,
                    child: Center(
                        child: Text(
                      msg,
                      style: const TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    )),
                  ),
                  Expanded(
                      flex: 15,
                      child: Botao(
                          setType: Colors.black.withOpacity(0.5),
                          name: 'sim',
                          fn: () {
                            fn();
                          })),
                  Expanded(
                      flex: 15,
                      child: Botao(
                          setType: Colors.black.withOpacity(0.5),
                          name: 'não',
                          fn: () {
                            Navigator.pop(context);
                          })),
                  const Spacer(flex: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
