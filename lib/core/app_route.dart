import 'package:chartification/dependencies_injection.dart';
import 'package:chartification/features/features.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

enum Routes {
  root("/"),
  details(":symbol"),
  splashScreen("/splashscreen"),
  ;

  const Routes(this.path);

  final String path;
}

class AppRoute {
  static late BuildContext context;

  AppRoute.setStream(BuildContext ctx) {
    context = ctx;
  }

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.splashScreen.path,
        name: Routes.splashScreen.name,
        builder: (_, __) => const SplashScreenPage(),
      ),
      GoRoute(
          path: Routes.root.path,
          name: Routes.root.name,
          builder: (_, __) => Provider(
                create: (_) => sl<QuotationStore>(),
                child: const QuotationPage(),
              ),
          routes: [
            GoRoute(
              path: Routes.details.path,
              name: Routes.details.name,
              builder: (_, state) => Provider(
                create: (_) => sl<QuotationDetailsStore>(),
                child: QuotationDetailsPage(
                  symbol: state.params['symbol']!,
                ),
              ),
            ),
          ]),
    ],
    initialLocation: Routes.splashScreen.path,
    routerNeglect: true,
    debugLogDiagnostics: kDebugMode,
  );
}
