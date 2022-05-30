import 'package:flutter/material.dart';


class HeaderText extends StatelessWidget {
  const HeaderText({required this.header1,required this.header2});
  final String header1;
  final String header2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          header1,
          style:const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
       const SizedBox(
          height: 15,
        ),
        Text(
          header2,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}
