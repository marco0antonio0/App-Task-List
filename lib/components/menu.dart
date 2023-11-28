// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:market_flex/model/Routers.dart';
import 'package:market_flex/pages/About.dart';
import 'package:market_flex/pages/home.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class Menu extends StatelessWidget {
  List<bool> state;
  Menu({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Spacer(flex: 140),
      Expanded(
          flex: 25,
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 4,
                          spreadRadius: 0,
                          color: Color.fromRGBO(0, 0, 0, 0.25))
                    ]),
                child: Row(
                  children: [
                    //=====================
                    //  margim
                    const Spacer(flex: 30),
                    //=====================
                    // item Home
                    Expanded(
                        flex: 100,
                        child: Opacity(
                          opacity: !state[0] ? 0.5 : 1,
                          child: InkWell(
                            onTap: () {
                              state[0]
                                  ? null
                                  : Navigator.pushAndRemoveUntil(
                                      context,
                                      SlidePageRouteToRigth(
                                          builder: (context) =>
                                              const PageHome()),
                                      (route) => false,
                                    );
                            },
                            child: const Image(
                                image: AssetImage("images/icons/IconHome.png")),
                          ),
                        )),
                    //=====================
                    // item Github
                    Expanded(
                        flex: 100,
                        child: Opacity(
                          opacity: !state[1] ? 0.5 : 1,
                          child: InkWell(
                            onTap: () {
                              _launchURL(
                                  'https://github.com/marco0antonio0/App-Task-List');
                            },
                            child: const Image(
                                image:
                                    AssetImage("images/icons/IconGithub.png")),
                          ),
                        )),
                    //=====================
                    // item About
                    Expanded(
                        flex: 100,
                        child: Opacity(
                          opacity: !state[2] ? 0.5 : 1,
                          child: InkWell(
                            onTap: () {
                              state[2]
                                  ? null
                                  : Navigator.pushAndRemoveUntil(
                                      context,
                                      SlidePageRouteToLeft(
                                          builder: (context) => PageAbout()),
                                      (route) => false,
                                    );
                            },
                            child: const Image(
                                image:
                                    AssetImage("images/icons/IconAbout.png")),
                          ),
                        )),
                    //=====================
                    //  margim
                    const Spacer(flex: 30),
                  ],
                ),
              ))),
      const Spacer(flex: 5)
    ]);
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Não foi possível abrir o link $url';
  }
}
