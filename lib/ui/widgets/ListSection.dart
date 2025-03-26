import 'package:flutter/material.dart';
import 'package:market_manager/utils/CustomColors.dart';
import 'package:market_manager/utils/Typograph.dart';

class ListSection extends StatelessWidget {
  const ListSection({
    super.key,
    required this.title,
    required this.width,
  });

  final String title;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
      spacing: 15,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Typograph.TitleSmall.copyWith(fontWeight: FontWeight.w400),
        ),
        ListBody(
          mainAxis: Axis.vertical,
          children: [
            Container(
              color: CustomColors.LightGray1,
              width: width - 40,
              height: 50,
              child: Text(""),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                color: CustomColors.LightGray1,
                width: width - 40,
                height: 50,
                child: Text(""),
              ),
            ),
            Container(
              color: CustomColors.LightGray1,
              width: width - 40,
              height: 50,
              child: Text(""),
            )
          ],
        )
      ],
    ));
  }
}
