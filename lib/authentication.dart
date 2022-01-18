import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'dart:developer' as dev;

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AuthenticationPage();
}

class _AuthenticationPage extends State<AuthenticationPage> {
  int currentPage = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AuthenticationHeader(
            pageIndex: currentPage,
            signInClick: () => _onPageClicked(0),
            signUpClick: () => _onPageClicked(1),
          ),
          Expanded(
              child: PageView(
                  controller: _pageController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [SignInBody(), SignUpBody()]))
        ],
      ),
    );
  }

  _onPageClicked(int value) {
    setState(() {
      currentPage = value;
      _pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    });
  }
}

class SignUpBody extends StatelessWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          NewAccountHeader(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: NewAccountBody(),
          )
        ],
      ),
    );
  }
}

class NewAccountBody extends StatelessWidget {
  const NewAccountBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        inputFieldWrapper("Email", const TextField()),
        inputFieldWrapper("Username", const TextField()),
        inputFieldWrapper(
            "Password",
            const TextField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
            )),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Button(name: "SIGN UP"),
        )
      ],
    );
  }

  Padding inputFieldWrapper(String title, TextField textField) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.black54),
          ),
          textField
        ],
      ),
    );
  }
}

class NewAccountHeader extends StatelessWidget {
  const NewAccountHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          child: const Text(
            "New Account",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 100,
              child: Column(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.blue, width: 2)),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Image(
                        fit: BoxFit.contain,
                        image: AssetImage("assets/images/camera.png"),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "upload your profile picture",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class SignInBody extends StatelessWidget {
  const SignInBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          AccountInfoHeaderGroup(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 50),
            child: PasswordGroup(),
          ),
          Button(name: "SIGN IN"),
          AlternativeSignInOptionGroup()
        ],
      ),
    );
  }
}

class AccountInfoHeaderGroup extends StatelessWidget {
  const AccountInfoHeaderGroup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Welcome back,"),
                Text(
                  "Kenvin",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )
              ],
            )),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image:
                            AssetImage("assets/images/yellowavatar_icon.png"),
                        fit: BoxFit.cover)),
                width: 60,
                height: 60,
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 1.0),
          child: Text(
            "Oh no, this isn't me",
            style: TextStyle(color: Colors.blueAccent),
          ),
        ),
      ],
    );
  }
}

class AlternativeSignInOptionGroup extends StatelessWidget {
  const AlternativeSignInOptionGroup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20.0, bottom: 10),
          child: Center(child: Text('or sign in with')),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SocialMediaLoginButton(iconPath: "assets/images/fb_icon.png"),
            SocialMediaLoginButton(iconPath: "assets/images/go_icon.png")
          ],
        )
      ],
    );
  }
}

class Button extends StatelessWidget {
  final String name;
  const Button({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: const Color(0xA01472f7),
                spreadRadius: -20,
                blurRadius: 20,
                offset: Offset.fromDirection(pi / 2, 30))
          ]),
      child: Center(
        child: Text(name,
            style: const TextStyle(color: Colors.white, fontSize: 20),
            textAlign: TextAlign.center),
      ),
    );
  }
}

class PasswordGroup extends StatelessWidget {
  const PasswordGroup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        Text(
          "Password",
          style: TextStyle(color: Colors.black54),
        ),
        TextField(
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
        ),
        Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.blue),
          textAlign: TextAlign.end,
        )
      ],
    );
  }
}

class SocialMediaLoginButton extends StatelessWidget {
  final String iconPath;
  const SocialMediaLoginButton({
    Key? key,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(image: AssetImage(iconPath)),
        ),
        width: 35,
        height: 35,
      ),
    );
  }
}

class AuthenticationHeader extends StatelessWidget {
  final int pageIndex;
  final VoidCallback signUpClick;
  final VoidCallback signInClick;
  const AuthenticationHeader(
      {Key? key,
      required this.pageIndex,
      required this.signUpClick,
      required this.signInClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/splash.jpg"),
        fit: BoxFit.cover,
      )),
      height: 200,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 40),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: const Padding(
                  padding: EdgeInsets.all(5),
                  child: Image(
                    image: AssetImage("assets/images/logo.png"),
                    height: 40,
                    width: 40,
                  ),
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  tabButton('Sign In', pageIndex == 0, signInClick),
                  tabButton('Sign Up', pageIndex == 1, signUpClick)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget tabButton(String data, bool highlight, Function() callback) {
  return Expanded(
    child: InkWell(
      onTap: callback,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              data,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: highlight ? FontWeight.bold : FontWeight.normal),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: 5,
            decoration: BoxDecoration(
                color: highlight ? Colors.blue : Colors.transparent),
          )
        ],
      ),
    ),
  );
}
