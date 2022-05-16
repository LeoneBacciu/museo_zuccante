import 'package:flutter/material.dart';
import 'package:museo_zuccante/core/colors.dart';
import 'package:museo_zuccante/core/custom_inkwell.dart';
import 'package:museo_zuccante/core/sized_spacer.dart';

class CustomChip extends StatelessWidget {
  final Widget leading;
  final String text;
  final double height;
  final GestureTapCallback? onTap;

  const CustomChip({
    Key? key,
    required this.leading,
    required this.text,
    required this.height,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      radius: height / 2,
      onTap: onTap,
      child: Container(
        height: height,
        padding: const EdgeInsets.only(top: 8, bottom: 8, right: 12, left: 6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(height / 2),
            border: Border.all(color: Palette.primary, width: 3)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            leading,
            const SizedSpacer.width(8.0),
            Text(
              text,
              style: TextStyle(
                fontSize: height / 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
