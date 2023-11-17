import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:mms/screens/app.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

import 'platform_menus.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  late final searchFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PlatformMenuBar(
      menus: menuBarItems(),
      child: MacosWindow(
        sidebar: Sidebar(
          top: MacosSearchField(
            placeholder: 'Search',
            controller: searchFieldController,
            onResultSelected: (result) {
              // switch (result.searchKey) {
              //   case 'Buttons':
              //     setState(() {
              //       pageIndex = 0;
              //       searchFieldController.clear();
              //     });
              //     break;
              //   case 'Indicators':
              //     setState(() {
              //       pageIndex = 1;
              //       searchFieldController.clear();
              //     });
              //     break;
              //   case 'Fields':
              //     setState(() {
              //       pageIndex = 2;
              //       searchFieldController.clear();
              //     });
              //     break;
              //   case 'Colors':
              //     setState(() {
              //       pageIndex = 3;
              //       searchFieldController.clear();
              //     });
              //     break;
              //   case 'Dialogs and Sheets':
              //     setState(() {
              //       pageIndex = 4;
              //       searchFieldController.clear();
              //     });
              //     break;
              //   case 'Toolbar':
              //     setState(() {
              //       pageIndex = 6;
              //       searchFieldController.clear();
              //     });
              //     break;
              //   case 'ResizablePane':
              //     setState(() {
              //       pageIndex = 7;
              //       searchFieldController.clear();
              //     });
              //     break;
              //   case 'Selectors':
              //     setState(() {
              //       pageIndex = 8;
              //       searchFieldController.clear();
              //     });
              //     break;
              //   default:
              //     searchFieldController.clear();
              // }
            },
            results: const [],
          ),
          minWidth: 200,
          builder: (context, scrollController) {
            return SidebarItems(
              currentIndex: pageIndex,
              onChanged: (i) {
                setState(() => pageIndex = i);
              },
              scrollController: scrollController,
              itemSize: SidebarItemSize.large,
              items: const [
                SidebarItem(
                  leading: MacosIcon(CupertinoIcons.person),
                  label: Text('Dashboard'),
                ),
                SidebarItem(
                  leading: MacosIcon(CupertinoIcons.lock),
                  label: Text('Privileges'),
                ),
                SidebarItem(
                  leading: MacosIcon(CupertinoIcons.device_laptop),
                  label: Text('Device'),
                ),
                SidebarItem(
                  leading: MacosIcon(CupertinoIcons.phone),
                  label: Text('Support'),
                ),
                SidebarItem(
                  leading: MacosIcon(CupertinoIcons.device_laptop),
                  label: Text('Developer'),
                ),
              ],
            );
          },
          bottom: const MacosListTile(
            leading: MacosIcon(CupertinoIcons.profile_circled),
            title: Text('Tim Apple'),
            subtitle: Text('tim@apple.com'),
          ),
        ),
        endSidebar: Sidebar(
          startWidth: 200,
          minWidth: 200,
          maxWidth: 300,
          shownByDefault: false,
          builder: (context, _) {
            return const Center(
              child: Text('End Sidebar'),
            );
          },
        ),
        child: [
          CupertinoTabView(builder: (_) => const DashboardScreen()),
          const PrivilegesScreen(),
          const DeviceScreen(),
          const SupportScreen(),
          const DeveloperScreen()
        ][pageIndex],
      ),
    );
  }
}
