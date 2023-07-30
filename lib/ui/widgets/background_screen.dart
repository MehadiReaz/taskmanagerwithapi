import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/assets_utils.dart';

class ScreenBackground extends StatelessWidget {
  const ScreenBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: SvgPicture.asset(
        AssetsUtils.backgroundSvg,
        fit: BoxFit.cover,
      ),
    );
  }
}
