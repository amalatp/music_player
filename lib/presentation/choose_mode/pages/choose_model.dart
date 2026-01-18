import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_player/common/widgets/common_app_button.dart';
import 'package:music_player/core/configs/assets/app_images.dart';
import 'package:music_player/core/configs/assets/app_vectors.dart';
import 'package:music_player/presentation/auth/pages/login_or_signup.dart';
import 'package:music_player/presentation/choose_mode/bloc/theme_cubit.dart';

class ChooseModel extends StatelessWidget {
  const ChooseModel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.choosemodebg),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SvgPicture.asset(AppVectors.logo),
                Spacer(),
                Text(
                  "Choose Mode",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.read<ThemeCubit>().updateTheme(
                              ThemeMode.dark,
                            );
                          },
                          child: ClipRRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                alignment: Alignment.center,
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withValues(alpha: 0.1),
                                ),
                                child: SvgPicture.asset(AppVectors.darkMode),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Dark Mode",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.read<ThemeCubit>().updateTheme(
                              ThemeMode.light,
                            );
                          },
                          child: ClipRRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                alignment: Alignment.center,
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white.withValues(alpha: 0.1),
                                ),
                                child: SvgPicture.asset(AppVectors.lightMode),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Light Mode",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 80),
                CommonAppButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginOrSignup(),
                      ),
                    );
                  },
                  text: "Continue",
                ),
              ],
            ),
          ),

          IgnorePointer(
            child: Container(color: Colors.black.withValues(alpha: 0.15)),
          ),
        ],
      ),
    );
  }
}
