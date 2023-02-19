// ignore_for_file: prefer_const_constructors

import "package:flutter/cupertino.dart";
import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:google_fonts/google_fonts.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double screenWidth = 0.0;
  double screenHeight = 0.0;
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Container(
      width: screenWidth,
      height: screenHeight,
      padding: EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/assets/backgrounds/login_screen.jpg'),
              fit: BoxFit.fill)),
      child: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("lib/assets/logos/app_logo.png"),
            buildLoginForm(),
            SizedBox(height: 8),
            buildForgotPassword(),
            SizedBox(height: 20),
            buildLoginButton(),
            SizedBox(height: 32),
            buildRegister()
          ],
        ),
      ),
    );
  }

  Widget buildLoginForm() {
    return Column(
      children: [
        buildPhoneInputField(),
        SizedBox(height: 20),
        buildPasswordInputField(),
      ],
    );
  }

  Widget buildPhoneInputField() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xffCF7866).withOpacity(0.4))),
      child: TextField(
        controller: phoneController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 12, bottom: 13),
            hintText: "Phone number",
            hintStyle: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color(0xffEFAB9D))),
      ),
    );
  }

  Widget buildPasswordInputField() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xffCF7866).withOpacity(0.4))),
      child: TextField(
        controller: passwordController,
        obscureText: true,
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 12, bottom: 13),
            hintText: "Password",
            hintStyle: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color(0xffEFAB9D))),
      ),
    );
  }

  Widget buildForgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
          onPressed: () {},
          child: Text("Forgot password?",
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xffCF7866)))),
    );
  }

  Widget buildLoginButton() {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: CupertinoButton(
        key: Key("loginButton"),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 9),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color(0xffEBA697),
        onPressed: () {},
        child: Text("Login",
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.white)),
      ),
    );
  }

  Widget buildRegister() {
    return Align(
      alignment: Alignment.center,
      child: RichText(
          text: TextSpan(
        text: 'Not a member? ',
        style: GoogleFonts.inter(
            color: Color(0xffCF7866),
            fontSize: 14,
            fontWeight: FontWeight.w400),
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = () {},
            text: 'Register here',
            style: GoogleFonts.inter(
                color: Color(0xffCF7866),
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
        ],
      )),
    );
  }
}