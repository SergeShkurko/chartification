import 'package:chartification/core/core.dart';
import 'package:chartification/utils/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class ChartificationApp extends StatelessWidget {
  const ChartificationApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );

    return Builder(
      builder: (context) {
        /// Pass context to appRoute
        AppRoute.setStream(context);

        return MaterialApp.router(
          routeInformationProvider: AppRoute.router.routeInformationProvider,
          routeInformationParser: AppRoute.router.routeInformationParser,
          routerDelegate: AppRoute.router.routerDelegate,
          localizationsDelegates: const [
            Strings.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          builder: (BuildContext context, Widget? child) {
            final MediaQueryData data = MediaQuery.of(context);

            return MediaQuery(
              data: data.copyWith(
                textScaleFactor: 1,
                alwaysUse24HourFormat: true,
              ),
              child: child!,
            );
          },
          title: Constants.get.appName,
          theme: themeLight(context),
          darkTheme: themeDark(context),
          supportedLocales: L10n.all,
        );
      },
    );
  }
}
