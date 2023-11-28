// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

class ViewText extends StatelessWidget {
  String titulo;
  String desc;
  ViewText({super.key, this.titulo = "", this.desc = ""});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.center,
      child: Container(
        // color: Colors.green,
        width: w * 0.8,
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                titulo,
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                desc,
                style:
                    const TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
