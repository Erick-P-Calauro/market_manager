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
    required this.items,
    required this.onChanged,
    this.initialValue
  });

  final String labelText;
  final String hintText;
  final double width;
  final Function onTap;
  final IconData icon;
  final List<String> items;
  final onChanged;
  final String? initialValue;

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
                initialValue: initialValue,
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
                items: items.map((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e, style: TextStyle(color: Colors.black))
                  );
                }).toList(),
                onChanged: (dynamic value) {
                  onChanged(value);
                }
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
