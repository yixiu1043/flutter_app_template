import 'package:flutter/material.dart';
import 'package:flutter_app_template/managers/toast_manager.dart';
import 'package:flutter_app_template/routes/app_pages.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'public_widget/custom_route_transition.dart';
import 'public_widget/custom_translations.dart';

void main() {
  runApp(MyApp());
}

RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 750),
      builder: () => GetMaterialApp(
        title: 'APP',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          // RefreshLocalizations.delegate,
        ],
        translations: CustomTranslations(),
        onInit: () {},
        transitionDuration: Duration(milliseconds: 300),
        customTransition: CustomRouteTransition(),
        locale: Locale('zh', 'CN'),
        fallbackLocale: Locale('en', 'US'),
        supportedLocales: [
          const Locale('zh', 'CN'),
          const Locale('en', 'US'),
        ],
        // theme: ThemeUtil.light(),
        getPages: AppPages.pages,
        initialRoute: AppRoutes.HOME,
        navigatorObservers: [
          routeObserver,
          ToastObserver(),
        ],
        builder: ToastManager.initWithParameters(builder: (context, widget) {
          return GestureDetector(
            onTap: () {
              hideKeyboard(context);
            },
            child: MediaQuery(
              ///设置文字大小不随系统设置改变
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            ),
          );
        }),
      ),
    );
  }

  void hideKeyboard(context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }
}
