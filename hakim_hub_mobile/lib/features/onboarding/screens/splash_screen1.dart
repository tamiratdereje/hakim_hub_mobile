import 'package:flutter/material.dart';
import 'package:hakim_hub_mobile/core/utils/colors.dart';
import 'package:hakim_hub_mobile/core/utils/ui_converter.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/screen/hospitals_home_screen.dart';

import '../widgets/build_dots.dart';
import '../widgets/top_bar_bottons.dart';

class OnBordingPage extends StatefulWidget {
  const OnBordingPage({super.key});

  @override
  State<OnBordingPage> createState() => _OnBordingPageState();
}

class _OnBordingPageState extends State<OnBordingPage> {
  List pages = [
    [
      'onboarding_docImg1.png',
      'HakimHub',
      'Provide easily accessible information about healthcare facilities and healthcare professionals.',
    ],
    [
      'onboarding_docImg2.png',
      'Nearby Doctors',
      'adequate information about doctors and where to find them',
    ],
    [
      'onboarding_Img3.png',
      'Customize your search',
      'Search for doctors or hospitals according to your needs and preferences',
    ],
  ];
  int currentIndex = 0;
  final PageController _controller = PageController(initialPage: 0);

  void updateIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondryTextColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: pages.length,
                onPageChanged: (value) => updateIndex(value),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      OnbordingTopBarButtons(
                          currentIndex: currentIndex,
                          updateIndex: updateIndex,
                          controller: _controller),
                      SizedBox(
                        height: UIConverter.getComponentHeight(context, 120),
                      ),
                      SizedBox(
                        height: UIConverter.getComponentHeight(context, 245),
                        width: UIConverter.getComponentWidth(context, 350),
                        child: Image(
                          image: AssetImage('assets/images/${pages[index][0]}'),
                        ),
                      ),
                      SizedBox(
                          height: UIConverter.getComponentHeight(context, 20)),
                      Text(
                        pages[index][1],
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        pages[index][2],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      // SizedBox(
                      //   height: UIConverter.getComponentHeight(context, 10),
                      // ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 35),
              child: Container(
                height: UIConverter.getComponentHeight(context, 40),
                width: UIConverter.getComponentWidth(context, 153),
                child: TextButton(
                  onPressed: () {
                    if (currentIndex == pages.length - 1) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const HospitalsHomeScreen(),
                        ),
                      );
                    }

                    _controller.nextPage(
                      duration: const Duration(milliseconds: 80),
                      curve: Curves.bounceIn,
                    );
                    updateIndex(currentIndex += 1);
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(primaryColor),
                    foregroundColor:
                        MaterialStateProperty.all(secondryTextColor),
                  ),
                  child: Text(currentIndex == pages.length - 1
                      ? "Get Started"
                      : "Next"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  pages.length,
                  (index) => buildDots(
                      currentIndex: currentIndex,
                      index: index,
                      context: context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
