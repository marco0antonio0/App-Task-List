// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:market_flex/model/modelData.dart';

class Campos extends StatefulWidget {
  Map<String, String> data;
  Campos({Key? key, required this.data}) : super(key: key);

  @override
  State<Campos> createState() => _CamposState();
}

class _CamposState extends State<Campos> {
  late TextEditingController titleController;
  late TextEditingController descController;
  @override
  void initState() {
    super.initState();

    // Inicialize os controladores com os dados iniciais
    titleController = TextEditingController(text: widget.data["title"] ?? '');
    descController = TextEditingController(text: widget.data["desc"] ?? '');
  }

  @override
  void dispose() {
    // Libere os controladores quando o widget for descartado
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    DataSingleton dataSingleton = DataSingleton();
    return Column(
      children: [
        //========================================================================
        //                           INPUT name task
        Align(
            alignment: Alignment.center,
            child: Container(
                // height: 70,
                margin: const EdgeInsets.only(top: 10),
                width: w * 0.8,
                alignment: Alignment.center,
                child: TextField(
                    onChanged: (value) {
                      dataSingleton.dataTitle = value;
                    },
                    controller: titleController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 25),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          width: 0.5,
                        ),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFf3f2f5),
                      hintText: 'Name task',
                    )))),
        //========================================================================
        //                           INPUT desc task
        Align(
            alignment: Alignment.center,
            child: Container(
                // height: 70,
                margin: const EdgeInsets.only(top: 10),
                width: w * 0.8,
                alignment: Alignment.center,
                child: TextField(
                    onChanged: (value) {
                      dataSingleton.dataDesc = value;
                    },
                    controller: descController,
                    maxLines: 10,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 25),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          width: 0.5,
                        ),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFf3f2f5),
                      hintText: 'Task description',
                    ))))
        //========================================================================
      ],
    );
  }
}
