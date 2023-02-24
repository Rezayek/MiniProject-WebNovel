import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/constants/colors.dart';
import 'package:web_novel_app/widgets/drawer/drawer_components/currency_holder.dart';

import '../../../services/Auth/user_cloud/user_data.dart';
import '../../../utilities/singletons/user_singleton.dart';

class UserInfosTop extends StatefulWidget {
  const UserInfosTop({Key? key}) : super(key: key);

  @override
  State<UserInfosTop> createState() => _UserInfosTopState();
}

class _UserInfosTopState extends State<UserInfosTop>
    with TickerProviderStateMixin {
  final UserData _userData = UserSingleton().getUser();
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FadeTransition(
          opacity: _animation,
          child: Container(
            height: 25.h,
            decoration:const BoxDecoration(
              color: white,
              gradient: LinearGradient(
                  colors: [lightBlue, white, lightPurple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            ),
          ),
        ),
        Container(
          height: 25.h,
          decoration: BoxDecoration(
            color: white.withOpacity(0.3),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(65),
                        image: _userData.imageUrl.isEmpty
                            ? const DecorationImage(
                                image: AssetImage('assets/avatar.png'))
                            : DecorationImage(
                                image: NetworkImage(_userData.imageUrl)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _userData.name,
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Lv: ${_userData.level}",
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CurrencyHolder(
                      icon: FontAwesomeIcons.gift, qte: _userData.gifts.length),
                  CurrencyHolder(
                      icon: FontAwesomeIcons.coins, qte: _userData.coins),
                  CurrencyHolder(
                      icon: Icons.diamond_outlined, qte: _userData.crystals),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
