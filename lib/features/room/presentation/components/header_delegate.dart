import 'package:flutter/material.dart';
import 'package:museo_zuccante/core/colors.dart';
import 'package:museo_zuccante/models/company.dart';

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  final Company company;

  HeaderDelegate(this.company);

  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent,
      ) {
    final progress = shrinkOffset / maxExtent;
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 150),
            opacity: progress,
            child: const ColoredBox(
              color: Palette.primary,
            ),
          ),
          AnimatedOpacity(
            opacity: 1 - progress,
            duration: const Duration(milliseconds: 150),
            child: Image.network(
              company.poster,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topCenter,
                      colors: [Colors.black, Colors.transparent])),
            ),
          ),
          Positioned(
              top: 10,
              left: 10,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              )),
          Positioned(
            bottom: 10,
            left: 20,
            child: Text(
              company.title,
              style: const TextStyle(fontSize: 32, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => 400;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
