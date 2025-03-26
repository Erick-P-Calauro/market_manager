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

class HeaderPlus extends StatelessWidget {
  const HeaderPlus({super.key, required this.text, required this.newPage});

  final String text;
  final String newPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          child: Row(
            children: [
              GestureDetector(
                onTap: () =>
                    {Navigator.pushNamed(context, RouteGenerator.InitialPage)},
                child: Icon(Icons.arrow_back, size: 24, color: Colors.black),
              ),
              SizedBox(width: 20),
              Text(text, style: Typograph.HeadlineLarge)
            ],
          ),
        ),
        SizedBox(
          child: GestureDetector(
              onTap: () => {Navigator.pushNamed(context, newPage)},
              child: Icon(Icons.add, size: 24, color: Colors.black)),
        )
      ],
    );
  }
}
