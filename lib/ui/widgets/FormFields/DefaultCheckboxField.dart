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
          CheckboxWidget(
            onChecked: onChecked
          )
        ],
      ),
    );
  }
}

class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget({
    super.key,
    required this.onChecked,
  });

  final Function onChecked;
  
  @override
  State<StatefulWidget> createState() {
    return _CheckboxWidgetState();
  }
  
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: (bool? newValue) {
        setState(() {
          value = newValue ?? false;
          widget.onChecked(newValue);
        });
      },
      side: BorderSide(color: CustomColors.BlueMarket, width: 2),
    );
  }

}
