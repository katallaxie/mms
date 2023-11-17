import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macos_ui/macos_ui.dart';

import 'package:mms/blocs/blocs.dart';
import 'package:mms/router/router.dart';

export 'home/home.dart';
export 'dashboard/dashboard.dart';
export 'root/root.dart';
export 'privileges/privileges.dart';
export 'settings/settings.dart';
export 'support/support.dart';
export 'setup/setup.dart';
export 'developer/developer.dart';

class CustomApp extends StatelessWidget {
  const CustomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SettingsBloc()),
      ],
      child: const _CustomAppView(),
    );
  }
}

class _CustomAppView extends StatelessWidget {
  const _CustomAppView();

  final routerKey = const GlobalObjectKey('root_router');

  @override
  Widget build(BuildContext context) {
    final rootRouter =
        RootRouter(key: routerKey, settingsBloc: context.read<SettingsBloc>());

    return BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
      return MacosApp.router(
        routerConfig: rootRouter.config(),
        debugShowCheckedModeBanner: false,
        themeMode: state.isSystemBrightness
            ? ThemeMode.system
            : state.isDarkMode
                ? ThemeMode.dark
                : ThemeMode.light,
        theme: MacosThemeData.light(),
        darkTheme: MacosThemeData.dark(),
        title: "MMS",
        localizationsDelegates: const [
          // AppLocalizations.delegate, // Add this line
          // GlobalMaterialLocalizations.delegate,
          // GlobalWidgetsLocalizations.delegate,
          // GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'), // English
        ],
      );
    });
  }
}
