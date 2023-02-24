
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/constants/colors.dart';
import 'package:web_novel_app/constants/enums.dart';
import 'package:web_novel_app/widgets/drawer/drawer_components/drawer_option.dart';
import 'package:web_novel_app/widgets/drawer/drawer_components/user_infos_top.dart';



class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          color: white
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const UserInfosTop(),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SizedBox(
                height: 75.h ,
                child: const  Column(
                  children: [
                    DrawerOption(route: DrawerRoutes.acountManage, icon: Icons.account_circle_outlined, title: "Manage Account"),
                    DrawerOption(route: DrawerRoutes.bookMarked, icon: Icons.bookmark, title: "Book Marked"),
                    DrawerOption(route: DrawerRoutes.becomeAuthor, icon: FontAwesomeIcons.pencil, title: "Become Author"),
                    DrawerOption(route: DrawerRoutes.contests, icon: FontAwesomeIcons.rankingStar, title: "Contests"),
                    DrawerOption(route: DrawerRoutes.settings, icon: Icons.settings, title: "Settings"),
                    DrawerOption(route: DrawerRoutes.logOut, icon: Icons.logout_outlined, title: "LogOut"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}