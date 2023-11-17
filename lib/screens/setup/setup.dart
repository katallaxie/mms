import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:mms/blocs/blocs.dart';

@RoutePage()
class SetupScreen extends StatelessWidget {
  const SetupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SetupScreenView();
  }
}

class SetupScreenView extends StatelessWidget {
  const SetupScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MacosScaffold(children: [
      ContentArea(builder: (context, scrollController) {
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const FlutterLogo(size: 64),
                  Text('A tool to manage your mac.',
                      style: MacosTheme.of(context).typography.title1),
                ],
              ),
              PushButton(
                  child: const Text("Getting Started"),
                  onPressed: () => context
                      .read<SettingsBloc>()
                      .add(const SettingsEventIsFirstLaunch()),
                  controlSize: ControlSize.regular)
            ],
          ),
        );
      }),
    ]);
  }
}
