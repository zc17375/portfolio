import 'package:flutter/material.dart';
import 'package:portfolio/const/colors.dart';
import 'package:portfolio/models/person_model.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      height: screenHeight / 1.4,
      constraints: const BoxConstraints(
        minHeight: 400.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            child: SizedBox(
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // 水平方向對齊
                mainAxisAlignment: MainAxisAlignment.center, // 垂直方向對齊
                children: [
                  // const SizedBox(
                  //   width: 800.0,
                  // ),
                  Text(
                    PersonContent.name,
                    style: const TextStyle(
                      fontSize: 66.0,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.headline,
                    ),
                  ),
                  Text(
                    PersonContent.subTitle,
                    style: const TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.secondary,
                    ),
                  ),
                  Text(
                    PersonContent.intro,
                    softWrap: true,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: CustomColor.headline,
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
                      InkWell(
                        onTap: () {
                          launcher.launchUrl(Uri.parse(SnsLinks.github),
                              mode: launcher.LaunchMode.externalApplication);
                          // js.context.callMethod("open", [SnsLinks.github]);
                        },
                        child: Image.asset(
                          "assets/img/github.png",
                          width: 48,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          launcher.launchUrl(Uri.parse(SnsLinks.linkedIn),
                              mode: launcher.LaunchMode.externalApplication);
                          // js.context.callMethod("open", [SnsLinks.linkedIn]);
                        },
                        child: Image.asset(
                          "assets/img/linkedin.png",
                          width: 48,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          launcher.launchUrl(Uri.parse(SnsLinks.cv),
                              mode: launcher.LaunchMode.externalApplication);
                          // js.context.callMethod("open", [SnsLinks.facebook]);
                        },
                        child: Image.asset(
                          "assets/img/cv.png",
                          width: 48,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          launcher.launchUrl(
                              Uri.parse(
                                'mailto:${Email.email}?subject=${Email.subject}&body=${Email.body}',
                              ),
                              mode: launcher.LaunchMode.externalApplication);
                          // js.context.callMethod("open", [SnsLinks.instagram]);
                        },
                        child: Image.asset(
                          "assets/img/email.png",
                          width: 48,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 100,
          ),
          Image.asset(
            "assets/img/avatar.jpg",
            // width: screenWidth / 2,
            height: screenHeight / 2.5,
          ),
        ],
      ),
    );
  }
}
