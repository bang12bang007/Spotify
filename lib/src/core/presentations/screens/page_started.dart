import 'package:flutter/material.dart';
import 'package:flutter_application_1/generates/assets.gen.dart';
import 'package:flutter_application_1/src/core/presentations/screens/page_choose_mode.dart';

import '../../common/widgets/common_button.dart';

class StartedPage extends StatefulWidget {
  const StartedPage({super.key});

  @override
  State<StartedPage> createState() => _StartedPageState();
}

class _StartedPageState extends State<StartedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Assets.svg.logo.svg(width: 60),
                  ),
                  const Spacer(),
                  Center(
                    child: Column(
                      children: [
                        const Text(
                          "Hòa mình vào từng giai điệu",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "Âm nhạc kết nối cảm xúc,",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          "mang đến những khoảnh khắc tuyệt vời.",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          "Hãy khám phá và tận hưởng từng giai điệu",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          " mọi lúc, mọi nơi!",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CommonButton(
                          text: "Bắt đầu",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const ChooseMode(),
                              ),
                            );
                          },
                          height: 80,
                        ),
                        const SizedBox(
                          height: 40,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
