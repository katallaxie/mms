import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mms/blocs/blocs.dart';

@RoutePage()
class DeviceScreen extends StatelessWidget {
  const DeviceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DeviceScreenView();
  }
}

class DeviceScreenView extends StatelessWidget {
  const DeviceScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MacosScaffold(
        toolBar: ToolBar(
          title: const Text('Device'),
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
            return const SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _DeviceOS(),
                    _DeviceModel(),
                    _DeviceArch(),
                  ],
                ));
          }),
        ]);
  }
}

class _DeviceArch extends StatelessWidget {
  const _DeviceArch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MacosListTile(
      title: BlocBuilder<DeviceBloc, DeviceState>(
        builder: (context, state) => Text(state.deviceInfo.arch,
            style: MacosTheme.of(context).typography.headline),
      ),
      subtitle: Text(
        'Architecture',
        style: MacosTheme.of(context).typography.subheadline.copyWith(
              color: MacosColors.systemGrayColor,
            ),
      ),
    );
  }
}

class _DeviceOS extends StatelessWidget {
  const _DeviceOS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MacosListTile(
      title: BlocBuilder<DeviceBloc, DeviceState>(
        builder: (context, state) => Text(state.deviceInfo.osRelease,
            style: MacosTheme.of(context).typography.headline),
      ),
      subtitle: Text(
        'OS',
        style: MacosTheme.of(context).typography.subheadline.copyWith(
              color: MacosColors.systemGrayColor,
            ),
      ),
    );
  }
}

class _DeviceModel extends StatelessWidget {
  const _DeviceModel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MacosListTile(
      title: BlocBuilder<DeviceBloc, DeviceState>(
        builder: (context, state) => Text(state.deviceInfo.model,
            style: MacosTheme.of(context).typography.headline),
      ),
      subtitle: Text(
        'Model',
        style: MacosTheme.of(context).typography.subheadline.copyWith(
              color: MacosColors.systemGrayColor,
            ),
      ),
    );
  }
}
