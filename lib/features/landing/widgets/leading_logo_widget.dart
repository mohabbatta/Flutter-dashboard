import 'package:flutter/material.dart';

import '../../../constants/images_constants.dart';

class LeadingLogoWidget extends StatelessWidget {
  const LeadingLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImagesConstants.logo,
      fit: BoxFit.contain,
      width: 30,
      height: 60,
    );
  }
}
