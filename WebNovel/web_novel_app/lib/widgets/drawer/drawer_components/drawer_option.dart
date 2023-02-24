import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colors.dart';
import '../../../constants/enums.dart';
import '../../../services/Auth/auth_bloc/auth_bloc.dart';
import '../../../services/Auth/auth_bloc/auth_events.dart';
import '../../../utilities/singletons/user_singleton.dart';

class DrawerOption extends StatefulWidget {
  final DrawerRoutes route;
  final IconData icon;
  final String title;
  const DrawerOption(
      {Key? key, required this.route, required this.icon, required this.title})
      : super(key: key);

  @override
  State<DrawerOption> createState() => _DrawerOptionState();
}

class _DrawerOptionState extends State<DrawerOption> {
  bool isHoover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        if (!isHoover) {
          setState(() {
            isHoover = true;
          });
        } else {
          setState(() {
            isHoover = false;
          });
        }
      },
      onTapUp: (details) {
        if (isHoover) {
          setState(() {
            isHoover = false;
          });
        }
      },
      onTapCancel: () {
        if (isHoover) {
          setState(() {
            isHoover = false;
          });
        }
      },
      onTap: () {
        switch (widget.route) {
          case DrawerRoutes.acountManage:
            break;
          case DrawerRoutes.bookMarked:
            // TODO: Handle this case.
            break;
          case DrawerRoutes.becomeAuthor:
            // TODO: Handle this case.
            break;
          case DrawerRoutes.author:
            // TODO: Handle this case.
            break;
          case DrawerRoutes.contests:
            // TODO: Handle this case.
            break;
          case DrawerRoutes.settings:
            // TODO: Handle this case.
            break;
          case DrawerRoutes.logOut:
            UserSingleton().reserUser();
            context.read<AuthBloc>().add(const AuthEventLogOut());
            Navigator.of(context).pushNamedAndRemoveUntil("/", (Route<dynamic> route) => false);
            
            break;
        }
      },
      child: AnimatedContainer(
        margin: EdgeInsets.only(top: 2.h),
        height: 6.h,
        width: 80.w,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInCirc,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                blurRadius: 1.5,
                offset: const Offset(1, 1),
                color: black.withOpacity(0.7))
          ],
          gradient: LinearGradient(colors: [
            isHoover ? lightPurple.withOpacity(0.5) : lightBlue,
            white,
            white,
            isHoover ? lightPurple.withOpacity(0.5) : white,
            isHoover ? lightPurple.withOpacity(0.5) : white
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 16.0),
              child: Icon(
                widget.icon,
                size: 4.5.h,
                color: black,
              ),
            ),
            Text(
              widget.title,
              style: const TextStyle(
                  color: black, fontSize: 18, fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
