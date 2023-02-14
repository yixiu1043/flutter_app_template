import 'package:flutter/material.dart';
import 'package:yx_app/gen/colors.gen.dart';

final ThemeData yxTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: ColorName.color111425,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  appBarTheme: const AppBarTheme(
    backgroundColor: ColorName.color111425,
    centerTitle: true,
    toolbarHeight: 60,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 18,
      color: ColorName.white,
      fontWeight: FontWeight.bold,
    ),
    actionsIconTheme: IconThemeData(
      size: 24,
    ),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: ColorName.color242943,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
    ),
    clipBehavior: Clip.antiAlias,
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: ColorName.colorFD5B03,
    unselectedLabelColor: ColorName.colorE8E8E8A100,
    unselectedLabelStyle: TextStyle(
      fontSize: 14,
    ),
    labelStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  dialogBackgroundColor: ColorName.color111425,
  dialogTheme: const DialogTheme(
    backgroundColor: ColorName.color111425,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    titleTextStyle: TextStyle(fontSize: 18, color: ColorName.colorE8E8E8A100),
    contentTextStyle: TextStyle(fontSize: 12, color: ColorName.colorE8E8E8A100),
  ),
  dividerTheme: const DividerThemeData(
    color: ColorName.color414660A40,
    thickness: 1,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: ColorName.colorFD5B03,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    alignLabelWithHint: false,
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: ColorName.color373737A100,
      ),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: ColorName.color373737A100,
      ),
    ),
    disabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: ColorName.color373737A100,
      ),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: ColorName.color373737A100,
      ),
    ),
    hintStyle: TextStyle(
      height: 2.5,
      color: ColorName.colorE8E8E8A60,
      fontSize: 12,
    ),
    labelStyle: TextStyle(
      color: ColorName.colorE8E8E8A100,
      fontSize: 24,
    ),
    floatingLabelBehavior: FloatingLabelBehavior.always,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: ColorName.color090C1C,
    landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
    selectedLabelStyle: TextStyle(fontSize: 11, color: ColorName.colorFD5B03),
    unselectedLabelStyle: TextStyle(fontSize: 11, color: ColorName.colorE8E8E8A80),
    unselectedItemColor: ColorName.colorE8E8E8A80,
    selectedItemColor:  ColorName.colorFD5B03,
    showUnselectedLabels: true,
    showSelectedLabels: true,
  ),
);
