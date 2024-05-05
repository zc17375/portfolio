import 'package:flutter/material.dart';
import 'package:portfolio/const/colors.dart';
import 'package:portfolio/models/project_model.dart';
import 'package:portfolio/ui/widgets/carousel_img.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class ProjectSectionMobile extends StatelessWidget {
  const ProjectSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (int i = 0; i < Projects.length; i++)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 460, // 容器寬度
                      height: 360, // 容器高度
                      child: CarouselImg(images: Projects[i].image),
                    ),
                    const SizedBox(
                      width: 30.0,
                    ),
                    FittedBox(
                      fit: BoxFit
                          .scaleDown, // 調整方式，這裡使用 BoxFit.scaleDown 表示按比例縮小，以保持原始比例並且不超過給定的範圍
                      child: SizedBox(
                        width: 460, // 定義容器寬度
                        height: 360, // 定義容器高度
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Project Title
                            Text(
                              Projects[i].title,
                              style: const TextStyle(
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold,
                                color: CustomColor.headline,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              Projects[i].subtitle,
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: CustomColor.secondary,
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 460,
                              ),
                              child: Wrap(
                                spacing: 10.0,
                                runSpacing: 10.0,
                                children: [
                                  for (var u = 0;
                                      u < Projects[i].skill.length;
                                      u++)
                                    Chip(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 6.0),
                                      backgroundColor: CustomColor.containerBg2,
                                      label: Text(
                                        Projects[i].skill[u],
                                        style: const TextStyle(fontSize: 18.0),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Wrap(
                              spacing: 24,
                              runSpacing: 24,
                              alignment: WrapAlignment.center,
                              children: [
                                if (Projects[i].demo != '')
                                  InkWell(
                                    onTap: () {
                                      launcher.launchUrl(
                                          Uri.parse(Projects[i].demo!),
                                          mode: launcher
                                              .LaunchMode.externalApplication);
                                      // js.context.callMethod("open", [SnsLinks.github]);
                                    },
                                    child: Image.asset(
                                      "assets/img/play.png",
                                      width: 48,
                                    ),
                                  ),
                                if (Projects[i].repo != '')
                                  InkWell(
                                    onTap: () {
                                      launcher.launchUrl(
                                          Uri.parse(Projects[i].repo!),
                                          mode: launcher
                                              .LaunchMode.externalApplication);
                                      // js.context.callMethod("open", [SnsLinks.linkedIn]);
                                    },
                                    child: Image.asset(
                                      "assets/img/github.png",
                                      width: 48,
                                    ),
                                  ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ]),
            ),
        ],
      ),
    );
  }
}
