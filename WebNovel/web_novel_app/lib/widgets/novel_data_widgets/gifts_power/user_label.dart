import 'package:flutter/material.dart';
import 'package:web_novel_app/constants/colors.dart';

class UserLabel extends StatelessWidget {
  final double height;
  final double width;
  final String userName;
  final String url;
  final Function(bool) onTap;
  const UserLabel({super.key, required this.height, required this.width, required this.userName, required this.url, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => onTap(true),
      child: SizedBox(
        height: height,
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: height * 0.8,
                width: width * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(75),
                  boxShadow: [BoxShadow(blurRadius: 1, offset: const Offset(1, 1), color: black.withOpacity(0.7))],
                  image: url.isNotEmpty? DecorationImage(image: NetworkImage(url),fit: BoxFit.fill): const DecorationImage(image: AssetImage("assets/logo_app.png"),fit: BoxFit.fill)
                ),
            ),
    
            SizedBox(
              height: height * 0.7,
              width: width * 0.55,
              child: Center(child: Text(userName, style: const TextStyle(color: black, fontSize: 15, fontWeight: FontWeight.w400), overflow: TextOverflow.ellipsis,)))
          ],
        ),
      ),
    );
  }
}
