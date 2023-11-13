import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mms/blocs/blocs.dart';
import 'package:mms/router/router.dart';

export 'home/home.dart';
export 'root/root.dart';

class CustomApp extends StatelessWidget {
  const CustomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SettingsBloc()),
        ],
        child: const _CustomAppView(),
      ),
    );
  }
}

class _CustomAppView extends StatelessWidget {
  const _CustomAppView();

  final routerKey = const GlobalObjectKey('root_router');

  @override
  Widget build(BuildContext context) {
    final rootRouter = RootRouter(key: routerKey);

    return BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
      return MaterialApp.router(
        routerConfig: rootRouter.config(),
        debugShowCheckedModeBanner: false,
        themeMode: state.isSystemBrightness
            ? ThemeMode.system
            : state.isDarkMode
                ? ThemeMode.dark
                : ThemeMode.light,
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
