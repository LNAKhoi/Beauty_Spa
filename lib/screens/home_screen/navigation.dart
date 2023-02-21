import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'home_screen.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

enum UserNavigation { home, transaction, voucher, profile }

class _NavigationState extends State<Navigation> {


Map<UserNavigation, Widget> pages = {};
  UserNavigation selectedRoute = UserNavigation.home;
  @override
  void initState() {
    initPages();
    super.initState();
  }

  void initPages() {
    pages = {
      UserNavigation.home: HomeScreen(),
      // UserNavigation.jobs: JobScreen(),
      // UserNavigation.nearby: HomeScreen(),
      // UserNavigation.profile: ProfileScreen()
    };
  }

  @override
  Widget build(BuildContext context) {
    var layout = pages[selectedRoute];
    return Scaffold(
      bottomNavigationBar: buildNavigation(context),
      body: layout,
    );
  }

  Route createRoute(page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.linearToEaseOut,
            ),
          ),
          child: child,
        );
      },
    );
  }

  Widget buildNavigation(BuildContext context) {
    return Container(
        height: 60,
        decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 1, color: Color(0xffF4F5F6)),
            ),
            color: Color(0xffFFFFFF)),
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
              flex: 1,
              child: buildItem(
                  context,
                  "lib/assets/icons/home.svg",
                  "lib/assets/icons/home_active.svg",
                  "Home",
                  UserNavigation.home)),
          Expanded(
              flex: 1,
              child: buildItem(
                  context,
                  "lib/assets/icons/job.svg",
                  "lib/assets/icons/job_active.svg",
                  "Job",
                  UserNavigation.transaction)),
          Expanded(
              flex: 1,
              child: buildItem(
                  context,
                  "lib/assets/icons/location.svg",
                  "lib/assets/icons/location_active.svg",
                  "Nearby",
                  UserNavigation.voucher)),
          Expanded(
              flex: 1,
              child: buildItem(
                  context,
                  "lib/assets/icons/profile.svg",
                  "lib/assets/icons/profile_active.svg",
                  "Profile",
                  UserNavigation.profile)),
        ]));
  }

  Widget buildItem(BuildContext context, String iconPath, iconPathActive,
      String title, UserNavigation route) {
    var itemSelected = selectedRoute == route;
    var color = Color(0xff959595);
    var colorActive = Color(0xff3D86D6);
    if (itemSelected) {
      setState(() {
        color = colorActive;
      });
    }
    return Material(
      child: InkResponse(
        onTap: () {
          setState(() {
            selectedRoute = route;
          });
        },
        child: Container(
          margin: EdgeInsets.only(top: 14),
          child: Column(
            children: [
              Container(
                width: 20,
                height: 20,
                color: Colors.transparent,
                child: SvgPicture.asset(
                  itemSelected ? iconPathActive : iconPath,
                 // color: color,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                title,
                style: TextStyle(
                  fontFamily: ".SF Pro Text",
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
