import '../../common/color_extension.dart';
import 'package:fitness/common_widget/on_boarding_page.dart';
import 'package:fitness/view/login/signup_view.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int selectedPage = 0;
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      selectedPage = controller.page?.round() ?? 0;
      setState(() {});
    });
  }

  List pageArr = [
    {
      "title": "Get Workout Plans",
      "subtitle": "Personalized by our AI coach",
      "image": "assets/img/on1.jpeg",
    },
    {
      "title": "Reach your fitness goals",
      "subtitle": "Track your workouts, build habits, and stay motivated",
      "image": "assets/img/on2.jpeg",
    },
    {
      "title": "Stay Acrive,\nStay You",
      "subtitle": "Your journey starts here.",
      "image": "assets/img/on3.jpeg",
    },
    {
      "title": "Build Healthy\nHabits",
      "subtitle": "Develop routines for a balanced lifestyle.",
      "image": "assets/img/on4.jpeg",
    },
    {
      "title": "Relax and Focus",
      "subtitle": "Learn mindfulness and find your inner peace",
      "image": "assets/img/on5.jpeg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          PageView.builder(
            controller: controller,
            itemCount: pageArr.length,
            itemBuilder: (context, index) {
              var pObj = pageArr[index] as Map? ?? {};
              return OnBoardingPage(pObj: pObj);
            },
          ),
          Positioned(
            top: 40, // adjust as needed
            right: 20,
            child: TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpView() ));
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  color: TColor.primaryColor1,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(pageArr.length, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: selectedPage == index ? 16 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color:
                        selectedPage == index
                            ? TColor.primaryColor1
                            : TColor.primaryColor1.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 30,
            child: ElevatedButton(
              onPressed: () {
                if (selectedPage < pageArr.length - 1) {
                  selectedPage += 1;
                  controller.jumpToPage(selectedPage);
                  setState(() {});
                } else {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpView() ));
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: TColor.primaryColor1,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Next',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
