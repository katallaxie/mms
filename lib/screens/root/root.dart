import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
