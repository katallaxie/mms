import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:macos_ui/macos_ui.dart';

import 'package:mms/screens/dashboard/dashboard.dart';

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
              onChanged: (i) {},
              scrollController: scrollController,
              itemSize: SidebarItemSize.large,
              items: const [
                SidebarItem(
                  leading: MacosImageIcon(
                    AssetImage('assets/sf_symbols/button_programmable_2x.png'),
                  ),
                  label: Text('Buttons'),
                ),
                SidebarItem(
                  leading: MacosImageIcon(
                    AssetImage(
                      'assets/sf_symbols/lines_measurement_horizontal_2x.png',
                    ),
                  ),
                  label: Text('Indicators'),
                ),
                SidebarItem(
                  leading: MacosImageIcon(
                    AssetImage(
                      'assets/sf_symbols/character_cursor_ibeam_2x.png',
                    ),
                  ),
                  label: Text('Fields'),
                ),
                SidebarItem(
                  leading: MacosImageIcon(
                    AssetImage('assets/sf_symbols/rectangle_3_group_2x.png'),
                  ),
                  label: Text('Colors'),
                ),
                SidebarItem(
                  leading: MacosIcon(CupertinoIcons.square_on_square),
                  label: Text('Dialogs & Sheets'),
                ),
                SidebarItem(
                  leading: MacosImageIcon(
                    AssetImage(
                      'assets/sf_symbols/macwindow.on.rectangle_2x.png',
                    ),
                  ),
                  label: Text('Layout'),
                  disclosureItems: [
                    SidebarItem(
                      leading: MacosIcon(CupertinoIcons.macwindow),
                      label: Text('Toolbar'),
                    ),
                    SidebarItem(
                      leading: MacosImageIcon(
                        AssetImage(
                          'assets/sf_symbols/menubar.rectangle_2x.png',
                        ),
                      ),
                      label: Text('SliverToolbar'),
                    ),
                    SidebarItem(
                      leading: MacosIcon(CupertinoIcons.uiwindow_split_2x1),
                      label: Text('TabView'),
                    ),
                    SidebarItem(
                      leading: MacosIcon(CupertinoIcons.rectangle_split_3x1),
                      label: Text('ResizablePane'),
                    ),
                  ],
                ),
                SidebarItem(
                  leading: MacosImageIcon(
                    AssetImage(
                        'assets/sf_symbols/filemenu_and_selection_2x.png'),
                  ),
                  label: Text('Selectors'),
                ),
                SidebarItem(
                  leading: MacosIcon(CupertinoIcons.textformat_size),
                  label: Text('Typography'),
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
        child: [const DashboardScreen()][pageIndex],
      ),
    );
  }
}
