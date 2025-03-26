import 'package:flutter/material.dart';
import 'package:market_manager/utils/CustomColors.dart';
import 'package:market_manager/utils/Typograph.dart';

class DefaultCheckboxField extends StatelessWidget {
  DefaultCheckboxField({
    super.key,
    required this.labelText,
    required this.onChecked,
    required this.width,
  });

  final String labelText;
  final double width;
  final Function onChecked;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(labelText, style: Typograph.TitleSmall),
          SizedBox(height: 10),
          Checkbox(
            value: false,
            onChanged: (bool? newValue) {
              onChecked();
            },
            side: BorderSide(color: CustomColors.BlueMarket, width: 2),
          )
        ],
      ),
    );
  }
}
