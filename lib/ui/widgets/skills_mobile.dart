import 'package:flutter/material.dart';
import 'package:portfolio/const/colors.dart';
import 'package:portfolio/models/person_model.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 500.0,
      ),
      child: Column(
        children: [
          // SKILL
          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            alignment: WrapAlignment.start,
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
                  avatar: Image.asset(skillItems[i]["img"]),
                  
                ),
            ],
          ),
        ],
      ),
    );
  }
}
