import 'package:flutter/material.dart';
import 'package:owlmovie/constant/utils.dart';
import 'package:owlmovie/screens/home_screen.dart';
import 'package:owlmovie/screens/singup_screens.dart';
import 'package:owlmovie/widgets/button_widgets.dart';
import 'package:owlmovie/widgets/button_widgetsicon.dart';
import 'package:owlmovie/widgets/textfield_widgets.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  bool isView = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> loginStorage() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    if (localStorage.get('email') == emailController.text) {
      if (localStorage.get('pass') == passController.text) {
        await Alert(
                context: context,
                title: 'Login Successful!',
                style: const AlertStyle(
                    animationDuration: Duration(milliseconds: 200),
                    titleStyle: poppinsbold,
                    isButtonVisible: false),
                type: AlertType.success)
            .show();

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      } else {
        Alert(
                context: context,
                title: 'Wrong Password!',
                style: const AlertStyle(
                    animationDuration: Duration(milliseconds: 200),
                    titleStyle: poppinsbold,
                    isButtonVisible: false),
                type: AlertType.warning)
            .show();
        passController.clear();
      }
    } else {
      Alert(
              context: context,
              title: 'Email not Register!',
              style: const AlertStyle(
                  animationDuration: Duration(milliseconds: 200),
                  titleStyle: poppinsbold,
                  isButtonVisible: false),
              type: AlertType.warning)
          .show();
      emailController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(17),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Image.asset('assets/images/logo_owlexa.png'),
                ),
                const Text(
                  'Sign In',
                  style: popinsHeader,
                ),
                Text(
                  'Please login first before using the Owlexa Application',
                  style: poppinsLight.copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                  isPass: false,
                  hintext: 'Email',
                  style: poppinsLight.copyWith(color: Colors.grey[500]),
                  textInputType: TextInputType.emailAddress,
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter your name!";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    emailController.text = value!;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                  isPass: true,
                  hintext: 'Password',
                  style: poppinsLight.copyWith(color: Colors.grey[500]),
                  textInputType: TextInputType.emailAddress,
                  controller: passController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter your Password!";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    passController.text = value!;
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    child: Text(
                      'Forgot Password?',
                      style: poppinsbold12.copyWith(
                        color: const Color(0xff00B2C7),
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      child: AnimatedContainer(
                        duration: const Duration(microseconds: 500),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            color: isView
                                ? const Color(0xff00B2C7)
                                : Colors.transparent,
                            border: isView
                                ? Border.all(color: Colors.transparent)
                                : Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          isView = !isView;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Remember Me',
                      style: poppinsLight.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  color: const Color(0xff00B2C7),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      loginStorage();
                    }
                  },
                  text: 'Login',
                  style: poppinsbold.copyWith(color: Colors.white),
                ),
                ButtonWidget2(
                  image: 'assets/images/logo_google.png',
                  onPressed: () {},
                  text: 'Sign in with Google',
                  style: poppinsbold.copyWith(color: Colors.grey),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don’t have an account yet ? ',
                      style: poppinsLight,
                    ),
                    InkWell(
                      child: Text(
                        'Sign Up',
                        style: poppinsbold12.copyWith(
                          color: const Color(0xff00B2C7),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupScreen()));
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
