import 'package:flutter/material.dart';
import 'package:museo_zuccante/core/colors.dart';
import 'package:museo_zuccante/core/string_utils.dart';

class ListHeader extends StatelessWidget {
  final String title;
  final double height;

  const ListHeader({Key? key, required this.title, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: height,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 15, top: 20),
      child: Text(
        title.evilToUpperCase(),
        style: const TextStyle(
          fontWeight: FontWeight.w900,
          letterSpacing: .3,
          color: Palette.primary,
        ),
      ),
    );
  }
}
