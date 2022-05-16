import 'package:flutter/material.dart';
import 'package:museo_zuccante/features/home/presentation/components/list_header.dart';
import 'package:museo_zuccante/features/home/presentation/components/vertical_card.dart';
import 'package:museo_zuccante/models/item.dart';

class TopVisitedList extends StatelessWidget {
  final List<Item> items;
  final listHeight = 260.0;
  final titleHeight = 60.0;

  const TopVisitedList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        height: listHeight + titleHeight,
        child: Column(
          children: [
            ListHeader(
              title: 'tOp UpDaTeD',
              height: titleHeight,
            ),
            SizedBox(
              height: listHeight,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    VerticalCard(item: items[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
