import 'package:flutter/material.dart';

import '../app_properties.dart';
import 'home_page.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int pageIndex = 0;
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(

        decoration: BoxDecoration(
            color: Colors.grey[100],
            image: const DecorationImage(image: AssetImage('images/background.png'))),
        child: Stack(
          children: <Widget>[
            PageView(
                onPageChanged: (value) {
                  setState(() {
                    pageIndex = value;
                  });
                },
                controller: controller,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Center(
                        child: Image.asset(
                          'images/firstScreen.png',
                          height: 200,
                          width: 200,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: Text(
                          'Get Any Thing Online',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20,letterSpacing: 1),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16.0),
                        child: Text(
                          'You can buy anything ranging from digital products to hardware within few clicks.',
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Colors.grey, fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                     Center(
                       child: Image.asset("images/secondScreen.png",height: 200,width: 200,),

                     ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: Text(
                          'Shipping to anywhere',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20,letterSpacing: 1),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16.0),
                        child: Text(
                          'We will ship to anywhere in the world,With 30 days 100% money back',
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Colors.grey, fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Center(
                        child: Image.asset("images/thirdScreen.png",height: 200,width: 200,),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: Text(
                          'On-time delivery',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20,letterSpacing: 1),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16.0),
                        child: Text(
                          'You can track your product with our powerful tracking services',
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Colors.grey, fontSize: 14.0),
                        ),
                      ),
                    ],
                  )

    ]),
            Positioned(
              bottom: 16.0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.all(8.0),
                            height: 12,
                            width: 12,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black, width: 2),
                                color: pageIndex == 0 ? yellow : Colors.white),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8.0),
                            height: 12,
                            width: 12,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black, width: 2),
                                color: pageIndex == 1 ? yellow : Colors.white),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8.0),
                            height: 12,
                            width: 12,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black, width: 2),
                                color: pageIndex == 2 ? yellow : Colors.white),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Opacity(
                            opacity: pageIndex != 2 ? 1.0 : 0.0,
                            child: TextButton(
                              child: const Text(
                                'SKIP',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => const MainScaffold()));
                              },
                            ),
                          ),
                          pageIndex != 2
                              ? TextButton(
                            child: const Text(
                              'NEXT',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            onPressed: () {
                              if (!(controller.page == 2.0)) {
                                controller.nextPage(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.linear);
                              }
                            },
                          )
                              : TextButton(
                            child: const Text(
                              'FINISH',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const MainScaffold()));
                            },
                          )
                        ],
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
