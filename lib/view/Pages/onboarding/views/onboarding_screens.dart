import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF2E0249),
                Color(0xFF570A57),
              ],
            )),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: PageView.builder(
                      itemCount: demo_data.length,
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _pageIndex = index;
                        });
                      },
                      itemBuilder: ((context, index) => OnBoardingContent(
                            image: demo_data[index].image,
                            title: demo_data[index].title,
                            description: demo_data[index].description,
                          )),
                    ),
                  ),
                  Row(
                    children: [
                      ...List.generate(
                          demo_data.length,
                          (index) => Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child:
                                    DotIndicator(isActive: index == _pageIndex),
                              )),
                      const Spacer(),
                      SizedBox(
                        height: 74,
                        width: 74,
                        child: ElevatedButton(
                          onPressed: () {
                            _pageIndex == 2
                                ? Navigator.pushNamed(context, '/second')
                                : _pageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.ease);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            primary: const Color(0xFFA91079),
                          ),
                          child: SvgPicture.asset(
                            "assets/imgs/next-arrow.svg",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(
        milliseconds: 200,
      ),
      height: isActive ? 14 : 10,
      width: isActive ? 14 : 10,
      decoration: BoxDecoration(
        color: isActive ? Color(0xffFF5BE1) : Color(0xffD9D9D9),
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}

class Onboard {
  final String image, title, description;

  Onboard(
      {required this.image, required this.title, required this.description});
}

final List<Onboard> demo_data = [
  Onboard(
    image: "assets/imgs/img1.png",
    title: "SPORTS VENUES\nAROUND YOU",
    description:
        "Search for sports venues around you or any\nlocation that is available to play and \nbook instantly.",
  ),
  Onboard(
    image: "assets/imgs/img2.png",
    title: "MEET TEAMS &\nCHALLENGE THEM",
    description:
        "Search for teams around you or any\nlocation that are available to play and \nchallenge them.",
  ),
  Onboard(
    image: "assets/imgs/img3.png",
    title: "FIND COACH &\nGET TRAINED",
    description:
        "Find coaches of your sports niche and\nsend them a request to get trained.",
  ),
];

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
        ),
        SizedBox(
          height: 30,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Syne',
              fontWeight: FontWeight.w800,
              fontSize: 20,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Text(
            description,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Syne',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
