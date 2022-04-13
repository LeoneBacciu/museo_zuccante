import 'package:flutter/material.dart';
import 'package:museo_zuccante/core/colors.dart';

class CustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  CustomHeaderDelegate({
    required this.child,
    required this.height,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Palette.primary,
      width: double.infinity,
      height: height,
      child: child,
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
