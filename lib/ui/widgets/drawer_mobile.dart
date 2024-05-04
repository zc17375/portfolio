import 'package:flutter/material.dart';
import 'package:portfolio/const/colors.dart';
import 'package:portfolio/const/navbar_items.dart';

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({
    super.key,
    required this.onNavItemTap,
  });
  final Function(int) onNavItemTap;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColor.containerBg2,
      child: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 20,
                bottom: 20,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close),
              ),
            ),
          ),
          for (int i = 0; i < navIcons.length; i++)
            ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                titleTextStyle: const TextStyle(
                  color: CustomColor.headline,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                onTap: () {
                  onNavItemTap(i);
                },
                leading: Icon(navIcons[i]),
                title: Text(navTitles[i]))
        ],
      ),
    );
  }
}
