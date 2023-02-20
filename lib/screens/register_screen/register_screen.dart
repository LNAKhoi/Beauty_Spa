import 'package:beauty_spa/bloc/auth_bloc.dart';
import 'package:beauty_spa/repositories/Auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image:
                    AssetImage("lib/assets/backgrounds/register_screen.png"))),
        child: BlocProvider(
          create: (context) => AuthBloc(auth: Auth()),
          child: buildBody(),
        ),
      ),
    );
  }

  Widget buildBody() {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildLogo(),
            SizedBox(height: 32),
            buildScreenTitle(),
            SizedBox(height: 32),
            buildInputForm("Full name", nameController, false),
            buildInputForm("Phone number", phoneController, false),
            buildInputForm("Email", emailController, false),
            buildInputForm("Password", passController, true),
            buildInputForm("Day of birth", birthdayController, false),
            SizedBox(height: 16),
            buildRegisterButton()
          ],
        ),
      ),
    );
  }

  Widget buildLogo() {
    return SizedBox(
      height: 73,
      width: 330,
      child: Image.asset("lib/assets/logos/welcome_banner.png",
          fit: BoxFit.fitWidth),
    );
  }

  Text buildScreenTitle() {
    return Text("Please fill in your information",
        style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Color(0xffCF7866)));
  }

  Widget buildInputForm(
      String inputType, TextEditingController controller, bool isObsecureText) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Color(0xffEFAB9D))),
        child: TextField(
          controller: controller,
          obscureText: isObsecureText,
          style: GoogleFonts.inter(fontSize: 12, color: Color(0xffCF7866)),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 12, bottom: 14),
              border: InputBorder.none,
              hintStyle:
                  GoogleFonts.inter(fontSize: 12, color: Color(0xffEFAB9D)),
              hintText: inputType),
        ),
      ),
    );
  }

  Widget buildRegisterButton() {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: CupertinoButton(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 9),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color(0xffEBA697),
        onPressed: () {
          _createUser();
        },
        child: Text("Register",
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Colors.white)),
      ),
    );
  }

  void _createUser() {
    BlocProvider.of<AuthBloc>(context).add(SignUpRequested(
        nameController.text,
        emailController.text,
        phoneController.text,
        passController.text,
        birthdayController.text));
  }
}
