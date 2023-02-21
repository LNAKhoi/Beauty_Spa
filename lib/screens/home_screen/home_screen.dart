// ignore_for_file: avoid_unnecessary_containers

import 'package:beauty_spa/repositories/Auth.dart';
import 'package:beauty_spa/screens/login_screen/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/Auth/auth_bloc.dart';
import '../../models/customer.dart';
import '../../navigator/navigator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          Navigate.toScreen(context, LoginScreen());
        }
      },
      child: GestureDetector(
        onTap: () {
          print("Tap");
          _logOut(context);
        },
        child: Container(
          height: 100,
          width: 100,
          color: Colors.red,
        ),
      ),
    ));
  }

  void _logOut(context) {
    BlocProvider.of<AuthBloc>(context).add(SignOutRequested());
  }
}
