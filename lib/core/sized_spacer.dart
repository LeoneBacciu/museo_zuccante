import 'package:flutter/material.dart';

class SizedSpacer extends SizedBox {
  const SizedSpacer.height(double height, {Key? key})
      : super(key: key, height: height);

  const SizedSpacer.width(double width, {Key? key})
      : super(key: key, width: width);
}
