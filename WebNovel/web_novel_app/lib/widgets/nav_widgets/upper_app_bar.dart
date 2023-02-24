import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';

class UpperAppBar extends StatefulWidget implements PreferredSizeWidget {
  final BuildContext context;
  final GlobalKey<ScaffoldState> scaffoldKey;
  const UpperAppBar({Key? key, required this.context, required this.scaffoldKey}) : super(key: key);

  @override
  State<UpperAppBar> createState() => _UpperAppBarState();

  @override
  Size get preferredSize =>
      Size.fromHeight(MediaQuery.of(context).size.height * 0.07);
}

class _UpperAppBarState extends State<UpperAppBar> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Container(
        height: 10.h,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [semiDarkPurple, darkBlue, lightBlue],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 1,
                  offset: Offset.fromDirection(1),
                  color: black.withOpacity(0.7))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: InkWell(
                  onTap: () {
                    if (widget.scaffoldKey.currentState!.isDrawerOpen) {
                      widget.scaffoldKey.currentState!.closeDrawer();
                    } else {
                      widget.scaffoldKey.currentState!.openDrawer();
                    }
                  },
                  child: const FaIcon(
                    FontAwesomeIcons.bars,
                    size: 35,
                    color: black,
                  )),
            ),
            SizedBox(
              height: 10.h,
              width: 70.w,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 5),
                    height: 6.h,
                    width:6.h,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('assets/logo_app.png'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(60)),
                  ),
                  const Text(
                    "WebNovel",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
