import 'package:countriesapp/models/country_model.dart';
import 'package:countriesapp/providers/country_provider.dart';
import 'package:countriesapp/widgets/home_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final Future<List<Country>> countries;

  @override
  void initState() {
    super.initState();

    countries =
        Provider.of<CountryProvider>(context, listen: false).getAllCountries();
  }

  @override
  Widget build(BuildContext context) {
    final changeTheme = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Explore',
                    style: GoogleFonts.pacifico(
                        fontSize: 26.sp,
                        // color: const Color(0xff001637),
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '.',
                    style: GoogleFonts.pacifico(
                        fontSize: 26.sp,
                        color: Colors.red,
                        fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  SizedBox(
                      height: 32.h,
                      width: 32.w,
                      child: IconButton(
                          onPressed: () {
                            if (changeTheme.darkTheme) {
                              return changeTheme.appDarkTheme(false);
                            } else {
                              return changeTheme.appDarkTheme(true);
                            }
                          },
                          icon: changeTheme.darkTheme
                              ? const Icon(
                                  Icons.wb_sunny_outlined,
                                  color: Colors.white,
                                )
                              : const Icon(
                                  Icons.dark_mode_outlined,
                                  color: Color(0xff1C1917),
                                )))
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(
                height: 48.h,
                width: double.infinity.w,
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search Country',
                      hintStyle: TextStyle(
                          color: changeTheme.darkTheme
                              ? const Color(0xffEAECF0)
                              : const Color(0xff667085),
                          fontFamily: 'Axiforma',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w300),
                      filled: true,
                      fillColor: changeTheme.darkTheme
                          ? const Color(0xff98A2B3).withOpacity(0.2)
                          : const Color(0xffF2F4F7),
                      prefixIcon: Icon(
                        Icons.search_outlined,
                        color: const Color(0xff667085),
                        size: 16.h,
                      )),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  HomeButton(
                      buttonWIdth: 83,
                      press: () {},
                      title: 'EN',
                      icon: Icon(
                        Icons.language_outlined,
                        color: changeTheme.darkTheme
                            ? Colors.white
                            : const Color(0xff1C1917),
                        size: 20,
                      )),
                  const Spacer(),
                  HomeButton(
                      buttonWIdth: 96,
                      press: () {},
                      title: 'Filter',
                      icon: Icon(
                        Icons.language_outlined,
                        color: changeTheme.darkTheme
                            ? Colors.white
                            : const Color(0xff1C1917),
                        size: 20,
                      ))
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                  height: 500.h,
                  width: double.infinity.w,
                  child: FutureBuilder(
                    future: countries,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return SpinKitFadingFour(
                          color: changeTheme.darkTheme
                              ? Colors.white
                              : Colors.black,
                        );
                      } else {
                        GroupedListView(
                          elements: snapshot.data!,
                          groupBy: (element) => element.name![0],
                          groupSeparatorBuilder: (value) => Text(value),
                        );
                      }
                      return SpinKitFadingFour(
                        color:
                            changeTheme.darkTheme ? Colors.white : Colors.black,
                      );
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
