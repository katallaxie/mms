import 'package:auto_route/auto_route.dart';
import 'package:mms/blocs/settings_bloc.dart';

import 'package:mms/repositories/repositories.dart';
import 'package:mms/router/router.dart';

class SetupGuard extends AutoRouteGuard {
  const SetupGuard({required this.setupBloc});

  final SettingsBloc setupBloc;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (!setupBloc.state.isFirstLaunch) {
      resolver.next(true);
      return;
    }

    resolver.redirect(const SetupRoute());
    resolver.next(await setupBloc.stream
        .skipWhile((state) => state.isFirstLaunch)
        .asyncMap((user) => !user.isFirstLaunch)
        .first);
  }
}
