import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_player/common/helpers/is_dark_mode.dart';
import 'package:music_player/common/widgets/common_app_button.dart';
import 'package:music_player/common/widgets/common_appbar.dart';
import 'package:music_player/common/widgets/common_textfield.dart';
import 'package:music_player/core/configs/assets/app_vectors.dart';
import 'package:music_player/data/models/auth/signin_user_req.dart';
import 'package:music_player/presentation/auth/pages/register_screen.dart';
import 'package:music_player/presentation/home/pages/home_page.dart';
import 'package:music_player/service_locator.dart';

import '../../../domain/usecases/auth/sign_in_usecase.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              BasicAppbar(title: SvgPicture.asset(AppVectors.logo, height: 30)),
              Spacer(),
              Text(
                "Sign In",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: "If you need any support ",
                  style: TextStyle(
                    fontSize: 13,
                    color: context.isDarkMode ? Colors.white : Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: "click here",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              CommonTextfield(
                labelText: "Enter Username or Email",
                controller: usernameController,
              ),
              const SizedBox(height: 20),
              CommonTextfield(
                labelText: "Password",
                controller: passwordController,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text("Recovery Password", style: TextStyle(fontSize: 14)),
                ],
              ),
              const SizedBox(height: 20),
              CommonAppButton(
                onTap: () async {
                  var result = await sl<SignInUseCase>()(
                    params: SigninUserReq(
                      email: usernameController.text,
                      password: passwordController.text,
                    ),
                  );

                  result.fold(
                    (l) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(l)));
                    },
                    (r) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                        (route) => false,
                      );
                    },
                  );
                },
                text: "Sign In",
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(child: Divider()),
                  Text("   Or   ", style: TextStyle(fontSize: 13)),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: .center,
                children: [
                  SvgPicture.asset(AppVectors.googleLogo),
                  const SizedBox(width: 30),
                  SvgPicture.asset(
                    AppVectors.appleLogo,
                    colorFilter: ColorFilter.mode(
                      context.isDarkMode ? Colors.white : Colors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: "Not A Member? ",
                    style: TextStyle(
                      fontSize: 13,
                      color: context.isDarkMode ? Colors.white : Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: "Register Now",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
