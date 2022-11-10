import 'package:countriesapp/providers/theme_provider.dart';
import 'package:countriesapp/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeButton extends StatelessWidget {
  const HomeButton(
      {super.key,
      required this.buttonWIdth,
      required this.press,
      required this.title,
      required this.icon});

  final double buttonWIdth;
  final VoidCallback press;
  final String title;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    final themer = Provider.of<ThemeProvider>(context);
    return SizedBox(
      height: 40.h,
      width: buttonWIdth.w,
      child: OutlinedButton(
          onPressed: press,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(
                width: 10,
              ),
              CustomText(
                text: title,
                size: 12.sp,
                weight: FontWeight.w500,
                color:
                    themer.darkTheme ? Colors.white : const Color(0xff000000),
              )
            ],
          )),
    );
  }
}
