import 'package:flutter/material.dart';
import 'package:market_manager/utils/CustomColors.dart';
import 'package:market_manager/utils/Typograph.dart';

class ButtonTextField extends StatelessWidget {
  const ButtonTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.onTap,
    required this.icon,
    required this.controller,
    required this.maxWidth
  });

  final String labelText;
  final String hintText;
  final Function onTap;
  final IconData icon;
  final TextEditingController? controller;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      spacing: 20,
      children: [
        Container(
          padding: EdgeInsets.zero,
          width: maxWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(labelText, style: Typograph.TitleSmall),
              SizedBox(height: 10),
              TextField(
                controller: controller,
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
              )
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: CustomColors.BlueMarket,
              borderRadius: BorderRadius.circular(4)),
          padding: EdgeInsets.all(2),
          child: GestureDetector(
              onTap: () => {onTap()},
              child: Icon(icon, color: Colors.white, size: 30)),
        ),
      ],
    );
  }
}
