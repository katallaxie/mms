import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mms/router/setup_guard.dart';

import 'package:mms/screens/app.dart';
import 'package:mms/blocs/blocs.dart';

import 'home_router.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|BottomSheet,Route')
class RootRouter extends _$RootRouter {
  RootRouter({Key? key, required this.settingsBloc}) : super();

  final SettingsBloc settingsBloc;

  @override
  late List<AutoRoute> routes = [
    AdaptiveRoute(
      page: RootRoute.page,
      path: '/',
      guards: [SetupGuard(setupBloc: settingsBloc)],
      children: [
        RedirectRoute(path: '', redirectTo: 'home'),
        AdaptiveRoute(
          page: HomeRouterRoute.page,
          path: 'home',
          children: [
            AdaptiveRoute(
              path: '',
              page: HomeRoute.page,
              initial: true,
            ),
          ],
        ),
        AdaptiveRoute(
          page: SetupRoute.page,
          path: 'setup',
        ),
      ],
    ),
    RedirectRoute(path: '*', redirectTo: '/'),
  ];
}
