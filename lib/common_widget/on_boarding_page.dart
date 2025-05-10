import 'package:flutter/material.dart';
import '../common/color_extension.dart';

class OnBoardingPage extends StatelessWidget {
  final Map pObj;
  const OnBoardingPage({super.key, required this.pObj});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SizedBox(
      width: media.width,
      height: media.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Image.asset(
              pObj["image"],
              width: media.width,
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(height: media.width * 0.1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Center(
              child: Text(
                pObj["title"],
                style: TextStyle(
                  color: TColor.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Center(
              child: Text(
                pObj["subtitle"],
                style: TextStyle(color: TColor.black, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
