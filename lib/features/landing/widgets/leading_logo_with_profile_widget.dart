import 'package:flutter/material.dart';

import '../../../constants/images_constants.dart';

class LeadingLogoWithProfileWidget extends StatelessWidget {
  const LeadingLogoWithProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(ImagesConstants.logoDark, fit: BoxFit.contain, width: 100, height: 60),
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImagesConstants.avatarBackGround),
              alignment: Alignment.center,
              fit: BoxFit.none,
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: <Widget>[
                SizedBox(width: 35),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(ImagesConstants.avatar),
                ),
                SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'john.doe@example.com',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 35),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
