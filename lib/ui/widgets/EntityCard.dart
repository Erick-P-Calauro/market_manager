import 'package:flutter/material.dart';
import 'package:market_manager/utils/CustomColors.dart';
import 'package:market_manager/utils/Typograph.dart';

class EntityCard extends StatelessWidget {
  const EntityCard({
    super.key,
    required this.text,
    required this.onEdit,
    required this.onDelete,
  });

  final String text;
  final Function onEdit;
  final Function onDelete;
  
  @override
  Widget build(BuildContext context) {
    final contextWidth = MediaQuery.of(context).size.width - 40;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 13, horizontal: 20),
      color: CustomColors.LightGray1,
      width: contextWidth,
      child: Row(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,
              style: Typograph.TitleSmall),
          SizedBox(
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => onEdit(),
                  child: Icon(
                    Icons.edit,
                    size: 22,
                    color: Colors.black
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () => onDelete(),
                  child: Icon(
                    Icons.delete,
                    size: 22,
                    color: Colors.black
                  )
                )
              ],
            )
          )
        ],
      ),
    );
  }

  
}