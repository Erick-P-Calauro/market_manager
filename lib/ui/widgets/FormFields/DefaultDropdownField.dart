import 'package:flutter/material.dart';
import 'package:market_manager/utils/CustomColors.dart';
import 'package:market_manager/utils/Typograph.dart';

// ignore: must_be_immutable
class DefaultDropdownField extends StatefulWidget {
  DefaultDropdownField(
      {
      super.key,
      this.Rkey,
      required this.labelText,
      required this.hintText,
      required this.maxWidth,
      required this.value,
      required this.items,
      this.onChangedParam,
    });

  final Key? Rkey;
  final String labelText;
  final String hintText;
  final double maxWidth;
  final List<dynamic>? items;
  String? value;
  Function? onChangedParam;
  
  @override
  State<StatefulWidget> createState() {
    return DefaultDropDownFieldState();
  }
}

class DefaultDropDownFieldState extends State<DefaultDropdownField> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      width: widget.maxWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.labelText, style: Typograph.TitleSmall),
          SizedBox(height: 10),
          DropdownButtonFormField(
            key: widget.Rkey,
            style: Typograph.SubtitleLarge.copyWith(color: Colors.black),
            decoration: InputDecoration(
                hintText: widget.hintText,
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
            items: widget.items!.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
            onChanged: (dynamic value) {
              setState(() {
                widget.value = value;

                if(widget.onChangedParam != null) {
                  widget.onChangedParam!(value);
                }
              });
            },
            
          )
        ],
      ),
    );
  }
}
