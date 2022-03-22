import 'package:flutter/material.dart';
import 'package:owlmovie/constant/utils.dart';
import 'package:owlmovie/screens/login_screens.dart';
import 'package:owlmovie/widgets/button_widgets.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuProfil extends StatefulWidget {
  const MenuProfil({Key? key}) : super(key: key);

  @override
  State<MenuProfil> createState() => _MenuProfilState();
}

class _MenuProfilState extends State<MenuProfil> {
  static late String name;
  static late String email;

  static Future<void> fetchLogin() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    name = localStorage.get('name').toString();
    email = localStorage.get('email').toString();
  }

  @override
  void initState() {
    super.initState();
    fetchLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 10),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  child: Image.asset(
                    'assets/images/icons_back.png',
                    height: 30,
                    width: 30,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    child: Image.asset('assets/images/Ellipse1.png'),
                  ),
                  Text((name != null) ? 'Hi,$name' : 'Loading'),
                  Text((email != null) ? email : 'Loading'),
                ],
              ),
              const SizedBox(
                height: 36,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Account',
                      style:
                          poppinsbold.copyWith(color: const Color(0xff718493)),
                    ),
                    const CardMenu(
                      image: 'assets/images/account_setting.png',
                      text: 'Account Setting',
                      iconData: Icons.arrow_forward_ios,
                    ),
                    const CardMenu(
                      image: 'assets/images/history.png',
                      text: 'History',
                      iconData: Icons.arrow_forward_ios,
                    ),
                    const CardMenu(
                      image: 'assets/images/rate.png',
                      text: 'Rate This Apps',
                      iconData: Icons.arrow_forward_ios,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Text('Other Info',
                        style: poppinsbold.copyWith(
                            color: const Color(0xff718493))),
                    const SizedBox(
                      height: 8,
                    ),
                    const CardMenu2(
                      text: 'About this Apps',
                      iconData: Icons.arrow_forward_ios,
                    ),
                    const CardMenu2(
                      text: 'Privacy Policy',
                      iconData: Icons.arrow_forward_ios,
                    ),
                    const CardMenu2(
                      text: 'FAQ',
                      iconData: Icons.arrow_forward_ios,
                    ),
                    const CardMenu2(
                      text: 'Terms Of Service',
                      iconData: Icons.arrow_forward_ios,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ButtonWidget(
                      onPressed: () async {
                        Alert(
                                buttons: [
                              DialogButton(
                                  color: Colors.blue,
                                  child: Text(
                                    'Cancel',
                                    style: poppinsbold.copyWith(
                                        color: Colors.white),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }),
                              DialogButton(
                                  color: Colors.red,
                                  child: Text(
                                    'OK',
                                    style: poppinsbold.copyWith(
                                        color: Colors.white),
                                  ),
                                  onPressed: () async {
                                    SharedPreferences localStorage =
                                        await SharedPreferences.getInstance();
                                    localStorage.clear();
                                    await Alert(
                                            context: context,
                                            title: 'Delete Success!',
                                            style: const AlertStyle(
                                                animationDuration:
                                                    Duration(milliseconds: 200),
                                                titleStyle: poppinsbold,
                                                isButtonVisible: false),
                                            type: AlertType.success)
                                        .show();

                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen()));
                                  })
                            ],
                                context: context,
                                title: 'Are You Sure?',
                                desc:
                                    'This Would delete your personal data permanently from our system.This action cannot be undone.',
                                style: const AlertStyle(
                                    isButtonVisible: true,
                                    animationDuration:
                                        Duration(milliseconds: 200),
                                    titleStyle: poppinsbold,
                                    descStyle: poppinsLight),
                                type: AlertType.warning)
                            .show();
                      },
                      text: 'Remove Account',
                      style: poppinsbold,
                      color: Color(0xffef5350),
                    ),
                    ButtonWidget(
                      onPressed: () async {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      text: 'Log Out',
                      style: poppinsbold,
                      color: Color(0xff00B2C7),
                    )
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}

class CardMenu extends StatelessWidget {
  const CardMenu({
    required this.image,
    required this.text,
    required this.iconData,
    Key? key,
  }) : super(key: key);

  final String image;
  final String text;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Image.asset(image),
            const SizedBox(
              width: 6,
            ),
            Text(
              text,
              style: poppinsLight,
            ),
            const Spacer(),
            Icon(
              iconData,
              color: Colors.grey[300],
              size: 16,
            )
          ],
        ),
      ),
    );
  }
}

class CardMenu2 extends StatelessWidget {
  const CardMenu2({
    required this.text,
    required this.iconData,
    Key? key,
  }) : super(key: key);

  final String text;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Text(
              text,
              style: poppinsLight,
            ),
            const Spacer(),
            Icon(
              iconData,
              color: Colors.grey[300],
              size: 16,
            )
          ],
        ),
      ),
    );
  }
}
