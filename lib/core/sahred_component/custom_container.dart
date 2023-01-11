import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    this.color,
    this.height,
    this.radius,
    this.widget,
    this.width,
    this.bottomMargin,
    this.leftMargin,
    this.rightMargin,
    this.topMargin,
  });

  final double? width;
  final double? height;
  final double? radius;
  final Widget? widget;
  final Color? color;
  final double? leftMargin;
  final double? rightMargin;
  final double? topMargin;
  final double? bottomMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width == null ? null : width!.w,
      height: height == null ? null : height!.h,
      margin: EdgeInsets.only(
        left: leftMargin == null ? 0.0 : leftMargin!,
        right: rightMargin == null ? 0.0 : rightMargin!,
        bottom: bottomMargin == null ? 0.0 : bottomMargin!,
        top: topMargin == null ? 0.0 : topMargin!,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: radius == null ? null : BorderRadius.circular(radius!),
      ),
      child: widget,
    );
  }
}
