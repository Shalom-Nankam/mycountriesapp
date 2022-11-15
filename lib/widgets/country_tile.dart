import 'package:countriesapp/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/country_model.dart';

class CountryTile extends StatelessWidget {
  const CountryTile({super.key, required this.country});
  final Country country;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: double.infinity.w,
      child: ListTile(
        leading: ImageIcon(NetworkImage('${country.flags}')),
        title: CustomText(
          text: country.name!,
          size: 14,
          weight: FontWeight.w400,
        ),
        subtitle: CustomText(
          text: country.capital![0],
          size: 14,
          weight: FontWeight.w400,
        ),
      ),
    );
  }
}
