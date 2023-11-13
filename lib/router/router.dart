import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

import 'package:mms/screens/app.dart';

import 'home_router.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|BottomSheet,Route')
class RootRouter extends _$RootRouter {
  RootRouter({Key? key}) : super();

  @override
  late List<AutoRoute> routes = [
    AdaptiveRoute(
      page: RootRoute.page,
      path: '/',
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
      ],
    ),
    RedirectRoute(path: '*', redirectTo: '/'),
  ];
}
