import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      required this.size,
      this.color,
      required this.weight,
      this.align});
  final String text;
  final double size;
  final Color? color;
  final FontWeight weight;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Axiforma',
        fontSize: size.sp,
        fontWeight: weight,
        color: color,
      ),
      textAlign: align,
    );
  }
}
