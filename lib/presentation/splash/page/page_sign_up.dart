import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets/image.dart';
import 'package:flutter_application_1/core/configs/theme/app_colors.dart';
import 'package:flutter_application_1/data/model/auth/create_user_rq.dart';
import 'package:flutter_application_1/domains/usecase/signUp_usecase.dart';
import 'package:flutter_application_1/getIt.dart';
import 'package:flutter_application_1/presentation/splash/page/page_home.dart';
import 'package:flutter_application_1/presentation/splash/page/page_sign_in.dart';
import 'package:flutter_application_1/presentation/splash/widget/util_appbar.dart';
import 'package:flutter_application_1/presentation/splash/widget/util_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _signIn = TextEditingController();
  final _passField = TextEditingController();
  final _repassField = TextEditingController();
  bool _isPasswordVisible = false;
  final bool _isPasswordError = false;
  final bool _isrePasswordError = false;
  // bool _isSignInError = false;
  @override
  void dispose() {
    _signIn.dispose();
    _passField.dispose();
    _repassField.dispose();
    super.dispose();
  }

  late final UserCredential userCredential;
  final _firebase = FirebaseAuth.instance;
  bool checkPass() {
    String pass = _passField.text;
    String repass = _repassField.text;
    if (pass != repass) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Mật khẩu không trùng khớp"),
      ));
      ScaffoldMessenger.of(context).clearSnackBars();
      return false;
    }
    if (pass.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Mật khẩu phải lớn hơn 6 ký tự"),
      ));
      ScaffoldMessenger.of(context).clearSnackBars();
      return false;
    }
    return true;
  }

  void checkRePass() async {
    checkPass();
    try {
      userCredential = await _firebase.createUserWithEmailAndPassword(
        email: _signIn.text.trim(),
        password: _passField.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Bạn đã đăng ký thành công"),
      ));
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => const HomePage()), // Thay HomePage bằng trang bạn muốn điều hướng đến
      // );
    } on FirebaseAuthException catch (error) {
      String errorMessage = "Đã xảy ra lỗi, vui lòng thử lại.";
      if (error.code == 'email-already-in-use') {
        errorMessage = "Email đã tồn tại.";
      } else if (error.code == 'weak-password') {
        errorMessage = "Mật khẩu quá yếu.";
      } else if (error.code == 'invalid-email') {
        errorMessage = "Email không hợp lệ.";
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorMessage),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Đã xảy ra lỗi, vui lòng thử lại."),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
            height: 10,
          ),
          Text(
            "Đăng ký",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Nếu bạn cần bất cứ hỗ trợ nào ",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 12, fontWeight: FontWeight.normal),
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
                  style: TextStyle(color: AppColors.primary, fontSize: 13),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: Column(
              children: [
                TextField(
                  controller: _signIn,
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
                      borderSide:
                          const BorderSide(color: AppColors.primary, width: 2),
                    ),
                    fillColor: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 15,
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
                      borderSide: BorderSide(
                          color: _isPasswordError ? Colors.red : Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.primary, width: 2),
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
                  height: 15,
                ),
                TextField(
                  controller: _repassField,
                  obscureText: !_isPasswordVisible,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(color: Colors.black),
                    hintText: 'Nhập lại mật khẩu',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color:
                                _isrePasswordError ? Colors.red : Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.primary, width: 2),
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
                const SizedBox(
                  height: 20,
                ),
                UtilButton(
                  text: "Đăng Ký",
                  onPressed: () async {
                    var result = await getIt<SignupUsecase>().call(CreateUserRq(
                      email: _signIn.text.toString(),
                      password: _passField.text.toString(),
                    ));
                    print(result);
                    if (checkPass() == false) {
                      result.fold((l) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(l),
                        ));
                      }, (r) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(r.toString()),
                          ),
                        );
                        // MaterialPageRoute(
                        //   builder: (context) => const HomePage(),
                        // );
                      });
                    }
                  },
                  height: 70,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 2,
                  width: double.infinity,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      style: ButtonStyle(
                        iconSize: MaterialStateProperty.all(70),
                      ),
                      onPressed: checkRePass,
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
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Bạn đã có tài khoản? ",
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
                                      const LoginPage()));
                        },
                        child: const Text(
                          "Đăng nhập",
                          style: TextStyle(color: AppColors.primary),
                        ))
                  ],
                )
              ],
            ),
          ),
        ],
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
