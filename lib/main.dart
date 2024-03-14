import 'package:flavor/flavor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:yx_app/components/theme/yx_theme.dart';
import 'package:yx_app/components/toast/toast_manager.dart';
import 'package:yx_app/flavor/properties.dart';

// import 'package:yx_app/initializer/api_initializer.dart';
import 'package:yx_app/initializer/app_initializers.dart';

// import 'package:yx_app/initializer/dio_initializer.dart';
// import 'package:yx_app/initializer/proxy_initializer.dart';
// import 'package:yx_app/initializer/sp_initializer.dart';
import 'package:yx_app/initializer/system_initializer.dart';

// import 'package:yx_app/initializer/tools_initializer.dart';
import 'package:yx_app/router/app_pages.dart';
import 'package:yx_app/utils/connectivity_manager.dart';
import 'package:yx_app/utils/tools.dart';
import 'package:yx_app/utils/yx_translations.dart';

void main() {
  Flavor.create(
    Environment.beta,
    color: Colors.green,
    name: '开发',
    properties: properties['qa'],
  );
  setupApp();
}

Future<void> setupApp() async {
  await AppInitializers({
    SystemInitializer(),
    // SpInitializer(),
    // ApiInitializer(),
    // DioInitializer(),
    // ProxyInitializer(),
    // ToolsInitializer(),
  }).init();
  runApp(const ProviderScope(child: YxApp()));
}

class YxApp extends StatelessWidget {
  const YxApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, Widget? child) => MaterialApp.router(
        title: 'flutter app template',
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        theme: yxTheme,
        locale: const Locale('zh', 'CN'),
        supportedLocales: const [Locale('zh', 'CN'), Locale('en', 'US')],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        routerConfig: AppPages.pages,
        builder: ToastManager.initWithParameters(
          builder: (context, widget) {
            return Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    hideKeyboard(context);
                  },
                  child: widget,
                ),
              ],
            );
          },
        ),
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
