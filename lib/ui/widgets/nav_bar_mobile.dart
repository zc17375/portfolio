import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/home_logo.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({super.key, this.onLogoTap, this.onMenuTap});
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
        // decoration: kHeaderDecoration,
        child: Row(
          children: [
            const SizedBox(width: 50),
            HomeLogo(
              onTap: onLogoTap,
            ),
            const Spacer(),
            IconButton(
              onPressed: onMenuTap,
              icon: const Icon(Icons.menu),
            ),
            const SizedBox(
              width: 15,
            )
          ],
        ));
  }
}
