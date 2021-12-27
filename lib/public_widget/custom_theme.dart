import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'refresh_footer.dart';
import 'refresh_header.dart';
import 'tab_fixed_size_indicator.dart';

class CustomTheme extends StatelessWidget {
  final Widget child;

  CustomTheme({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Theme(
      data: themeData.copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        primaryColor: Color(0xffFF9047),
        scaffoldBackgroundColor: Color(0xff151e25),
        indicatorColor: Color(0xff491605),
        textTheme: TextTheme(
          subtitle1: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        platform: TargetPlatform.iOS,
        appBarTheme: AppBarTheme(
            brightness: Brightness.dark,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            backgroundColor: Color(0xFF151e25),
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Color(0xFF151e25),
                statusBarBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.light),
            centerTitle: true,
            iconTheme: IconThemeData(size: 24.w, color: Colors.white)),
        tabBarTheme: TabBarTheme(
          labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          unselectedLabelStyle:
              TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          labelColor: Color(0xffFFFFFF),
          unselectedLabelColor: Color(0xffFFFFFF).withOpacity(0.6),
          indicator: TabFixedSizedIndicator(
            Size(24.w, 3.w),
            Color(0xffFF5722),
            radius: Radius.circular(3.w),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          alignLabelWithHint: false,
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.06),
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.06),
            ),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.06),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.06),
            ),
          ),
          hintStyle: TextStyle(
            height: 2.5,
            color: Colors.white.withOpacity(0.3),
            fontSize: 14,
          ),
          labelStyle: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 18,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        dividerTheme: DividerThemeData(
          thickness: 1.w,
          space: 1.w,
          color: Colors.white.withOpacity(0.06),
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Color(0xff1D2933),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.w)),
          ),
        ),
      ),
      child: RefreshConfiguration(
        headerBuilder: () => RefreshHeader(),
        footerBuilder: () => RefreshFooter(),
        hideFooterWhenNotFull: true,
        child: child,
      ),
    );
  }
}
