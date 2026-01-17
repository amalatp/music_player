import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_player/common/widgets/common_app_button.dart';
import 'package:music_player/core/configs/assets/app_images.dart';
import 'package:music_player/core/configs/assets/app_vectors.dart';
import 'package:music_player/core/configs/theme/app_colors.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.introbg),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SvgPicture.asset(AppVectors.logo),
                Spacer(),
                Text(
                  "Enjoy listening to music",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: AppColors.grey),
                ),
                const SizedBox(height: 20),
                CommonAppButton(onTap: () {}, text: "Get Started"),
              ],
            ),
          ),

          Container(color: Colors.black.withValues(alpha: 0.15)),
        ],
      ),
    );
  }
}
