// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

Widget inputText({
  TextEditingController? controller,
  fn,
  maxLines = 1,
  placeholder = 'digite . . .',
  String erroMensage = '',
  maxLength = 17,
}) {
  return Container(
      // height: 70,
      margin: const EdgeInsets.only(top: 10),
      width: double.infinity,
      alignment: Alignment.center,
      child: TextField(
          onChanged: (value) {
            fn();
          },
          maxLines: maxLines,
          controller: controller,
          maxLength: maxLength,
          decoration: InputDecoration(
            error: erroMensage.isNotEmpty
                ? Text(
                    erroMensage,
                    style: TextStyle(color: Colors.red[400]),
                  )
                : null,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                width: 0.5,
              ),
            ),
            filled: true,
            fillColor: const Color(0xFFf3f2f5),
            hintText: placeholder,
          )));
}
