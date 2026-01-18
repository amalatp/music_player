import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_player/common/helpers/is_dark_mode.dart';
import 'package:music_player/common/widgets/common_app_button.dart';
import 'package:music_player/common/widgets/common_appbar.dart';
import 'package:music_player/core/configs/assets/app_images.dart';
import 'package:music_player/core/configs/assets/app_vectors.dart';

class LoginOrSignup extends StatelessWidget {
  const LoginOrSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BasicAppbar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.topPattern),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.bottomPattern),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.loginbg),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
            child: Column(
              crossAxisAlignment: .center,
              children: [
                const SizedBox(height: 140),
                SvgPicture.asset(AppVectors.logo),
                const SizedBox(height: 60),
                Text(
                  "Enjoy listening to music",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                Text(
                  "Spotify is a proprietary Swedish audio streaming and media services provider",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17),
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CommonAppButton(onTap: () {}, text: "Register"),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: context.isDarkMode
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
