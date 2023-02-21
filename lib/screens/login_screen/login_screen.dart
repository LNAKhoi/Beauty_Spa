// ignore_for_file: prefer_const_constructors
import "package:beauty_spa/bloc/Auth/auth_bloc.dart";
import 'package:beauty_spa/screens/home_screen/navigation.dart';
import "package:beauty_spa/navigator/navigator.dart";
import "package:beauty_spa/repositories/Auth.dart";
import "package:beauty_spa/screens/register_screen/register_screen.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:google_fonts/google_fonts.dart";

import "../home_screen/home_screen.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double screenWidth = 0.0;
  double screenHeight = 0.0;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }

          if (state is Authenticated) {
            Navigate.toScreen(context, Navigation());
          } else if (state is UnAuthenticated) {
            return;
          }
        },
        child: buildBody(),
      ),
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
        buildEmailInputField(),
        SizedBox(height: 20),
        buildPasswordInputField(),
      ],
    );
  }

  Widget buildEmailInputField() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xffCF7866).withOpacity(0.4))),
      child: TextField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: Color(0xffCF7866)),
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 12, bottom: 13),
            hintText: "Email",
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
        style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: Color(0xffCF7866)),
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
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 9),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color(0xffEBA697),
        onPressed: () {
          _authenticationWithEmailAndPassword(context);
        },
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
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigate.toScreen(context, RegisterScreen());
              },
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

  void _authenticationWithEmailAndPassword(context) {
    BlocProvider.of<AuthBloc>(context).add(SignInRequested(
        emailController.text.trim(), passwordController.text.trim()));
  }
}
