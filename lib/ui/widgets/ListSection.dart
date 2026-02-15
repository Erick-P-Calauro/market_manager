import 'package:flutter/material.dart';
import 'package:market_manager/utils/CustomColors.dart';
import 'package:market_manager/utils/Typograph.dart';

class ListSection extends StatelessWidget {
  const ListSection({
    super.key,
    required this.title,
    required this.items,
  });

  final String title;
  final List<Object> items;

  @override
  Widget build(BuildContext context) {
    final contextWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      child: Column(
      spacing: 15,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Typograph.TitleSmall.copyWith(fontWeight: FontWeight.w400),
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          separatorBuilder: (context, index) {
            return SizedBox(height: 15);
          }, 
          itemBuilder: (context, index) {
            return Container(
              padding:
                  EdgeInsets.symmetric(vertical: 13, horizontal: 20),
              color: CustomColors.LightGray1,
              width: contextWidth,
              child: Text(items[index].toString(), style: Typograph.TitleSmall)
            );
          }, 
        )
      ],
    ));
  }
}
