import 'package:flutter/material.dart';
import 'package:market_manager/routes.dart';
import 'package:market_manager/utils/Typograph.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () =>
              {Navigator.pushNamed(context, RouteGenerator.InitialPage)},
          child: Icon(Icons.arrow_back, size: 24, color: Colors.black),
        ),
        SizedBox(width: 20),
        Text(text, style: Typograph.HeadlineLarge)
      ],
    );
  }
}
