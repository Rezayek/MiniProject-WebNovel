import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web_novel_app/views/navigation_views/inner_views/home_view.dart';
import 'package:web_novel_app/views/navigation_views/inner_views/library_view.dart';
import 'package:web_novel_app/views/navigation_views/inner_views/search_view.dart';
import 'package:web_novel_app/widgets/drawer/app_drawer.dart';
import 'package:web_novel_app/widgets/nav_widgets/upper_app_bar.dart';


import '../../constants/colors.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({Key? key}) : super(key: key);

  @override
  State<MainNavigationView> createState() => _MainNavigationViewState();
}

class _MainNavigationViewState extends State<MainNavigationView> {
  final List<Widget> _views = [const HomeView(), const LibraryView(), const SearchView()];
  int _currentIndex = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      appBar: UpperAppBar(context: context, scaffoldKey: scaffoldKey),
      body: _views[_currentIndex],
      bottomNavigationBar: bottomWidget(),
      drawer: const AppDrawer(),
    );
  }



  Widget bottomWidget() => Container(
      height: 55,
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
      child: Center(
        child: CurvedNavigationBar(
          color: white.withOpacity(0.3),
          backgroundColor: white.withOpacity(0),
          buttonBackgroundColor: black.withOpacity(0.5),
          height: 55,
          items: [
            FaIcon(FontAwesomeIcons.house,
                size: 30, color: _currentIndex == 0 ? white : black),
            FaIcon(FontAwesomeIcons.bookOpenReader,
                size: 30, color: _currentIndex == 1 ? white : black),
            FaIcon(FontAwesomeIcons.magnifyingGlass,
                size: 30, color: _currentIndex == 2 ? white : black)
          ],
          animationDuration: const Duration(milliseconds: 200),
          animationCurve: Curves.bounceInOut,
          index: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
}
