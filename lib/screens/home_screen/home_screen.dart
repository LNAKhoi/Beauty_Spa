// ignore_for_file: avoid_unnecessary_containers

import 'package:beauty_spa/custom_widgets/custom_dialog.dart';
import 'package:beauty_spa/repositories/Auth.dart';
import 'package:beauty_spa/repositories/CRUD.dart';
import 'package:beauty_spa/screens/login_screen/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/Auth/auth_bloc.dart';
import '../../models/customer.dart';
import '../../navigator/navigator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Customer? _customer;
  String customerName = "";
  @override
  void initState() {
    if (_customer == null) {
      customerName = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
        if (state is UnAuthenticated) {
          //showAlert(context,"","You have been logget out!",Navigate.toScreen(context, destinationWidget))
          CustomDialog.showAlert(
              title: "Logged Out",
              context: context,
              destinationWidget: LoginScreen());
        }
      },
      child: GestureDetector(
        onTap: () {
          _logOut(context);
        },
        child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: CRUD().readCustomerData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                _customer = Customer.fromJson(snapshot.data!.data()!);
                customerName = _customer!.fullName;
              }
              return buildBody(context);
            }),
      ),
    ));
  }

  Widget buildBody(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(16, 36, 16, 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [buildWelcomeTitle(customerName)],
        ),
      ),
    );
  }

  Widget buildWelcomeTitle(String userName) {
    return Container(
      child: Text("Hello " + userName,
          style:
              GoogleFonts.greatVibes(fontSize: 28, color: Color(0xff565656))),
    );
  }

  void _logOut(context) {
    BlocProvider.of<AuthBloc>(context).add(SignOutRequested());
  }
}
