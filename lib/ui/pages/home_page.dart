import 'package:flutter/material.dart';
import 'package:portfolio/const/colors.dart';
import 'package:portfolio/const/size.dart';
import 'package:portfolio/main.dart';
import 'package:portfolio/models/person_model.dart';
import 'package:portfolio/models/project_model.dart';
import 'package:portfolio/ui/widgets/carousel_img.dart';
import 'package:portfolio/ui/widgets/drawer_mobile.dart';
import 'package:portfolio/ui/widgets/main_desktop.dart';
import 'package:portfolio/ui/widgets/main_mobile.dart';
import 'package:portfolio/ui/widgets/nav_bar_mobile.dart';
import 'package:portfolio/ui/widgets/nav_bar_desktop.dart';
import 'package:portfolio/ui/widgets/project_desktop.dart';
import 'package:portfolio/ui/widgets/project_mobile.dart';
import 'package:portfolio/ui/widgets/skills_desktop.dart';
import 'package:portfolio/ui/widgets/skills_mobile.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

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
                if (constraints.maxWidth >= kMinDesktopWidth)
                  const MainDesktop()
                else
                  const MainMobile(),

                // Skills
                Container(
                  key: navbarKeys[1],
                  width: screenWidth,
                  padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                  color: CustomColor.containerBg3,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // title
                      const Text(
                        "Skill & Tools",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.headline,
                        ),
                      ),
                      const SizedBox(height: 30),
                      // skills
                      if (constraints.maxWidth >= kMedDesktopWidth)
                        const SkillsDesktop()
                      else
                        const SkillsMobile(),
                    ],
                  ),
                ),

                // Projects
                Container(
                  key: navbarKeys[2],
                  width: screenWidth,
                  padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                  child: Column(
                    children: [
                      // Hobby projects title
                      const Text(
                        "Projects",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.headline,
                        ),
                      ),
                      const SizedBox(height: 50),

                      // Project Cards
                      if (constraints.maxWidth >= kMedDesktopWidth)
                        const ProjectSectionDesktop()
                      else
                        const ProjectSectionMobile(),
                    ],
                  ),
                ),

                // Resume
                Container(
                  key: navbarKeys[3],
                  height: 500,
                  width: double.maxFinite,
                  color: CustomColor.containerBg3,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // title
                      const Text(
                        "Resume（Coming Soon）",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.headline,
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),

                // Contact
                Container(
                  key: navbarKeys[4],
                  height: 500,
                  width: double.maxFinite,
                  color: CustomColor.containerBg2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // title
                      const Text(
                        "Contacts（Coming Soon）",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.headline,
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
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