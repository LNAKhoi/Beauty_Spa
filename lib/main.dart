import 'package:beauty_spa/bloc/Data_Retrieve/data_retrieve_bloc.dart';
import 'package:beauty_spa/repositories/Crud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:beauty_spa/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/Auth/auth_bloc.dart';
import 'firebase_options.dart';
import 'repositories/Auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(auth: Auth()),
        ),
        BlocProvider(
          create: (context) => DataRetrieveBloc(crud: Crud()),
        ),
      ],
      child: MaterialApp(
        title: 'Spa Application',
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
