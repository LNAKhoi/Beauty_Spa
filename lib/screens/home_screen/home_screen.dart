// ignore_for_file: avoid_unnecessary_containers

import 'package:beauty_spa/repositories/Auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/Auth/auth_bloc.dart';
import '../../models/customer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        print("Tap");
        _logOut(context);
      },
      child: Container(
        height: 100,
        width: 100,
        color: Colors.red,
      ),
    ));
  }

  void _logOut(context) {
    BlocProvider.of<AuthBloc>(context).add(SignOutRequested());
  }
}
