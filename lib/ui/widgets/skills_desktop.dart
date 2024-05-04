import 'package:flutter/material.dart';
import 'package:portfolio/const/colors.dart';
import 'package:portfolio/models/person_model.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // skills
        Flexible(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 600,
            ),
            child: Wrap(
              spacing: 20.0,
              runSpacing: 20.0,
              children: [
                for (int i = 0; i < skillItems.length; i++)
                  Chip(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12.0),
                    backgroundColor: CustomColor.containerBg2,
                    label: Text(
                      skillItems[i]["title"],
                      style: const TextStyle(fontSize: 18.0),
                    ),
                    avatar: Image.asset(
                      skillItems[i]["img"],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
