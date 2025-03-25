import 'package:flutter/material.dart';
import 'package:market_manager/utils/CustomColors.dart';
import 'package:market_manager/utils/Typograph.dart';

class ButtonDropdownField extends StatelessWidget {
  const ButtonDropdownField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.width,
    required this.onTap,
    required this.icon,
  });

  final String labelText;
  final String hintText;
  final double width;
  final Function onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: Typograph.TitleSmall),
        SizedBox(height: 10),
        Row(
          spacing: 20,
          children: [
            SizedBox(
              width: width,
              child: DropdownButtonFormField(
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
        )
      ],
    );
  }
}
