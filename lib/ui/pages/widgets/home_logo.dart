import 'package:flutter/material.dart';
import 'package:portfolio/const/colors.dart';

class HomeLogo extends StatelessWidget {
  const HomeLogo({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        // child: const Text(
        //   "E-Portfolio",
        //   style: TextStyle(
        //     fontSize: 40,
        //     fontWeight: FontWeight.bold,
        //     decoration: TextDecoration.underline,
        //     color: CustomColor.scaffoldBg,
        //   ),
        // ),
        child: Transform.scale(
          scale: 2.0, // 設置縮放比例，此處為兩倍大小
          child: Image.asset(
            'logo/logo1.png',
          ),
        ));
  }
}
