// ignore_for_file: avoid_unnecessary_containers, prefer_interpolation_to_compose_strings, unused_element

import 'package:beauty_spa/bloc/Data_Retrieve/data_retrieve_bloc.dart';
import 'package:beauty_spa/custom_widgets/custom_dialog.dart';
import 'package:beauty_spa/repositories/Auth.dart';
import 'package:beauty_spa/repositories/Crud.dart';
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
  List<String> imgSources = [];
  @override
  void initState() {
    requestDataRetrieve();
    BlocProvider.of<DataRetrieveBloc>(context)
        .add(CustomerDataRetrieveRequest());
    BlocProvider.of<DataRetrieveBloc>(context)
        .add(SalonImageListRetrieveRequest());
    super.initState();
  }

  requestDataRetrieve() async {
    _customer = await Crud().retrieveUser();
    if (_customer != null) {
      customerName = _customer!.fullName;
    }
    imgSources.addAll(await Crud().retrieveSalonImages());
    print(imgSources.toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MultiBlocListener(
            listeners: [
          BlocListener<AuthBloc, AuthState>(
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
          ),
          BlocListener<DataRetrieveBloc, DataRetrieveState>(
            listener: (context, state) {
              if (state is DataRetrieveFailed) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }
            },
          ),
        ],
            child: BlocBuilder<DataRetrieveBloc, DataRetrieveState>(
                builder: (context, state) {
              if (state is DataRetrieving) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is DataRetrieveFailed) {
                return Container();
              }

              return buildBody(context);
            })));
  }

  Widget buildBody(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(16, 36, 16, 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildWelcomeTitle(customerName),
            SizedBox(height: 16),
            buildListPhotos()
          ],
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

  Widget buildListPhotos() {
    return Container(
      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: imgSources.length,
          itemBuilder: ((context, index) {
            return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  imgSources[index],
                  fit: BoxFit.fitWidth,
                ));
          })),
    );
  }
}
