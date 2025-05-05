import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets/image.dart';
import 'package:flutter_application_1/presentation/splash/widget/util_appbar.dart';
import 'package:flutter_application_1/presentation/splash/widget/util_button.dart';
import 'package:flutter_application_1/presentation/splash/bloc/theme_cubit.dart';
import 'package:flutter_application_1/presentation/splash/page/page_login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class ChooseMode extends StatefulWidget {
  const ChooseMode({super.key});

  @override
  State<ChooseMode> createState() => _ChooseModelState();
}

class _ChooseModelState extends State<ChooseMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            const UtilAppBar(),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(ImageUtils.choose), // background image
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: SvgPicture.asset(
                        ImageUtils.logo,
                        height: 60,
                        width: 60,
                      ),
                    ),
                    const Spacer(),
                    Center(
                      child: Column(
                        children: [
                          const Text(
                            "Chọn chế độ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                  height: 80,
                                  width: 80,
                                  decoration: const BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(40),
                                      )),
                                  child: GestureDetector(
                                    onTap: () {
                                      context
                                          .read<ThemeCubit>()
                                          .updateTheme(ThemeMode.light);
                                    },
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: const BoxDecoration(
                                        color: Colors.black54,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(40),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.sunny,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                    ),
                                  )),
                              Container(
                                  height: 80,
                                  width: 80,
                                  decoration: const BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(40),
                                      )),
                                  child: GestureDetector(
                                    onTap: () {
                                      context
                                          .read<ThemeCubit>()
                                          .updateTheme(ThemeMode.dark);
                                    },
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: const BoxDecoration(
                                        color: Colors.black54,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(40),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.dark_mode,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Chế độ sáng",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              Text(
                                "Chế độ tối",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          UtilButton(
                            text: "Tiếp tục",
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const LoginPage()));
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
            ),
          ],
        ),
      ),
    );
  }
}
