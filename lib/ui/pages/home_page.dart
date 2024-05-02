import 'package:flutter/material.dart';
import 'package:portfolio/const/colors.dart';
import 'package:portfolio/const/size.dart';
import 'package:portfolio/ui/pages/widgets/drawer_mobile.dart';
import 'package:portfolio/ui/pages/widgets/nav_bar_mobile.dart';
import 'package:portfolio/ui/pages/widgets/nav_bar_desktop.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(5, (index) => GlobalKey());
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        color: CustomColor.scaffoldBg, // 设置底色为蓝色
        padding: const EdgeInsets.all(10), // 设置 padding 为 10
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColor.containerBg2,
          endDrawer: constraints.maxWidth >= kMinDesktopWidth
              ? null
              : DrawerMobile(
                  onNavItemTap: (int navIndex) {
                    scaffoldKey.currentState?.closeEndDrawer();
                    scrollToSection(navIndex);
                  },
                ),
          appBar: PreferredSize(
            preferredSize: Size(screenWidth, 100),
            child: (constraints.maxWidth >= kMinDesktopWidth)
                ? HeaderDesktop(
                    onNavMenuTap: (int navIndex) {
                      scrollToSection(navIndex);
                    },
                  )
                : HeaderMobile(
                    onLogoTap: () {},
                    onMenuTap: () {
                      scaffoldKey.currentState?.openEndDrawer();
                    },
                  ),
          ),
          body: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  key: navbarKeys.first,
                ),
                // Main
                Container(
                  height: 500,
                  width: double.maxFinite,
                ),

                // Skills
                Container(
                  key: navbarKeys[1],
                  height: 500,
                  width: double.maxFinite,
                  color: CustomColor.containerBg3,
                ),

                // Projects
                Container(
                  key: navbarKeys[2],
                  height: 500,
                  width: double.maxFinite,
                ),

                // Resume
                Container(
                  key: navbarKeys[3],
                  height: 500,
                  width: double.maxFinite,
                  color: CustomColor.containerBg3,
                ),

                // Contact
                Container(
                  key: navbarKeys[4],
                  height: 500,
                  width: double.maxFinite,
                  color: CustomColor.containerBg2,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  void scrollToSection(int navIndex) {
    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
