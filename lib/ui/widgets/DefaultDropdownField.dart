import 'package:flutter/material.dart';
import 'package:market_manager/utils/CustomColors.dart';
import 'package:market_manager/utils/Typograph.dart';

class DefaultDropdownField extends StatelessWidget {
  const DefaultDropdownField(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.maxWidth});

  final String labelText;
  final String hintText;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      width: maxWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelText, style: Typograph.TitleSmall),
          SizedBox(height: 10),
          DropdownButtonFormField(
            style: Typograph.SubtitleLarge,
            decoration: InputDecoration(
                hintText: hintText,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                border: InputBorder.none,
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: CustomColors.BlueMarket)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: CustomColors.BlueMarket)),
                errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: CustomColors.BlueMarket)),
                focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: CustomColors.BlueMarket)),
                filled: true,
                fillColor: CustomColors.LightGray1),
            items: [],
            onChanged: (dynamic value) {
              print(value);
            },
          )
        ],
      ),
    );
  }
}
