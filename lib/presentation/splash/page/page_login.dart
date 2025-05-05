import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/assets/image.dart';
import 'package:flutter_application_1/core/configs/theme/app_colors.dart';
import 'package:flutter_application_1/presentation/splash/page/page_home.dart';
import 'package:flutter_application_1/presentation/splash/page/page_loading.dart';
import 'package:flutter_application_1/presentation/splash/page/page_sign_in.dart';
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
  bool _isPasswordVisible = false;
  final _firebaseAuth = FirebaseAuth.instance;
  @override
  void dispose() {
    _loginField.dispose();
    _passField.dispose();
    super.dispose();
  }

  void signIn() async {
    final String email = _loginField.text.trim();
    final String password = _passField.text.trim();
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email hoặc mật khẩu không được để trống"),
        ),
      );
      return;
    }
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } on FirebaseAuthException catch (error) {
      String message = "Đăng nhập thất bại";
      if (error.code == "user-not-found") {
        message = "Không tìm thấy tài khoản";
      }
      if (error.code == "wrong-password") {
        message = "Sai mật khẩu";
      }
      if (error.code == "invalid-email") {
        message = "Email không hợp lệ";
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Đã có lỗi xảy ra"),
        ),
      );
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
                      borderSide:
                          const BorderSide(color: AppColors.primary, width: 2),
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
                  onPressed: () {
                    signIn();
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
                        iconSize: MaterialStateProperty.all(70),
                      ),
                      onPressed: test,
                      icon: const Icon(Icons.apple),
                    ),
                    IconButton(
                      onPressed: signIn,
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
