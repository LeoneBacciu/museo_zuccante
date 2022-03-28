import 'package:flutter/material.dart';

class UrlPath {
  const UrlPath(this.pattern, this.builder);

  final String pattern;
  final Widget Function(BuildContext, String) builder;
}
