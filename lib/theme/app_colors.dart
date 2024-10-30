import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class AppColors {
  static const Color black = Colors.black;
  static const Color lightGrey = Color(0xfff2f2f2);
  static const Color white = Colors.white;
  static const Color grey = Colors.grey;
  static const Color creme = Color(0xffF3ECE5);
  // static Color primary = Color(0xff2455ef);
  static Color primary = Colors.greenAccent;
  static const Color lightPrimary = Colors.blueAccent;
  static const Color pureWhite = Colors.white;
  static const Color pink_accent = Color(0xffEF90FF);
  static const Color yellow_accent = Color(0xffFFE890);
  static const Color green_accent = Color(0xff02FFB3);

  static const Color orange = Color(0xFFFA7E5C);
  static const Color yellow = Color(0xFFEED202);
  static const Color darkRed = Color(0xffBB4E4D);
  static const Color red = Colors.red;
  static const Color green = Color(0xFF68B882);
  static const Color blue = Color(0xFF4CA0FF);
  static const Color pink = Color(0xFFF4717F);
  static const Color darkBlue = Color(0xFF181924);
  static const Color darkestBlue = Color(0xff08081c);
  static const Color darkBlueGradientLight = Color(0xFF3d3f99);
  static const Color darkBlueGradientDark = Color(0xFF18193F);

  static final cardGradientDark = [
    const Color(0xff225664).withOpacity(0.7),
    const Color(0xff48314A).withOpacity(0.8),
  ];

  static const spaceBright = Color(0xff2a2a2f);
  static const spaceMedium = Color(0xff1b1a1a);
  static const spaceBlack = Color(0xff0f0f0f);
  static const spaceDark = Color(0xff191919); // Color(0xff050508)

  // Original
  // static final cardGradientDark = [
  //    const Color(0xff225664).withOpacity(0.5),
  //    const Color(0xff48314A).withOpacity(0.6),
  //  ];

  static final cardGradientLight = [
    AppColors.blue.withOpacity(0.75),
    AppColors.darkBlueGradientLight.withOpacity(0.77),
  ];
  static final cardGradientLight2 = [
    AppColors.blue.withOpacity(0.35),
    AppColors.darkBlueGradientLight.withOpacity(0.37),
  ];

  static setPrimary(Color color) {
    primary = color;
  }

// static loadPrimary() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   print('load primary called');
//   switch (prefs.getString('primary')) {
//     case 'Blue':
//       AppColors.setPrimary(AppColors.blue);
//       break;
//     case 'Pink':
//       AppColors.setPrimary(AppColors.pink);
//       break;
//     case 'Red':
//       AppColors.setPrimary(Colors.red);
//       break;
//     case 'Green':
//       AppColors.setPrimary(AppColors.green);
//       break;
//     default:
//       AppColors.setPrimary(AppColors.black);
//   }
//   print('primary is $primary');
// }
}
