import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mms/blocs/blocs.dart';

@RoutePage()
class DeveloperScreen extends StatelessWidget {
  const DeveloperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DeveloperScreenView();
  }
}

class DeveloperScreenView extends StatelessWidget {
  const DeveloperScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MacosScaffold(
        toolBar: ToolBar(
          title: const Text('Developer'),
          titleWidth: 150.0,
          leading: MacosTooltip(
            message: 'Toggle Sidebar',
            useMousePosition: false,
            child: MacosIconButton(
              icon: MacosIcon(
                CupertinoIcons.sidebar_left,
                color: MacosTheme.brightnessOf(context).resolve(
                  const Color.fromRGBO(0, 0, 0, 0.5),
                  const Color.fromRGBO(255, 255, 255, 0.5),
                ),
                size: 20.0,
              ),
              boxConstraints: const BoxConstraints(
                minHeight: 20,
                minWidth: 20,
                maxWidth: 48,
                maxHeight: 38,
              ),
              onPressed: () => MacosWindowScope.of(context).toggleSidebar(),
            ),
          ),
        ),
        children: [
          ContentArea(builder: (context, scrollController) {
            return SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PushButton(
                        child: const Text('Reset Settings'),
                        onPressed: () => context
                            .read<SettingsBloc>()
                            .add(const SettingsEventReset()),
                        controlSize: ControlSize.regular)
                  ],
                ));
          }),
        ]);
  }
}
