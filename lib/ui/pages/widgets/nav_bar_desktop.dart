import 'package:flutter/material.dart';
import 'package:portfolio/const/colors.dart';
import 'package:portfolio/const/navbar_items.dart';
import 'package:portfolio/ui/pages/widgets/home_logo.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({
    super.key,
    required this.onNavMenuTap,
  });
  final Function(int) onNavMenuTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColor.containerBg2,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      // width: double.maxFinite,
      child: Row(children: [
        const SizedBox(width: 50),
        HomeLogo(onTap: () {}),
        const Spacer(),
        for (int i = 0; i < navTitles.length; i++)
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: TextButton(
              onPressed: () {
                onNavMenuTap(i);
              },
              child: Text(navTitles[i],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: CustomColor.headline,
                  )),
            ),
          ),
      ]),
    );
  }
}
