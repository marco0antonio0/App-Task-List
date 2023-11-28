// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget Titulo({titulo = 'Task', subtitulo = "List"}) {
  return Expanded(
    flex: 25,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          titulo,
          style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xff535353)),
        ),
        Text(
          subtitulo,
          style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w600,
              color: Color(0xff535353)),
        ),
      ],
    ),
  );
}
