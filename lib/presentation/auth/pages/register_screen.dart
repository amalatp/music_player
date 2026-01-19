import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_player/common/helpers/is_dark_mode.dart';
import 'package:music_player/common/widgets/common_app_button.dart';
import 'package:music_player/common/widgets/common_appbar.dart';
import 'package:music_player/common/widgets/common_textfield.dart';
import 'package:music_player/core/configs/assets/app_vectors.dart';
import 'package:music_player/presentation/auth/pages/sign_in_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
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
                "Register",
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
                labelText: "Full Name",
                controller: nameController,
              ),
              const SizedBox(height: 20),
              CommonTextfield(labelText: "Email", controller: emailController),
              const SizedBox(height: 20),
              CommonTextfield(
                labelText: "Password",
                controller: passwordController,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              CommonAppButton(onTap: () {}, text: "Create Account"),
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
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: "Do you have an account? ",
                    style: TextStyle(
                      fontSize: 13,
                      color: context.isDarkMode ? Colors.white : Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: "Sign In",
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
