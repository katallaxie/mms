import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:macos_ui/macos_ui.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:tray_manager/tray_manager.dart';

import 'package:mms/screens/app.dart';

/// This method initializes macos_window_utils and styles the window.
Future<void> _configureMacosWindowUtils() async {
  const config = MacosWindowUtilsConfig(
    toolbarStyle: NSWindowToolbarStyle.unified,
  );
  await config.apply();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _configureMacosWindowUtils();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  Bloc.observer = TalkerBlocObserver();

  runApp(const CustomApp());

  // doWhenWindowReady(() {
  //   trayManager
  //       // First thing we do is add the icon to the tray
  //       .setIcon('assets/images/tray_icon_inactive.png')
  //       // Then we want to get the position of the tray icon
  //       .then((noValue) {
  //     var listener = TrayClickListener();
  //     trayManager.addListener(listener);
  //     if (kDebugMode) {
  //       // In dev mode, go ahead and open the app
  //       // NOTE: It doesn't look like the app is positioned correctly when doing this, but for the sake of development
  //       // it should be fine
  //       listener.onTrayIconMouseUp();
  //     }
  //   });
  // });
}

/// This handles clicking on the tray icon
class TrayClickListener extends TrayListener {
  @override
  void onTrayIconMouseUp() {}
}
