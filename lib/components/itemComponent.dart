// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:market_flex/model/Animations.dart';
import 'package:market_flex/pages/viewTask.dart';

// ignore: must_be_immutable
class Item extends StatelessWidget {
  Map<String, dynamic>? data;

  Item({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              SlidePageRouteToRigth(
                  builder: (context) => PageViewTask(
                        data: data,
                      )));
        },
        child: Container(
          height: 150,
          width: w * 0.95,
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black.withOpacity(0.1)),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 4,
                spreadRadius: 0,
                color: Color.fromRGBO(0, 0, 0, 0.15),
              ),
            ],
          ),
          child: Row(
            children: [
              // =============================================
              //  set Image
              Expanded(flex: 40, child: Image.asset("images/ImageCaixa.png")),
              // =============================================
              //  margin
              const Spacer(flex: 5),
              // =============================================
              //  container Titulo
              Expanded(
                  flex: 60,
                  child: Container(
                    padding: const EdgeInsets.only(top: 30),
                    // color: Colors.red,
                    child: Column(
                      children: [
                        // =============================================
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(data!['title']!,
                                style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600))),
                        // =============================================
                        const SizedBox(height: 5),
                        // =============================================
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Click more info",
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xff808080)))),
                        // =============================================
                      ],
                    ),
                  )),
              // =============================================
            ],
          ),
        ),
      ),
    );
  }
}
