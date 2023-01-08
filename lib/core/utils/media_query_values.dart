import 'package:flutter/material.dart';

class MediaQueryValues {
  BuildContext context;
  MediaQueryValues({required this.context});
  double get height => MediaQuery.of(context).size.height;
  double get width => MediaQuery.of(context).size.width;
}
