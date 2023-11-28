import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Botao extends StatelessWidget {
  String name;
  Color setType;
  Function fn = () {};
  Botao(
      {super.key,
      this.name = "add task",
      this.setType = const Color(0xff6EC7B0),
      required this.fn});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          fn();
        },
        child: Container(
          height: 70,
          margin: const EdgeInsets.only(top: 10),
          width: w * 0.8,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: setType,
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
          child: Text(
            name,
            style: const TextStyle(
                fontSize: 17, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
