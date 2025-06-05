import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets/image.dart';
import 'package:flutter_application_1/core/configs/theme/app_colors.dart';
import 'package:flutter_application_1/domains/usecase/signIn_usecase.dart';
import 'package:flutter_application_1/getIt.dart';
import 'package:flutter_application_1/presentation/splash/bloc/auth/authen_state.dart';
import 'package:flutter_application_1/presentation/splash/bloc/auth/authentication_bloc.dart';
import 'package:flutter_application_1/presentation/splash/page/page_home.dart';
import 'package:flutter_application_1/presentation/splash/page/page_sign_up.dart';
import 'package:flutter_application_1/presentation/splash/widget/util_appbar.dart';
import 'package:flutter_application_1/presentation/splash/widget/util_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginField = TextEditingController();
  final _passField = TextEditingController();
  final _forcus = FocusNode();
  late final AuthenticationBloc _authenticationBloc;
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _authenticationBloc = getIt<AuthenticationBloc>();
  }

  @override
  void dispose() {
    _loginField.dispose();
    _passField.dispose();
    _forcus.dispose();
    _authenticationBloc.dispose();
    super.dispose();
  }

  void _onSignIn() {
    FocusScope.of(context).unfocus();
    _authenticationBloc.signIn(_loginField.text, _passField.text);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: StreamBuilder<AuthenState>(
          stream: _authenticationBloc.authSate,
          builder: (context, snapshot) {
            final state =
                snapshot.hasData ? snapshot.data : AuthenState.initial;
            return Column(
              children: [
                const UtilAppBar(),
                Center(
                  child: SvgPicture.asset(
                    ImageUtils.logo,
                    width: 60,
                    height: 60,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Đăng nhập",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Nếu bạn cần bất cứ hỗ trợ nào ",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 12, fontWeight: FontWeight.normal),
                    ),
                    TextButton(
                      onPressed: _launchURL,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'Nhấn vào đây',
                        style:
                            TextStyle(color: AppColors.primary, fontSize: 13),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                  child: Column(
                    children: [
                      TextField(
                        controller: _loginField,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(color: Colors.black),
                          hintText: 'Email hoặc tên tài khoản',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: AppColors.primary, width: 2),
                          ),
                          fillColor: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextField(
                        controller: _passField,
                        obscureText: !_isPasswordVisible,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(color: Colors.black),
                          hintText: 'Mật khẩu',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: AppColors.primary, width: 2),
                          ),
                          fillColor: AppColors.primary,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                            icon: _isPasswordVisible
                                ? const Icon(Icons.remove_red_eye_outlined)
                                : const Icon(Icons.remove_red_eye),
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Quên mật khẩu?",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.normal,
                              fontSize: 15),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      UtilButton(
                        text: "Đăng nhập",
                        onPressed: () async {
                          if (_loginField.text.isEmpty ||
                              _passField.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Vui long nhap day du thong tin")));
                          } else {
                            final result = await getIt<SigninUsecase>()
                                .call('${_loginField.text},${_passField.text}');
                            result.fold((l) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(l.toString())));
                            }, (r) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()));
                            });
                          }
                        },
                        height: 70,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 2,
                        width: double.infinity,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            style: ButtonStyle(
                              iconSize: WidgetStateProperty.all(70),
                            ),
                            onPressed: test,
                            icon: const Icon(Icons.apple),
                          ),
                          IconButton(
                            onPressed: null,
                            icon: SvgPicture.asset(
                              ImageUtils.gg,
                              width: 50,
                              height: 50,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Chưa có tài khoản? ",
                          ),
                          TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: const Size(0, 0),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const SignIn()));
                              },
                              child: const Text(
                                "Đăng ký ngay",
                                style: TextStyle(color: AppColors.primary),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

Future<void> _launchURL() async {
  const url = "https://support.spotify.com/vn-en/";
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Cound not launch';
  }
}

void test() {
  print("Oke");
}
