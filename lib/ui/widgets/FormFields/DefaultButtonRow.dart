import 'package:flutter/material.dart';
import 'package:market_manager/utils/CustomColors.dart';
import 'package:market_manager/utils/Typograph.dart';

class DefaultButtonRow extends StatelessWidget {
  const DefaultButtonRow({super.key, required this.onConfirm()});

  final Function onConfirm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () => {Navigator.of(context).pop()},
              child: Container(
                decoration: BoxDecoration(
                    color: CustomColors.RedCancel,
                    borderRadius: BorderRadius.circular(2)),
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 50),
                child: Text("Cancelar",
                    style: Typograph.TitleLarge.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w400)),
              )),
          GestureDetector(
              onTap: () => {onConfirm()},
              child: Container(
                decoration: BoxDecoration(
                    color: CustomColors.BlueMarket,
                    borderRadius: BorderRadius.circular(2)),
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 50),
                child: Text("Confirmar",
                    style: Typograph.TitleLarge.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w400)),
              )),
        ],
      ),
    );
  }
}
