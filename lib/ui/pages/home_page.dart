import 'package:flutter/material.dart';
import 'package:portfolio/const/colors.dart';
import 'package:portfolio/const/size.dart';
import 'package:portfolio/models/person_model.dart';
import 'package:portfolio/ui/widgets/drawer_mobile.dart';
import 'package:portfolio/ui/widgets/footer.dart';
import 'package:portfolio/ui/widgets/main_desktop.dart';
import 'package:portfolio/ui/widgets/main_mobile.dart';
import 'package:portfolio/ui/widgets/nav_bar_mobile.dart';
import 'package:portfolio/ui/widgets/nav_bar_desktop.dart';
import 'package:portfolio/ui/widgets/project_desktop.dart';
import 'package:portfolio/ui/widgets/project_mobile.dart';
import 'package:portfolio/ui/widgets/skills_desktop.dart';
import 'package:portfolio/ui/widgets/skills_mobile.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'dart:html' as html;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _initFloatingButton();
  }

  // 懸浮按鈕:Back to Top
  void _initFloatingButton() {
    html.window.addEventListener('scroll', (_) {
      final floatingButton = html.document.getElementById('floating-button');
      if (html.window.pageYOffset > 100) {
        floatingButton?.style.display = 'block';
      } else {
        floatingButton?.style.display = 'none';
      }
    });
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(5, (index) => GlobalKey());
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return LayoutBuilder(builder: (context, constraints) {
      // print('屏幕宽度: $screenWidth, 屏幕高度: $screenHeight');
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
          // 懸浮按鈕
          floatingActionButton: FloatingActionButton(
            backgroundColor: CustomColor.scaffoldBg,
            onPressed: () {
              scrollToSection(0);
            },
            child: const Icon(
              Icons.arrow_upward,
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

                      // Project Section
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
                  height: screenHeight / 1.4,
                  width: double.maxFinite,
                  color: CustomColor.containerBg3,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // title
                      const Text(
                        "Resume",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.headline,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Image.asset(
                        "assets/img/cv.jpg",
                        width: screenWidth,
                        height: screenHeight / 2,
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // ElevatedButton(
                          //   onPressed: () {
                          //     // 下載
                          //     download(SnsLinks.cv_pdf);
                          //   },
                          //   style: ElevatedButton.styleFrom(
                          //     primary: CustomColor.containerBg2, // 背景顏色
                          //     onPrimary: CustomColor.headline, // 文字顏色
                          //     padding: const EdgeInsets.symmetric(
                          //         horizontal: 32, vertical: 16), // 內邊距
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(10), // 圓角半徑
                          //       side: BorderSide(color: Colors.black, width: 2),
                          //     ),
                          //   ),
                          //   child: Text(
                          //     '下載',
                          //     style: const TextStyle(fontSize: 18),
                          //   ),
                          // ),
                          ElevatedButton(
                            onPressed: () {
                              launcher.launchUrl(
                                Uri.parse(SnsLinks.cv_pdf),
                                mode: launcher.LaunchMode.externalApplication,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: CustomColor.containerBg2, // 背景顏色
                              onPrimary: CustomColor.headline, // 文字顏色
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 16), // 內邊距
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // 圓角半徑
                                side: BorderSide(color: Colors.black, width: 2),
                              ),
                            ),
                            child: Text(
                              '線上檢視',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // // Contact
                // Container(
                //   key: navbarKeys[4],
                //   height: 500,
                //   width: double.maxFinite,
                //   color: CustomColor.containerBg2,
                //   child: Column(
                //     mainAxisSize: MainAxisSize.min,
                //     children: [
                //       // title
                //       const Text(
                //         "Contacts（Coming Soon）",
                //         style: TextStyle(
                //           fontSize: 32,
                //           fontWeight: FontWeight.bold,
                //           color: CustomColor.headline,
                //         ),
                //       ),
                //       const SizedBox(height: 30),
                //     ],
                //   ),
                // ),

                const SizedBox(height: 10),

                // FOOTER
                const Footer(),

                // back to Top button
                SafeArea(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: FloatingActionButton(
                        onPressed: () {
                          scrollToSection(0);
                        },
                        child: Icon(Icons.vertical_align_top),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  // 滑動到Section
  void scrollToSection(int navIndex) {
    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
